package controllers

import (
	"fmt"
	"github.com/labstack/echo/v4"
	"gorm.io/gorm"
	"myproject/helper"
	"myproject/middleware"
	"myproject/model"
	"net/http"
	"strconv"
	"strings"
)

// Nambahin Pagination
func GetWisatas(db *gorm.DB, secretKey []byte) echo.HandlerFunc {
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

		var user model.User
		result := db.Where("username = ?", username).First(&user)
		if result.Error != nil {
			errorResponse := helper.ErrorResponse{Code: http.StatusInternalServerError, Message: "Failed to fetch user data"}
			return c.JSON(http.StatusInternalServerError, errorResponse)
		}

		// Mendapatkan nilai query parameter "title"
		title := c.QueryParam("title")
		kota := c.QueryParam("kota")
		categoryNames := c.QueryParams()["category_name"]

		page, err := strconv.Atoi(c.QueryParam("page"))
		if err != nil || page < 1 {
			page = 1
		}

		limit, err := strconv.Atoi(c.QueryParam("limit"))
		if err != nil || limit < 1 {
			limit = 100 // Jumlah default item per halaman
		}

		offset := (page - 1) * limit

		var wisata []model.Wisata

		if title != "" || kota != "" || len(categoryNames) > 0 {
			// Jika parameter "title", "kota", atau "category_name" diisi, lakukan pencarian berdasarkan judul, kota, dan/atau category_name
			query := db.Preload("Category").Offset(offset).Limit(limit)

			if title != "" {
				query = query.Where("title LIKE ?", "%"+title+"%")
			}

			if kota != "" {
				query = query.Where("kota LIKE ?", "%"+kota+"%")
			}

			if len(categoryNames) > 0 {
				// Mencari wisata berdasarkan multiple category_name
				query = query.Joins("JOIN categories ON wisata.category_id = categories.id").
					Where("categories.category_name IN ?", categoryNames)
			}

			if err := query.Find(&wisata).Error; err != nil {
				errorResponse := helper.ErrorResponse{Code: http.StatusInternalServerError, Message: "Failed to fetch wisatas"}
				return c.JSON(http.StatusInternalServerError, errorResponse)
			}
		} else {
			// Jika parameter "title", "kota", dan "category_name" tidak diisi, tampilkan semua wisata
			if err := db.Preload("Category").Offset(offset).Limit(limit).Find(&wisata).Error; err != nil {
				// Log the error for debugging
				fmt.Println("Error fetching wisatas:", err)

				errorResponse := helper.ErrorResponse{Code: http.StatusInternalServerError, Message: "Failed to fetch wisatas"}
				return c.JSON(http.StatusInternalServerError, errorResponse)
			}
		}

		return c.JSON(http.StatusOK, map[string]interface{}{"code": http.StatusOK, "error": false, "wisatas": wisata})
	}
}
