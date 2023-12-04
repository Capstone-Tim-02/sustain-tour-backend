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

func CreateTermCondition(db *gorm.DB, secretKey []byte) echo.HandlerFunc {
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
			errorResponse := helper.ErrorResponse{Code: http.StatusNotFound, Message: "Admin user not found"}
			return c.JSON(http.StatusNotFound, errorResponse)
		}

		if !adminUser.IsAdmin {
			errorResponse := helper.ErrorResponse{Code: http.StatusForbidden, Message: "Access denied"}
			return c.JSON(http.StatusForbidden, errorResponse)
		}

		var term model.TermCondition
		if err := c.Bind(&term); err != nil {
			errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Invalid request body"}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}

		// Validasi panjang karakter input
		if len(term.Name) < 5 {
			errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Name should be at least 5 characters"}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}

		if len(term.Name) > 100 {
			errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Name maximum at least 100 characters"}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}

		if len(term.Description) < 10 {
			errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Description should be at least 10 characters"}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}

		if len(term.Description) > 2000 {
			errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Description maximum at least 2000 characters"}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}

		// Check if tnc_name already exists
		var existingTerm model.TermCondition
		if err := db.Where("name = ?", term.Name).First(&existingTerm).Error; err == nil {
			errorResponse := helper.ErrorResponse{Code: http.StatusConflict, Message: "Term and condition with the same name already exists"}
			return c.JSON(http.StatusConflict, errorResponse)
		}

		// Create the new term and condition
		db.Create(&term)

		return c.JSON(http.StatusCreated, map[string]interface{}{"code": http.StatusCreated, "error": false, "term_condition": term})
	}
}
