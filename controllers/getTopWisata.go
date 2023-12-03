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

func GetTopWisata(db *gorm.DB, secretKey []byte) echo.HandlerFunc {
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
			Title        string `json:"destination_title"`
			TotalTicket  int64  `json:"total_ticket"`
			PhotoWisata1 string `json:"photo_wisata1"`
			PhotoWisata2 string `json:"photo_wisata2"`
			PhotoWisata3 string `json:"photo_wisata3"`
			Kota         string `json:"kota"`
		}
		var resQuery []ResultQuery

		var totalTicketsSold int64
		err = db.Model(&model.Ticket{}).Where("paid_status = ?", true).Count(&totalTicketsSold).Error
		if err != nil {
			return ctx.JSON(http.StatusOK, map[string]interface{}{"code": http.StatusInternalServerError, "error": true, "data": []interface{}{}})
		}

		err = db.Model(&model.Wisata{}).Select("wisata.title AS title, wisata.kota, COUNT(tickets.id) AS total_ticket, wisata.photo_wisata1, wisata.photo_wisata2, wisata.photo_wisata3").
			Joins("JOIN tickets ON wisata.id = tickets.wisata_id AND tickets.paid_status = ?", true).
			Group("wisata.title, wisata.kota, wisata.photo_wisata1, wisata.photo_wisata2, wisata.photo_wisata3").
			Order("total_ticket desc").Limit(3).Scan(&resQuery).Error

		if err != nil {
			return ctx.JSON(http.StatusOK, map[string]interface{}{"code": http.StatusInternalServerError, "error": true, "data": []interface{}{}})
		}

		return ctx.JSON(http.StatusOK, map[string]interface{}{"code": http.StatusOK, "error": false, "data": resQuery})

	}
}
