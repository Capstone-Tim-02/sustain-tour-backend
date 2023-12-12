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

func GetWisataByID(db *gorm.DB, secretKey []byte) echo.HandlerFunc {
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

		_, err := middleware.VerifyToken(tokenString, secretKey)
		if err != nil {
			errorResponse := helper.ErrorResponse{Code: http.StatusUnauthorized, Message: "Invalid token"}
			return c.JSON(http.StatusUnauthorized, errorResponse)
		}

		// Logic

		wisataIDParam := c.Param("id")

		wisataID, err := strconv.ParseUint(wisataIDParam, 10, 64)
		if err != nil {
			errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Invalid wisata ID"}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}

		var wisata model.Wisata
		if err := db.Preload("Category").First(&wisata, wisataID).Error; err != nil {
			if err == gorm.ErrRecordNotFound {
				errorResponse := helper.ErrorResponse{Code: http.StatusNotFound, Message: "Wisata not found"}
				return c.JSON(http.StatusNotFound, errorResponse)
			}
			errorResponse := helper.ErrorResponse{Code: http.StatusInternalServerError, Message: "Failed to fetch wisata"}
			return c.JSON(http.StatusInternalServerError, errorResponse)
		}

		var totalCarbonFootprint float64
		if err := db.Model(&model.Ticket{}).Select("COALESCE(SUM(carbon_footprint), 0)").Where("wisata_id = ? AND paid_status = ?", wisataID, true).Row().Scan(&totalCarbonFootprint); err != nil {
			errorResponse := helper.ErrorResponse{Code: http.StatusInternalServerError, Message: "Failed to calculate total carbon footprint"}
			return c.JSON(http.StatusInternalServerError, errorResponse)
		}

		response := map[string]interface{}{
			"code":                   http.StatusOK,
			"error":                  false,
			"wisata":                 wisata,
			"total_carbon_footprint": totalCarbonFootprint,
		}

		return c.JSON(http.StatusOK, response)

	}
}
