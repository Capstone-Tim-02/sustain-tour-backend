package controllers

import (
	"github.com/labstack/echo/v4"
	"gorm.io/gorm"
	"myproject/helper"
	"myproject/middleware"
	"myproject/model"
	"net/http"
	"strings"
)

func GetTotalWisataCount(db *gorm.DB, secretKey []byte) echo.HandlerFunc {
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

		var adminUser model.User
		result := db.Where("username = ?", username).First(&adminUser)
		if result.Error != nil {
			errorResponse := helper.ErrorResponse{Code: http.StatusInternalServerError, Message: "Failed to fetch admin data"}
			return c.JSON(http.StatusInternalServerError, errorResponse)
		}

		if !adminUser.IsAdmin {
			errorResponse := helper.ErrorResponse{Code: http.StatusForbidden, Message: "Only admin can access this endpoint"}
			return c.JSON(http.StatusForbidden, errorResponse)
		}

		var totalWisataCount int64
		if err := db.Model(&model.Wisata{}).Count(&totalWisataCount).Error; err != nil {
			errorResponse := helper.ErrorResponse{Code: http.StatusInternalServerError, Message: "Failed to fetch total wisata count"}
			return c.JSON(http.StatusInternalServerError, errorResponse)
		}

		return c.JSON(http.StatusOK, map[string]interface{}{"code": http.StatusOK, "error": false, "totalWisataCount": totalWisataCount})
	}
}
