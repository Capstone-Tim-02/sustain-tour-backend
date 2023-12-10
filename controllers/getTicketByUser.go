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

func GetTicketsByUser(db *gorm.DB, secretKey []byte) echo.HandlerFunc {
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

		// Mengambil tiket yang telah dibeli oleh pengguna berdasarkan UserID
		var tickets []model.Ticket
		result = db.Where("user_id = ?", user.ID).Find(&tickets)
		if result.Error != nil {
			errorResponse := helper.ErrorResponse{Code: http.StatusInternalServerError, Message: "Failed to fetch user's tickets"}
			return c.JSON(http.StatusInternalServerError, errorResponse)
		}

		// Membuat respons dengan data tiket yang telah dibeli
		var ticketDetails []map[string]interface{}
		for _, ticket := range tickets {
			// Menangani perubahan paid_status yang dilakukan oleh admin
			if ticket.PaidStatus {
				// Jika paid_status sudah true, perbarui tenggat_pembayaran dan status_order
				if ticket.TenggatPembayaran != nil && time.Now().After(*ticket.TenggatPembayaran) {
					// Jika tenggat_pembayaran sudah lewat, ubah status_order menjadi "dibatalkan" dan tenggat_pembayaran menjadi nil
					ticket.StatusOrder = "dibatalkan"
					ticket.TenggatPembayaran = nil
				} else {
					// Jika tenggat_pembayaran masih berlaku, ubah status_order menjadi "success" dan tenggat_pembayaran menjadi nil
					ticket.StatusOrder = "success"
					ticket.TenggatPembayaran = nil
				}

				// Simpan perubahan ke dalam database
				if err := db.Save(&ticket).Error; err != nil {
					errorResponse := helper.ErrorResponse{Code: http.StatusInternalServerError, Message: "Failed to update ticket status"}
					return c.JSON(http.StatusInternalServerError, errorResponse)
				}
			}

			// Mengambil detail event berdasarkan EventID yang ada pada tiket
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

			// Menambahkan tenggat pembayaran dan status order ke detail tiket
			ticketDetail := map[string]interface{}{
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
				"lat":                         wisata.Lat,
				"long":                        wisata.Long,
			}

			// Menambahkan objek tiket ke daftar ticketDetails
			ticketDetails = append(ticketDetails, ticketDetail)
		}

		// Mengembalikan respons dengan detail tiket yang telah dibeli
		return c.JSON(http.StatusOK, map[string]interface{}{
			"code":        http.StatusOK,
			"error":       false,
			"message":     "User's tickets retrieved successfully",
			"ticket_data": ticketDetails,
		})
	}
}
