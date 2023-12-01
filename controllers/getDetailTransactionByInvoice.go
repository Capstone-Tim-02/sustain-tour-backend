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

type TicketUserDetail struct {
	TicketID          uint       `json:"ticket_id"`
	UserID            uint       `json:"user_id"`
	Name              string     `json:"name"`
	PhotoProfil       string     `json:"photo_profil"`
	WisataID          uint       `json:"wisata_id"`
	WisataTitle       string     `json:"wisata_title"`
	TotalCost         int        `json:"total_cost"`
	InvoiceNumber     string     `json:"invoice_number"`
	CheckInBooking    *time.Time `json:"check_in_booking"`
	CreatedAt         *time.Time `json:"created_at"`
	KodeVoucher       string     `json:"kode_voucher"`
	PaidStatus        bool       `json:"paid_status"`
	StatusOrder       string     `json:"status_order"`
	TenggatPembayaran *time.Time `json:"tenggat_pembayaran"`
}

func GetTicketByInvoiceNumber(db *gorm.DB, secretKey []byte) echo.HandlerFunc {
	return func(c echo.Context) error {
		invoiceNumber := c.Param("invoiceNumber")

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

		if !user.IsAdmin {
			errorResponse := helper.ErrorResponse{Code: http.StatusForbidden, Message: "Access forbidden for non-admin users"}
			return c.JSON(http.StatusForbidden, errorResponse)
		}

		var ticket model.Ticket
		result = db.Where("invoice_number = ?", invoiceNumber).First(&ticket)
		if result.Error != nil {
			errorResponse := helper.ErrorResponse{Code: http.StatusNotFound, Message: "Ticket not found"}
			return c.JSON(http.StatusNotFound, errorResponse)
		}

		var userDetail model.User
		userResult := db.First(&userDetail, ticket.UserID)
		if userResult.Error != nil {
			errorResponse := helper.ErrorResponse{Code: http.StatusInternalServerError, Message: "Failed to fetch user data"}
			return c.JSON(http.StatusInternalServerError, errorResponse)
		}

		var wisata model.Wisata
		wisataResult := db.First(&wisata, ticket.WisataID)
		if wisataResult.Error != nil {
			errorResponse := helper.ErrorResponse{Code: http.StatusInternalServerError, Message: "Failed to fetch event data"}
			return c.JSON(http.StatusInternalServerError, errorResponse)
		}

		ticketDetail := TicketUserDetail{
			TicketID:          ticket.ID,
			UserID:            ticket.UserID,
			Name:              userDetail.Name,
			PhotoProfil:       userDetail.PhotoProfil,
			WisataID:          ticket.WisataID,
			WisataTitle:       wisata.Title,
			TotalCost:         ticket.TotalCost,
			InvoiceNumber:     ticket.InvoiceNumber,
			CheckInBooking:    ticket.CheckinBooking,
			CreatedAt:         ticket.CreatedAt,
			KodeVoucher:       ticket.KodeVoucher,
			PaidStatus:        ticket.PaidStatus,
			StatusOrder:       ticket.StatusOrder,
			TenggatPembayaran: ticket.TenggatPembayaran,
		}

		return c.JSON(http.StatusOK, map[string]interface{}{
			"code":        http.StatusOK,
			"error":       false,
			"message":     "Ticket details retrieved successfully",
			"ticket_data": ticketDetail,
		})
	}
}
