package controllers

import (
	"fmt"
	"github.com/labstack/echo/v4"
	"gorm.io/gorm"
	"myproject/helper"
	"myproject/middleware"
	"myproject/model"
	"net/http"
	"strings"
)

type TicketResponse struct {
	Ticket      model.Ticket `json:"ticket"`
	UserProfile UserProfile  `json:"user_profile"`
}

type UserProfile struct {
	UserID      uint   `json:"user_id"`
	Username    string `json:"username"`
	PhotoProfil string `json:"photo_profil"`
}

func UpdatePaidStatus(db *gorm.DB, secretKey []byte) echo.HandlerFunc {
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
			errorResponse := helper.ErrorResponse{Code: http.StatusForbidden, Message: "Access denied for non-admin users"}
			return c.JSON(http.StatusForbidden, errorResponse)
		}

		invoiceNumber := c.Param("invoiceId")

		var requestBody struct {
			PaidStatus bool `json:"paid_status"`
		}

		if err := c.Bind(&requestBody); err != nil {
			errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Invalid request body"}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}

		var ticket model.Ticket
		result = db.Where("invoice_number = ?", invoiceNumber).First(&ticket)
		if result.Error != nil {
			errorResponse := helper.ErrorResponse{Code: http.StatusNotFound, Message: "Ticket not found"}
			return c.JSON(http.StatusNotFound, errorResponse)
		}

		var user model.User
		result = db.First(&user, ticket.UserID)
		if result.Error != nil {
			errorResponse := helper.ErrorResponse{Code: http.StatusNotFound, Message: "User not found"}
			return c.JSON(http.StatusNotFound, errorResponse)
		}

		if ticket.StatusOrder == "dibatalkan" {
			errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Cannot update paid status for canceled ticket"}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}

		var notification model.Notification
		var wisata model.Wisata
		wisataResult := db.First(&wisata, ticket.WisataID)
		if wisataResult.Error != nil {
			errorResponse := helper.ErrorResponse{Code: http.StatusNotFound, Message: "Wisata not found"}
			return c.JSON(http.StatusNotFound, errorResponse)
		}

		notificationMessage := fmt.Sprintf("Tiket untuk wisata %s berhasil dibayar. Selamat liburan!", wisata.Title)
		notification = model.Notification{
			UserID:  user.ID,
			Message: notificationMessage,
		}
		db.Create(&notification)

		if requestBody.PaidStatus {
			ticket.StatusOrder = "success"
			ticket.TenggatPembayaran = nil

			var wisata model.Wisata
			if ticket.PaidStatus {
				wisataResult := db.First(&wisata, ticket.WisataID)
				if wisataResult.Error != nil {
					errorResponse := helper.ErrorResponse{Code: http.StatusNotFound, Message: "Wisata not found"}
					return c.JSON(http.StatusNotFound, errorResponse)
				}

				notificationMessage := fmt.Sprintf("Tiket untuk wisata %s berhasil dibayar. Selamat liburan!", wisata.Title)
				notification = model.Notification{
					UserID:  user.ID,
					Message: notificationMessage,
				}
				db.Create(&notification)
			}

			if ticket.PointsEarned > 0 && requestBody.PaidStatus {
				user.Points += ticket.PointsEarned
				db.Save(&user)
			}
		} else {
			ticket.StatusOrder = "pending"
			ticket.TenggatPembayaran = ticket.CheckinBooking
		}

		ticket.PaidStatus = requestBody.PaidStatus
		db.Save(&ticket)

		var userProfile UserProfile
		db.Model(&user).Select("id as user_id, username, photo_profil").Scan(&userProfile)

		var ticketResponse TicketResponse
		ticketResponse.Ticket = ticket
		ticketResponse.UserProfile = userProfile

		return c.JSON(http.StatusOK, map[string]interface{}{
			"code":    http.StatusOK,
			"error":   false,
			"message": "Paid status updated successfully",
			"ticket":  ticketResponse,
		})
	}
}
