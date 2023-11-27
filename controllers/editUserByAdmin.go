package controllers

import (
	"myproject/helper"
	"myproject/middleware"
	"myproject/model"
	"net/http"
	"strings"

	"github.com/labstack/echo/v4"
	"gorm.io/gorm"
)

func EditUserByAdmin(db *gorm.DB, secretKey []byte) echo.HandlerFunc {
	return func(c echo.Context) error {

		// Token validation and admin check logic
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
			errorResponse := helper.ErrorResponse{Code: http.StatusNotFound, Message: "You are not an admin!"}
			return c.JSON(http.StatusNotFound, errorResponse)
		}

		if !adminUser.IsAdmin {
			errorResponse := helper.ErrorResponse{Code: http.StatusForbidden, Message: "You are not an admin and cannot edit other user's data!"}
			return c.JSON(http.StatusForbidden, errorResponse)
		}

		userID := c.Param("id")

		var user model.User
		result = db.First(&user, userID)
		if result.Error != nil {
			errorResponse := helper.ErrorResponse{Code: http.StatusNotFound, Message: "User not found"}
			return c.JSON(http.StatusNotFound, errorResponse)
		}

		var req model.User
		if err := c.Bind(&req); err != nil {
			errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: err.Error()}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}

		// Validate username
		if req.Username != "" && req.Username != user.Username {
			if len(req.Username) < 5 {
				errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Username must be at least 5 characters"}
				return c.JSON(http.StatusBadRequest, errorResponse)
			}

			var existingUserByUsername model.User
			if db.Where("username = ?", req.Username).Not("id = ?", user.ID).First(&existingUserByUsername).Error == nil {
				errorResponse := helper.ErrorResponse{Code: http.StatusConflict, Message: "Username is already taken"}
				return c.JSON(http.StatusConflict, errorResponse)
			}
			user.Username = req.Username
		}

		// Validate phone_number
		if req.PhoneNumber != "" && req.PhoneNumber != user.PhoneNumber {
			if !helper.IsValidPhoneNumber(req.PhoneNumber) {
				errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Invalid phone number must have minimum 10 digits of numbers only"}
				return c.JSON(http.StatusBadRequest, errorResponse)
			}

			var existingUserByPhone model.User
			if db.Where("phone_number = ?", req.PhoneNumber).Not("id = ?", user.ID).First(&existingUserByPhone).Error == nil {
				errorResponse := helper.ErrorResponse{Code: http.StatusConflict, Message: "Phone number is already taken"}
				return c.JSON(http.StatusConflict, errorResponse)
			}
			user.PhoneNumber = req.PhoneNumber
		}

		// Validate email
		if req.Email != "" && req.Email != user.Email {
			if !helper.IsValidEmail(req.Email) {
				errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Invalid email format"}
				return c.JSON(http.StatusBadRequest, errorResponse)
			}

			var existingUserByEmail model.User
			if db.Where("email = ?", req.Email).Not("id = ?", user.ID).First(&existingUserByEmail).Error == nil {
				errorResponse := helper.ErrorResponse{Code: http.StatusConflict, Message: "Email is already taken"}
				return c.JSON(http.StatusConflict, errorResponse)
			}
			user.Email = req.Email
		}

		// Validate name
		if req.Name != "" && req.Name != user.Name {
			if len(req.Name) < 3 {
				errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Name must be at least 3 characters"}
				return c.JSON(http.StatusBadRequest, errorResponse)
			}
			user.Name = req.Name
		}

		// Update user data
		if err := db.Save(&user).Error; err != nil {
			errorResponse := helper.ErrorResponse{Code: http.StatusInternalServerError, Message: "Failed to update user"}
			return c.JSON(http.StatusInternalServerError, errorResponse)
		}

		return c.JSON(http.StatusOK, map[string]interface{}{"code": http.StatusOK, "error": false, "message": "User updated successfully"})
	}
}
