package controllers

import (
	"fmt"
	"myproject/helper"
	"myproject/middleware"
	"myproject/model"
	"net/http"
	"strings"

	"github.com/labstack/echo/v4"
	"golang.org/x/crypto/bcrypt"
	"gorm.io/gorm"
)

func ChangePassword(db *gorm.DB, secretKey []byte) echo.HandlerFunc {
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

		userID := c.Param("id")

		var user model.User
		result := db.Where("username = ?", username).First(&user)
		if result.Error != nil {
			errorResponse := helper.ErrorResponse{Code: http.StatusNotFound, Message: "User not found"}
			return c.JSON(http.StatusNotFound, errorResponse)
		}

		if userID != fmt.Sprint(user.ID) {
			errorResponse := helper.ErrorResponse{Code: http.StatusForbidden, Message: "Access denied"}
			return c.JSON(http.StatusForbidden, errorResponse)
		}

		var req model.ChangePasswordRequest
		if err := c.Bind(&req); err != nil {
			errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: err.Error()}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}

		// Validasi password baru
		if len(req.NewPassword) < 8 || !helper.IsValidPassword(req.NewPassword) {
			errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "New password must be at least 8 characters and contain a combination of letters and numbers"}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}

		// Validasi konfirmasi password
		if req.NewPassword != req.ConfirmPassword {
			errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Confirmation password does not match the new password"}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}

		// Validasi password baru tidak sama dengan password sekarang
		err = bcrypt.CompareHashAndPassword([]byte(user.Password), []byte(req.NewPassword))
		if err == nil {
			errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "New password must be different from the current password"}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}

		// Validasi password sekarang
		err = bcrypt.CompareHashAndPassword([]byte(user.Password), []byte(req.CurrentPassword))
		if err != nil {
			errorResponse := helper.ErrorResponse{Code: http.StatusUnauthorized, Message: "Incorrect current password"}
			return c.JSON(http.StatusUnauthorized, errorResponse)
		}

		// Mengenkripsi password baru
		hashedNewPassword, err := bcrypt.GenerateFromPassword([]byte(req.NewPassword), bcrypt.DefaultCost)
		if err != nil {
			errorResponse := helper.ErrorResponse{Code: http.StatusInternalServerError, Message: "Failed to hash new password"}
			return c.JSON(http.StatusInternalServerError, errorResponse)
		}

		// Menyimpan password baru yang dienkripsi ke database
		user.Password = string(hashedNewPassword)
		db.Save(&user)

		return c.JSON(http.StatusOK, map[string]interface{}{"code": http.StatusOK, "error": false, "message": "Password updated successfully"})
	}
}
