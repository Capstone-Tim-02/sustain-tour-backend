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

func GetUserNotifications(db *gorm.DB, secretKey []byte) echo.HandlerFunc {
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

		var user model.User
		result := db.Where("username = ?", username).First(&user)
		if result.Error != nil {
			errorResponse := helper.ErrorResponse{Code: http.StatusInternalServerError, Message: "Failed to fetch user data"}
			return c.JSON(http.StatusInternalServerError, errorResponse)
		}

		var notifications []model.Notification
		db.Where("user_id = ?", user.ID).Order("created_at desc").Find(&notifications)

		var notifIds []uint
		for _, notification := range notifications {
			if notification.Status == "unread" {
				notifIds = append(notifIds, notification.ID)
			}
		}

		if len(notifIds) != 0 {
			err = db.Table("notifications").Where("id IN ?", notifIds).Updates(map[string]interface{}{"status": "read"}).Error
			if err != nil {
				errorResponse := helper.ErrorResponse{Code: http.StatusInternalServerError, Message: "Server error"}
				return c.JSON(http.StatusInternalServerError, errorResponse)
			}
		}

		return c.JSON(http.StatusOK, map[string]interface{}{
			"code":          http.StatusOK,
			"error":         false,
			"message":       "User notifications retrieved successfully",
			"notifications": notifications,
		})

	}
}
