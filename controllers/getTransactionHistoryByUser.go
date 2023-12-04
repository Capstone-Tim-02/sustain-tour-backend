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

func GetTransactionHistoryByInvoiceNumber(db *gorm.DB, secretKey []byte) echo.HandlerFunc {
	return func(c echo.Context) error {
		// Mendapatkan token dari header Authorization
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

		// Memverifikasi token
		username, err := middleware.VerifyToken(tokenString, secretKey)
		if err != nil {
			errorResponse := helper.ErrorResponse{Code: http.StatusUnauthorized, Message: "Invalid token"}
			return c.JSON(http.StatusUnauthorized, errorResponse)
		}

		// Mendapatkan ID pengguna dari token
		var user model.User
		result := db.Where("username = ?", username).First(&user)
		if result.Error != nil {
			errorResponse := helper.ErrorResponse{Code: http.StatusInternalServerError, Message: "Failed to fetch user data"}
			return c.JSON(http.StatusInternalServerError, errorResponse)
		}

		// Mendapatkan invoice_number dari parameter URL
		invoiceNumber := c.Param("invoice_number")

		// Mengambil tiket yang memiliki invoice_number yang sesuai
		var tickets []model.Ticket
		result = db.Where("user_id = ? AND invoice_number = ?", user.ID, invoiceNumber).Find(&tickets)
		if result.Error != nil {
			errorResponse := helper.ErrorResponse{Code: http.StatusInternalServerError, Message: "Failed to fetch transaction history"}
			return c.JSON(http.StatusInternalServerError, errorResponse)
		}

		// Membuat respons dengan data transaksi
		var transactionDetails []map[string]interface{}
		for _, ticket := range tickets {
			// Mendapatkan detail event berdasarkan EventID yang ada pada tiket
			var wisata model.Wisata
			eventResult := db.First(&wisata, ticket.WisataID)
			if eventResult.Error != nil {
				// Handle jika event tidak ditemukan
				continue
			}

			// Menambahkan informasi kode voucher yang digunakan
			var kodeVoucher string
			if ticket.KodeVoucher != "" {
				kodeVoucher = ticket.KodeVoucher
			}

			// Menambahkan objek tiket ke daftar transactionDetails
			transactionDetail := map[string]interface{}{
				"ticket_id":                   ticket.ID,
				"user_id":                     ticket.UserID,
				"username":                    user.Username,
				"email":                       user.Email,
				"wisata_id":                   ticket.WisataID,
				"wisata_name":                 wisata.Title,
				"lokasi_wisata":               wisata.Location,
				"kota_wisata":                 wisata.Kota,
				"maps_link":                   wisata.MapsLink,
				"total_cost":                  ticket.TotalCost,
				"invoice_number":              ticket.InvoiceNumber,
				"kode_voucher":                kodeVoucher,
				"quantity":                    ticket.Quantity,
				"paid":                        ticket.PaidStatus,
				"carboon_footprint":           ticket.CarbonFootprint,
				"points_earned":               ticket.PointsEarned,
				"checkin_booking":             ticket.CheckinBooking,
				"photo_wisata1":               wisata.PhotoWisata1,
				"photo_wisata2":               wisata.PhotoWisata2,
				"photo_wisata3":               wisata.PhotoWisata3,
				"tenggat_pembayaran":          ticket.TenggatPembayaran,
				"status_order":                ticket.StatusOrder,
				"harga_sebelum_diskon":        ticket.HargaSebelumDiskon,
				"total_potongan_kode_voucher": ticket.TotalPotonganKodeVoucher,
				"total_potongan_points":       ticket.TotalPotonganPoints,
			}

			// Menambahkan objek transaksi ke daftar transactionDetails
			transactionDetails = append(transactionDetails, transactionDetail)
		}

		// Mengembalikan respons dengan detail transaksi berdasarkan invoice_number
		return c.JSON(http.StatusOK, map[string]interface{}{
			"code":                http.StatusOK,
			"error":               false,
			"message":             "Transaction history retrieved successfully",
			"transaction_details": transactionDetails,
		})
	}
}
