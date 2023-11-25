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

func EditUserLocation(db *gorm.DB, secretKey []byte) echo.HandlerFunc {
	return func(c echo.Context) error {
		// Mengambil token dari header
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

		// Memverifikasi token
		username, err := middleware.VerifyToken(tokenString, secretKey)
		if err != nil {
			errorResponse := helper.ErrorResponse{Code: http.StatusUnauthorized, Message: "Invalid token"}
			return c.JSON(http.StatusUnauthorized, errorResponse)
		}

		// Mendapatkan ID pengguna yang akan diedit
		userID := c.Param("id")

		var user model.User
		if err := db.First(&user, userID).Error; err != nil {
			errorResponse := helper.ErrorResponse{Code: http.StatusNotFound, Message: "User not found"}
			return c.JSON(http.StatusNotFound, errorResponse)
		}

		// Memeriksa otorisasi
		if user.Username != username {
			errorResponse := helper.ErrorResponse{Code: http.StatusUnauthorized, Message: "Unauthorized to edit this user"}
			return c.JSON(http.StatusUnauthorized, errorResponse)
		}

		var updateLocation model.User
		if err := c.Bind(&updateLocation); err != nil {
			errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: err.Error()}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}

		// Memperbarui data Lat dan Long
		if updateLocation.Lat != 0 {
			user.Lat = updateLocation.Lat
		}
		if updateLocation.Long != 0 {
			user.Long = updateLocation.Long
		}

		if err := db.Save(&user).Error; err != nil {
			errorResponse := helper.ErrorResponse{Code: http.StatusInternalServerError, Message: "Failed to update user location"}
			return c.JSON(http.StatusInternalServerError, errorResponse)
		}

		userResponse := helper.EditUserLocation{
			ID:   user.ID,
			Lat:  user.Lat,
			Long: user.Long,
		}

		return c.JSON(http.StatusOK, map[string]interface{}{
			"code":    http.StatusOK,
			"error":   false,
			"message": "User location updated successfully",
			"user":    userResponse,
		})
	}
}
