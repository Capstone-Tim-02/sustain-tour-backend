package controllers

import (
	"fmt"
	"io"
	"myproject/helper"
	"myproject/middleware"
	"myproject/model"
	"net/http"
	"strings"
	"time"

	"github.com/labstack/echo/v4"
	"gorm.io/gorm"
)

func EditUser(db *gorm.DB, secretKey []byte) echo.HandlerFunc {

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

		// Logic

		userID := c.Param("id")

		var user model.User
		if err := db.First(&user, userID).Error; err != nil {
			errorResponse := helper.ErrorResponse{Code: http.StatusNotFound, Message: "User not found"}
			return c.JSON(http.StatusNotFound, errorResponse)
		}

		if user.Username != username {
			errorResponse := helper.ErrorResponse{Code: http.StatusUnauthorized, Message: "Unauthorized to edit this user"}
			return c.JSON(http.StatusUnauthorized, errorResponse)
		}

		err = c.Request().ParseMultipartForm(10 << 20)
		if err != nil {
			errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Failed to parse form data"}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}

		newName := c.FormValue("name")
		if newName != "" && len(newName) < 3 {
			errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Name should be at least 3 characters"}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}

		newUsername := c.FormValue("username")
		if newUsername != "" && len(newUsername) < 5 {
			errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Username should be at least 5 characters"}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}
		if newUsername != "" && newUsername != user.Username {
			var existingUser model.User
			if err := db.Where("username = ?", newUsername).First(&existingUser).Error; err == nil {
				errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Username already exists"}
				return c.JSON(http.StatusBadRequest, errorResponse)
			}
		}

		newEmail := c.FormValue("email")
		if newEmail != "" && !helper.IsValidEmail(newEmail) {
			errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Invalid email format"}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}
		if newEmail != "" && newEmail != user.Email {
			var existingUser model.User
			if err := db.Where("email = ?", newEmail).First(&existingUser).Error; err == nil {
				errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Email already exists"}
				return c.JSON(http.StatusBadRequest, errorResponse)
			}
		}

		newPhoneNumber := c.FormValue("phone_number")
		if newPhoneNumber != "" {

			if len(newPhoneNumber) < 10 {
				errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Phone number should be at least 10 digits"}
				return c.JSON(http.StatusBadRequest, errorResponse)
			}
			if !helper.IsValidPhoneNumber(newPhoneNumber) {
				errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Invalid phone number format"}
				return c.JSON(http.StatusBadRequest, errorResponse)
			}

			if newPhoneNumber != user.PhoneNumber {
				var existingUser model.User
				if err := db.Where("phone_number = ?", newPhoneNumber).First(&existingUser).Error; err == nil {
					errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Phone number already exists"}
					return c.JSON(http.StatusBadRequest, errorResponse)
				}
			}
		}

		profileImageFile, err := c.FormFile("profile_image")
		if err == nil {
			if !helper.IsImageFile(profileImageFile) {
				errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Invalid image format"}
				return c.JSON(http.StatusBadRequest, errorResponse)
			}

			if !helper.IsFileSizeExceeds(profileImageFile, 5*1024*1024) {
				src, err := profileImageFile.Open()
				if err == nil {
					defer src.Close()
					imageData, err := io.ReadAll(src)
					if err == nil {
						timestamp := time.Now().Unix()
						imageName := fmt.Sprintf("users/user%d/profile_%d.jpg", user.ID, timestamp)
						imageURL, err := helper.UploadImageToGCS(imageData, imageName)
						if err == nil {
							user.PhotoProfil = imageURL
						}
					}
				}
			}
		}

		name := c.FormValue("name")
		username = c.FormValue("username")
		email := c.FormValue("email")
		phoneNumber := c.FormValue("phone_number")
		categoryKesukaan := c.FormValue("category_kesukaan")

		if categoryKesukaan != "" {
			var category model.Category
			result := db.Where("category_name = ?", categoryKesukaan).First(&category)
			if result.Error != nil {
				errorResponse := helper.ErrorResponse{Code: http.StatusNotFound, Message: "Category not found"}
				return c.JSON(http.StatusNotFound, errorResponse)
			}
			user.CategoryKesukaan = categoryKesukaan
			user.CategoryID = category.ID
		}

		if name != "" {
			user.Name = name
		}
		if username != "" {
			user.Username = username
		}
		if email != "" {
			user.Email = email
		}
		if phoneNumber != "" {
			user.PhoneNumber = phoneNumber
		}

		if err := db.Save(&user).Error; err != nil {
			errorResponse := helper.ErrorResponse{Code: http.StatusInternalServerError, Message: "Failed to update user"}
			return c.JSON(http.StatusInternalServerError, errorResponse)
		}

		newTokenString, err := middleware.GenerateToken(user.Username, secretKey)
		if err != nil {
			errorResponse := helper.ErrorResponse{Code: http.StatusInternalServerError, Message: "Failed to generate token"}
			return c.JSON(http.StatusInternalServerError, errorResponse)
		}

		userResponse := helper.EditUserResponse{
			ID:               user.ID,
			Name:             user.Name,
			Username:         user.Username,
			Email:            user.Email,
			PhoneNumber:      user.PhoneNumber,
			PhotoProfil:      user.PhotoProfil,
			CategoryKesukaan: user.CategoryKesukaan,
			CategoryID:       user.CategoryID,
		}

		return c.JSON(http.StatusOK, map[string]interface{}{
			"code":    http.StatusOK,
			"error":   false,
			"message": "User updated successfully",
			"user":    userResponse,
			"token":   newTokenString,
		})

	}
}
