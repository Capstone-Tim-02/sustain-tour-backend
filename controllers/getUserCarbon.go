package controllers

import (
	"myproject/helper"
	"myproject/middleware"
	"myproject/model"
	"net/http"
	"strconv"
	"strings"

	"github.com/labstack/echo/v4"
	"gorm.io/gorm"
)

func GetTotalCarbonFootprintByUser(db *gorm.DB, secretKey []byte) echo.HandlerFunc {
	return func(c echo.Context) error {

		tokenString := c.Request().Header.Get("Authorization")
		if tokenString == "" {
			errorResponse := helper.ErrorResponse{Code: http.StatusUnauthorized, Message: "Authorization token is missing"}
			return c.JSON(http.StatusUnauthorized, errorResponse)
		}

		authParts := strings.SplitN(tokenString, " ", 2)
		if len(authParts) != 2 || authParts[0] != "Bearer" {
			errorResponse := helper.ErrorResponse{Code: http.StatusUnauthorized, Message: "Invalid token format"}
			return c.JSON(http.StatusUnauthorized, errorResponse)
		}

		tokenString = authParts[1]

		username, err := middleware.VerifyToken(tokenString, secretKey)
		if err != nil {
			errorResponse := helper.ErrorResponse{Code: http.StatusUnauthorized, Message: "Invalid token"}
			return c.JSON(http.StatusUnauthorized, errorResponse)
		}

		var currentUser model.User
		result := db.Where("username = ?", username).First(&currentUser)
		if result.Error != nil {
			errorResponse := helper.ErrorResponse{Code: http.StatusNotFound, Message: "User not found"}
			return c.JSON(http.StatusNotFound, errorResponse)
		}

		// Logic

		userStrID := c.Param("user_id")
		userID, err := strconv.ParseUint(userStrID, 10, 64)
		if err != nil {
			errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Invalid user ID"}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}

		if currentUser.IsAdmin || currentUser.ID == uint(userID) {
			var totalCarbonFootprint float64
			if err := db.Model(&model.Ticket{}).Where("user_id = ? AND paid_status = ?", userID, true).Select("COALESCE(SUM(carbon_footprint), 0)").Row().Scan(&totalCarbonFootprint); err != nil {
				errorResponse := helper.ErrorResponse{Code: http.StatusInternalServerError, Message: "Failed to calculate total carbon footprint"}
				return c.JSON(http.StatusInternalServerError, errorResponse)
			}

			// Rumus menulis aplikasi trip it 0,36tco2 setara dengan listrik 1 rumah selama 1 bulan
			// Setelah di kalkulasi didapatkan bahwa satu rumah membutuhkan 1000 gram co2 untuk daya listrik/jam
			carbonEquivalentHours := int(totalCarbonFootprint / 1000) // 1 jam = 1000 mg CO2
			roundedTotalCarbonFootprint := int(totalCarbonFootprint + 0.5)

			responseData := map[string]interface{}{
				"code":                               http.StatusOK,
				"error":                              false,
				"rounded_total_carbon_footprint":     roundedTotalCarbonFootprint,
				"equivalent_powering_house_in_hours": carbonEquivalentHours,
			}

			return c.JSON(http.StatusOK, responseData)
		}

		errorResponse := helper.ErrorResponse{Code: http.StatusForbidden, Message: "Access denied"}
		return c.JSON(http.StatusForbidden, errorResponse)

	}
}
