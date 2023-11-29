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

func GetAllTicketsByAdmin(db *gorm.DB, secretKey []byte) echo.HandlerFunc {
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
			errorResponse := helper.ErrorResponse{Code: http.StatusForbidden, Message: "Access denied"}
			return c.JSON(http.StatusForbidden, errorResponse)
		}

		// Get query parameters
		searchQuery := c.QueryParam("search")
		page, perPage := helper.GetPaginationParams(c)

		// Build the base query
		query := db.Model(&model.Ticket{})

		if searchQuery != "" {
			query = query.
				Joins("JOIN users ON tickets.user_id = users.id").
				Joins("JOIN wisata ON tickets.wisata_id = wisata.id").
				Where("tickets.invoice_number LIKE ? OR users.name LIKE ?", "%"+searchQuery+"%", "%"+searchQuery+"%").
				Or("wisata.title LIKE ?", "%"+searchQuery+"%")
		}

		var totalTickets int64
		query.Count(&totalTickets)

		// Calculate pagination information
		var totalPages int
		if perPage > 0 {
			totalPages = int((totalTickets + int64(perPage) - 1) / int64(perPage))
		} else {
			totalPages = 0
		}

		// Retrieve paginated tickets
		var tickets []model.Ticket
		query.Offset((page - 1) * perPage).Limit(perPage).Find(&tickets)

		// Create a slice to store additional data in the response
		var ticketDetails []map[string]interface{}

		// Iterate through each ticket and add additional information
		for _, ticket := range tickets {
			var wisata model.Wisata
			db.First(&wisata, ticket.WisataID)

			var user model.User
			db.First(&user, ticket.UserID)

			ticketDetail := map[string]interface{}{
				"id":                 ticket.ID,
				"wisata_id":          ticket.WisataID,
				"wisata_title":       wisata.Title,
				"user_id":            ticket.UserID,
				"user_name":          user.Name,
				"photo_profil":       user.PhotoProfil,
				"used_points":        ticket.UsedPoints,
				"use_all_points":     ticket.UseAllPoints,
				"total_cost":         ticket.TotalCost,
				"invoice_number":     ticket.InvoiceNumber,
				"quantity":           ticket.Quantity,
				"created_at":         ticket.CreatedAt,
				"updated_at":         ticket.UpdatedAt,
				"carbon_footprint":   ticket.CarbonFootprint,
				"paid_status":        ticket.PaidStatus,
				"status_order":       ticket.StatusOrder,
				"tenggat_pembayaran": ticket.TenggatPembayaran,
				"checkin_booking":    ticket.CheckinBooking,
				"kode_voucher":       ticket.KodeVoucher,
				"points_earned":      ticket.PointsEarned,
			}

			ticketDetails = append(ticketDetails, ticketDetail)
		}

		if ticketDetails == nil {
			ticketDetails = []map[string]interface{}{}
		}

		response := map[string]interface{}{
			"code":    http.StatusOK,
			"error":   false,
			"tickets": ticketDetails,
			"pagination": map[string]interface{}{
				"current_page": page,
				"from":         (page-1)*perPage + 1,
				"last_page":    totalPages,
				"per_page":     perPage,
				"to":           (page-1)*perPage + len(tickets),
				"total":        totalTickets,
			},
		}

		return c.JSON(http.StatusOK, response)
	}
}
