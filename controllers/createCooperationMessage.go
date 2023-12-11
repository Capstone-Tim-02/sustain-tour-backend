package controllers

import (
	"myproject/helper"
	"myproject/model"
	"net/http"
	"time"

	"github.com/labstack/echo/v4"
	"gorm.io/gorm"
)

const adminEmail = "hidestimate@gmail.com"

func CreateCooperationMessage(db *gorm.DB) echo.HandlerFunc {
	return func(c echo.Context) error {

		var cooperationMessage model.CooperationMessage

		if err := c.Bind(&cooperationMessage); err != nil {
			errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Request body tidak valid"}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}

		// Validasi first name
		if len(cooperationMessage.FirstName) < 3 {
			errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "First name harus minimal 3 huruf"}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}

		// Validasi email format
		if !helper.IsValidEmail(cooperationMessage.Email) {
			errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Format email tidak valid"}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}

		// Validasi phone number
		if !helper.IsValidPhoneNumber(cooperationMessage.PhoneNumber) {
			if !helper.ContainsOnlyDigits(cooperationMessage.PhoneNumber) {
				errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Phone number harus mengandung angka semua"}
				return c.JSON(http.StatusBadRequest, errorResponse)
			} else if len(cooperationMessage.PhoneNumber) < 10 {
				errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Phone number kurang dari 10 digit"}
				return c.JSON(http.StatusBadRequest, errorResponse)
			}
		}

		// Validasi message
		if len(cooperationMessage.Message) < 10 {
			errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Message harus minimal 10 huruf"}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}

		// Set waktu saat ini sebagai waktu pembuatan
		cooperationMessage.CreatedAt = time.Now()

		// Simpan pesan ke database
		db.Create(&cooperationMessage)

		// adminEmailSubject := "New Cooperation Message"
		// adminEmailBody := helper.GetCooperationEmailBody(cooperationMessage)
		// if err := helper.SendEmailToUser(adminEmail, adminEmailSubject, adminEmailBody); err != nil {
		// 	errorResponse := helper.ErrorResponse{Code: http.StatusInternalServerError, Message: "Failed to send email to admin"}
		// 	return c.JSON(http.StatusInternalServerError, errorResponse)
		// }

		// // Kirim email balasan ke pengirim pesan
		// userEmailSubject := "Your Cooperation Message"
		// userEmailBody := helper.GetUserCooperationEmailBody(cooperationMessage)
		// if err := helper.SendEmailToUser(cooperationMessage.Email, userEmailSubject, userEmailBody); err != nil {
		// 	errorResponse := helper.ErrorResponse{Code: http.StatusInternalServerError, Message: "Failed to send email to user"}
		// 	return c.JSON(http.StatusInternalServerError, errorResponse)
		// }

		return c.JSON(http.StatusCreated, map[string]interface{}{
			"code":    http.StatusCreated,
			"message": "Pesan kerjasama berhasil dikirim",
			"error":   false,
		})

	}
}
