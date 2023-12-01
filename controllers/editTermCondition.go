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

func EditTermCondition(db *gorm.DB, secretKey []byte) echo.HandlerFunc {
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
			errorResponse := helper.ErrorResponse{Code: http.StatusNotFound, Message: "You are not an admin!"}
			return c.JSON(http.StatusNotFound, errorResponse)
		}

		if !adminUser.IsAdmin {
			errorResponse := helper.ErrorResponse{Code: http.StatusForbidden, Message: "You are not an admin and cannot edit term and condition data!"}
			return c.JSON(http.StatusForbidden, errorResponse)
		}

		tncID := c.Param("id")

		term := model.TermCondition{}
		result = db.First(&term, tncID)
		if result.Error != nil {
			errorResponse := helper.ErrorResponse{Code: http.StatusNotFound, Message: "Term and condition not found"}
			return c.JSON(http.StatusNotFound, errorResponse)
		}

		var req model.TermCondition
		if err := c.Bind(&req); err != nil {
			errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: err.Error()}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}

		// Validation for Name
		if req.Name != "" {
			if len(req.Name) < 5 {
				errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Name should be at least 5 characters"}
				return c.JSON(http.StatusBadRequest, errorResponse)
			}

			if len(req.Name) > 100 {
				errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Name maximum at least 100 characters"}
				return c.JSON(http.StatusBadRequest, errorResponse)
			}

			// Check if the new name already exists
			var existingTerm model.TermCondition
			if err := db.Where("name = ? AND id != ?", req.Name, tncID).First(&existingTerm).Error; err == nil {
				errorResponse := helper.ErrorResponse{Code: http.StatusConflict, Message: "Term and condition with the same name already exists"}
				return c.JSON(http.StatusConflict, errorResponse)
			}

			term.Name = req.Name
		}

		// Validation for Description
		if req.Description != "" {
			if len(req.Description) < 10 {
				errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Description should be at least 10 characters"}
				return c.JSON(http.StatusBadRequest, errorResponse)
			}

			if len(req.Description) > 2000 {
				errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Description maximum at least 2000 characters"}
				return c.JSON(http.StatusBadRequest, errorResponse)
			}

			term.Description = req.Description
		}

		db.Save(&term)

		return c.JSON(http.StatusOK, map[string]interface{}{"code": http.StatusOK, "error": false, "message": "Term and condition updated successfully"})
	}
}
