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

func GetTopEmition(db *gorm.DB, secretKey []byte) echo.HandlerFunc {
	return func(ctx echo.Context) error {

		tokenString := ctx.Request().Header.Get("Authorization")
		if tokenString == "" {
			errorResponse := helper.ErrorResponse{Code: http.StatusUnauthorized, Message: "Authorization token is missing"}
			return ctx.JSON(http.StatusUnauthorized, errorResponse)
		}

		authParts := strings.SplitN(tokenString, " ", 2)
		if len(authParts) != 2 || authParts[0] != "Bearer" {
			errorResponse := helper.ErrorResponse{Code: http.StatusUnauthorized, Message: "Invalid token format"}
			return ctx.JSON(http.StatusUnauthorized, errorResponse)
		}

		tokenString = authParts[1]

		username, err := middleware.VerifyToken(tokenString, secretKey)
		if err != nil {
			errorResponse := helper.ErrorResponse{Code: http.StatusUnauthorized, Message: "Invalid token"}
			return ctx.JSON(http.StatusUnauthorized, errorResponse)
		}

		var currentUser model.User
		result := db.Where("username = ?", username).First(&currentUser)
		if result.Error != nil {
			errorResponse := helper.ErrorResponse{Code: http.StatusNotFound, Message: "User not found"}
			return ctx.JSON(http.StatusNotFound, errorResponse)
		}

		if !currentUser.IsAdmin {
			errorResponse := helper.ErrorResponse{Code: http.StatusForbidden, Message: "Access denied"}
			return ctx.JSON(http.StatusForbidden, errorResponse)
		}

		type ResultQuery struct {
			Name         string  `json:"user_name"`
			Profile      string  `json:"user_profile"`
			Purchassed   int     `json:"purchassed"`
			TotalEmition float64 `json:"total_emition"`
		}
		var resQuery []ResultQuery

		err = db.Model(model.User{}).Joins("JOIN tickets ON users.id = tickets.user_id AND tickets.paid_status = ?", true).
			Group("users.name").Order("total_emition asc").Limit(4).
			Select("users.name AS name, MIN(users.photo_profil) AS profile, COUNT(tickets.id) AS purchassed, SUM(tickets.carbon_footprint) AS total_emition").
			Scan(&resQuery).Error

		if err != nil {
			return ctx.JSON(http.StatusOK, map[string]interface{}{"code": http.StatusInternalServerError, "error": true, "data": []interface{}{}})
		}

		return ctx.JSON(http.StatusOK, map[string]interface{}{"code": http.StatusOK, "error": false, "data": resQuery})

	}
}
