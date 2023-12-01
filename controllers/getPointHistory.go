package controllers

import (
	"github.com/labstack/echo/v4"
	"gorm.io/gorm"
	"myproject/helper"
	"myproject/middleware"
	"myproject/model"
	"net/http"
	"strings"
	"time"
)

func GetPointsHistory(db *gorm.DB, secretKey []byte) echo.HandlerFunc {
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

		var pointsHistory []map[string]interface{}
		var tickets []model.Ticket
		result = db.Where("user_id = ? AND (points_earned > 0 OR used_points > 0) AND paid_status = ?", user.ID, true).Find(&tickets)
		if result.Error != nil {
			errorResponse := helper.ErrorResponse{Code: http.StatusInternalServerError, Message: "Failed to fetch user's points history"}
			return c.JSON(http.StatusInternalServerError, errorResponse)
		}

		for _, ticket := range tickets {
			if ticket.PaidStatus {
				if ticket.TenggatPembayaran != nil && time.Now().After(*ticket.TenggatPembayaran) {
					ticket.StatusOrder = "dibatalkan"
					ticket.TenggatPembayaran = nil
				} else {
					ticket.StatusOrder = "success"
					ticket.TenggatPembayaran = nil
				}

				if err := db.Save(&ticket).Error; err != nil {
					errorResponse := helper.ErrorResponse{Code: http.StatusInternalServerError, Message: "Failed to update ticket status"}
					return c.JSON(http.StatusInternalServerError, errorResponse)
				}
			}

			var wisata model.Wisata
			eventResult := db.First(&wisata, ticket.WisataID)
			if eventResult.Error != nil {
				continue
			}

			if ticket.PointsEarned > 0 {
				pointsDetailEarned := map[string]interface{}{
					"wisata_name":   wisata.Title,
					"points_earned": ticket.PointsEarned,
					"message":       "Poin bertambah",
				}
				pointsHistory = append(pointsHistory, pointsDetailEarned)
			}

			if ticket.UsedPoints > 0 {
				pointsDetailUsed := map[string]interface{}{
					"wisata_name": wisata.Title,
					"points_used": ticket.UsedPoints,
					"message":     "Poin berkurang",
				}
				pointsHistory = append(pointsHistory, pointsDetailUsed)
			}
		}

		return c.JSON(http.StatusOK, map[string]interface{}{
			"code":           http.StatusOK,
			"error":          false,
			"message":        "User's points history retrieved successfully",
			"points_history": pointsHistory,
		})
	}
}
