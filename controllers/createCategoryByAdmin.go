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

func CreateCategoryByAdmin(db *gorm.DB, secretKey []byte) echo.HandlerFunc {
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

		var category model.Category
		if err := c.Bind(&category); err != nil {
			errorResponse := helper.Response{Code: http.StatusBadRequest, Error: true, Message: "Invalid request body"}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}

		if len(category.CategoryName) < 5 {
			errorResponse := helper.Response{Code: http.StatusBadRequest, Error: true, Message: "Category name must be at least 5 characters"}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}

		if len(category.CategoryName) > 30 {
			errorResponse := helper.Response{Code: http.StatusBadRequest, Error: true, Message: "Category name maximum at least 30 characters"}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}

		existingCategory := model.Category{}
		if err := db.Where("category_name = ?", category.CategoryName).First(&existingCategory).Error; err == nil {
			// Category dengan nama tersebut sudah ada
			errorResponse := helper.Response{Code: http.StatusConflict, Error: true, Message: "Category with this name already exists"}
			return c.JSON(http.StatusConflict, errorResponse)
		}

		db.Create(&category)

		successResponse := helper.Response{Code: http.StatusCreated, Error: false, Message: "Category created successfully", Category: &category}
		return c.JSON(http.StatusCreated, successResponse)
	}
}
