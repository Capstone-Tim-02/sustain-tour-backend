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

func UpdateCategoryByAdmin(db *gorm.DB, secretKey []byte) echo.HandlerFunc {
	return func(c echo.Context) error {
		tokenString := c.Request().Header.Get("Authorization")
		if tokenString == "" {
			errorResponse := helper.Response{Code: http.StatusUnauthorized, Error: true, Message: "Authorization token is missing"}
			return c.JSON(http.StatusUnauthorized, errorResponse)
		}

		authParts := strings.SplitN(tokenString, " ", 2)
		if len(authParts) != 2 || authParts[0] != "Bearer" {
			errorResponse := helper.Response{Code: http.StatusUnauthorized, Error: true, Message: "Invalid token format"}
			return c.JSON(http.StatusUnauthorized, errorResponse)
		}

		tokenString = authParts[1]

		username, err := middleware.VerifyToken(tokenString, secretKey)
		if err != nil {
			errorResponse := helper.Response{Code: http.StatusUnauthorized, Error: true, Message: "Invalid token"}
			return c.JSON(http.StatusUnauthorized, errorResponse)
		}

		var adminUser model.User
		result := db.Where("username = ?", username).First(&adminUser)
		if result.Error != nil {
			errorResponse := helper.Response{Code: http.StatusNotFound, Error: true, Message: "Admin user not found"}
			return c.JSON(http.StatusNotFound, errorResponse)
		}

		if !adminUser.IsAdmin {
			errorResponse := helper.Response{Code: http.StatusForbidden, Error: true, Message: "Access denied"}
			return c.JSON(http.StatusForbidden, errorResponse)
		}

		categoryID, err := helper.ConvertParamToUint(c.Param("id"))
		if err != nil {
			errorResponse := helper.Response{Code: http.StatusBadRequest, Error: true, Message: "Invalid category ID"}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}

		var existingCategory model.Category
		result = db.First(&existingCategory, categoryID)
		if result.Error != nil {
			errorResponse := helper.Response{Code: http.StatusNotFound, Error: true, Message: "Category not found"}
			return c.JSON(http.StatusNotFound, errorResponse)
		}

		var updatedCategory model.Category
		if err := c.Bind(&updatedCategory); err != nil {
			errorResponse := helper.Response{Code: http.StatusBadRequest, Error: true, Message: "Invalid request body"}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}

		if len(updatedCategory.CategoryName) < 5 {
			errorResponse := helper.Response{Code: http.StatusBadRequest, Error: true, Message: "Category name must be at least 5 characters"}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}

		if len(updatedCategory.CategoryName) > 30 {
			errorResponse := helper.Response{Code: http.StatusBadRequest, Error: true, Message: "Category maximum at least 30 characters"}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}

		if updatedCategory.CategoryName != existingCategory.CategoryName {
			var categoryWithSameName model.Category
			if err := db.Where("category_name = ?", updatedCategory.CategoryName).First(&categoryWithSameName).Error; err == nil {
				// Category dengan nama tersebut sudah ada
				errorResponse := helper.Response{Code: http.StatusConflict, Error: true, Message: "Category with this name already exists"}
				return c.JSON(http.StatusConflict, errorResponse)
			}
		}

		// Update only the specified fields
		db.Model(&existingCategory).Updates(updatedCategory)

		successResponse := helper.Response{Code: http.StatusOK, Error: false, Message: "Category updated successfully", Category: &existingCategory}
		return c.JSON(http.StatusOK, successResponse)
	}
}
