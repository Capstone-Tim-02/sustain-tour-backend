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

func GetAllUsersByAdmin(db *gorm.DB, secretKey []byte) echo.HandlerFunc {
	return func(c echo.Context) error {
		// Mendapatkan nilai query parameter "name"
		name := c.QueryParam("name")

		// Mendapatkan nilai query parameter "page" dan "per_page"
		page, perPage := helper.GetPaginationParams(c)

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

		var users []model.User
		query := db
		if name != "" {
			// Jika parameter "name" diisi, lakukan pencarian berdasarkan nama user
			query = query.Where("name LIKE ?", "%"+name+"%")
		}
		var totalUsers int64
		query.Model(&model.User{}).Count(&totalUsers)

		// Hitung informasi pagination
		var totalPages int
		if perPage > 0 {
			totalPages = int((totalUsers + int64(perPage) - 1) / int64(perPage))
		} else {
			totalPages = 0
		}

		query.Offset((page - 1) * perPage).Limit(perPage).Find(&users)

		// Buat slice untuk menyimpan data yang akan dikirim sebagai respons
		var userResponses []helper.UserResponse

		// Konversi data dari model User ke UserResponse
		for _, user := range users {
			userResponse := helper.UserResponse{
				ID:               user.ID,
				Name:             user.Name,
				Username:         user.Username,
				Email:            user.Email,
				PhoneNumber:      user.PhoneNumber,
				Points:           user.Points,
				IsVerified:       user.IsVerified,
				CreatedAt:        user.CreatedAt,
				CategoryID:       user.CategoryID,
				CategoryKesukaan: user.CategoryKesukaan,
				PhotoProfil:      user.PhotoProfil,
			}
			userResponses = append(userResponses, userResponse)
		}

		// Jika tidak ada hasil, atur userResponses menjadi slice kosong
		if len(userResponses) == 0 {
			userResponses = []helper.UserResponse{}
		}

		response := map[string]interface{}{
			"code":  http.StatusOK,
			"error": false,
			"users": userResponses,
			"pagination": map[string]interface{}{
				"current_page": page,
				"from":         (page-1)*perPage + 1,
				"last_page":    totalPages,
				"per_page":     perPage,
				"to":           (page-1)*perPage + len(userResponses),
				"total":        totalUsers,
			},
		}

		return c.JSON(http.StatusOK, response)
	}
}