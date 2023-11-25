package controllers

import (
	"myproject/helper"
	"myproject/middleware"
	"myproject/model"
	"net/http"
	"strings"
	"time"

	"github.com/labstack/echo/v4"
	"gorm.io/gorm"
)

func CheckTicketPrice(db *gorm.DB, secretKey []byte) echo.HandlerFunc {
	return func(c echo.Context) error {
		authHeader := c.Request().Header.Get("Authorization")
		if authHeader == "" {
			errorResponse := helper.ErrorResponse{Code: http.StatusUnauthorized, Message: "Authorization token is missing"}
			return c.JSON(http.StatusUnauthorized, errorResponse)
		}

		authParts := strings.SplitN(authHeader, " ", 2)
		if len(authParts) != 2 || authParts[0] != "Bearer" {
			errorResponse := helper.ErrorResponse{Code: http.StatusUnauthorized, Message: "Invalid token format"}
			return c.JSON(http.StatusUnauthorized, errorResponse)
		}

		tokenString := authParts[1]

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

		var ticketPurchase struct {
			WisataID       uint   `json:"wisata_id"`
			KodeVoucher    string `json:"kode_voucher"`
			UseAllPoints   bool   `json:"use_all_points"`
			UsedPoints     int    `json:"used_points"`
			Quantity       int    `json:"quantity"`
			CheckinBooking string `json:"checkin_booking"`
		}

		if err := c.Bind(&ticketPurchase); err != nil {
			errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: err.Error()}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}

		var wisata model.Wisata
		wisataResult := db.First(&wisata, ticketPurchase.WisataID)
		if wisataResult.Error != nil {
			errorResponse := helper.ErrorResponse{Code: http.StatusNotFound, Message: "Wisata not found"}
			return c.JSON(http.StatusNotFound, errorResponse)
		}

		if ticketPurchase.Quantity <= 0 {
			errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Quantity must be greater than 0"}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}

		checkinBookingTime, err := time.Parse("2006-01-02", ticketPurchase.CheckinBooking)
		if err != nil {
			errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Invalid checkin_booking date format"}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}

		if checkinBookingTime.Before(time.Now().Truncate(24 * time.Hour)) {
			errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Checkin date must be today or later"}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}

		var discountPercentage int
		totalCost := wisata.Price * ticketPurchase.Quantity
		pointsEarned := totalCost / 10000
		var totalPotonganKodeVoucher int
		var totalPotonganPoints int

		hargaSebelumDiskon := totalCost

		if ticketPurchase.KodeVoucher != "" {
			var promo model.Promo
			promoResult := db.Where("kode_voucher = ?", ticketPurchase.KodeVoucher).First(&promo)
			if promoResult.Error == nil {
				currentTime := time.Now()
				if promo.StatusAktif && currentTime.Before(promo.TanggalKadaluarsa) {
					discountPercentage = promo.JumlahPotonganPersen
					if discountPercentage > 0 {
						discount := (totalCost * discountPercentage) / 100
						totalCost -= discount
						totalPotonganKodeVoucher += discount
					}
					pointsEarned = 0
				} else {
					if !promo.StatusAktif {
						errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Voucher belum aktif"}
						return c.JSON(http.StatusBadRequest, errorResponse)
					} else if currentTime.After(promo.TanggalKadaluarsa) {
						errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Voucher sudah expired"}
						return c.JSON(http.StatusBadRequest, errorResponse)
					} else {
						errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Invalid kode voucher"}
						return c.JSON(http.StatusBadRequest, errorResponse)
					}
				}
			} else {
				errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Invalid kode voucher"}
				return c.JSON(http.StatusBadRequest, errorResponse)
			}
		}

		var usedPoints int

		if ticketPurchase.UseAllPoints {
			// Calculate the maximum points that can be use
			maxPoints := totalCost / 1000
			if maxPoints > user.Points {
				maxPoints = user.Points
			}

			usedPoints = maxPoints
			additionalDiscount := usedPoints * 1000
			totalCost -= additionalDiscount
			totalPotonganPoints += additionalDiscount
		} else {
			usedPoints = ticketPurchase.UsedPoints
			additionalDiscount := usedPoints * 1000
			if additionalDiscount <= totalCost {
				totalCost -= additionalDiscount
				totalPotonganPoints += additionalDiscount
			} else {
				errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Not enough points to use"}
				return c.JSON(http.StatusBadRequest, errorResponse)
			}
		}

		if wisata.AvailableTickets < ticketPurchase.Quantity {
			errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Not enough available tickets"}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}

		carbonFootprint := CalculateCarbonFootprint(user, wisata)

		pointMessage := "Points earned"
		if pointsEarned == 0 && ticketPurchase.KodeVoucher != "" {
			pointMessage = "Points not earned due to voucher"
		}

		responseData := map[string]interface{}{
			"error":                       false,
			"message":                     "Ticket Wisata price checked successfully",
			"harga_sebelum_diskon":        hargaSebelumDiskon,
			"total_cost":                  totalCost,
			"kode_voucher":                ticketPurchase.KodeVoucher,
			"points_earned":               pointsEarned,
			"used_points":                 usedPoints,
			"carbon_footprint":            carbonFootprint,
			"point_message":               pointMessage,
			"quantity":                    ticketPurchase.Quantity,
			"total_potongan_kode_voucher": totalPotonganKodeVoucher,
			"total_potongan_points":       totalPotonganPoints,
		}

		response := map[string]interface{}{
			"code":    http.StatusOK,
			"error":   false,
			"message": "Ticket Wisata price checked successfully",
			"data":    responseData,
		}

		return c.JSON(http.StatusOK, response)
	}
}
