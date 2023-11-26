package controllers

import (
	"fmt"
	"github.com/labstack/echo/v4"
	"gorm.io/gorm"
	"io"
	"myproject/helper"
	"myproject/middleware"
	"myproject/model"
	"net/http"
	"strconv"
	"strings"
	"time"
)

func CreatePromo(db *gorm.DB, secretKey []byte) echo.HandlerFunc {
	return func(c echo.Context) error {
		tokenString := c.Request().Header.Get("Authorization")
		if tokenString == "" {
			return c.JSON(http.StatusUnauthorized, helper.ErrorResponse{Code: http.StatusUnauthorized, Message: "Authorization token is missing"})
		}

		authParts := strings.SplitN(tokenString, " ", 2)
		if len(authParts) != 2 || authParts[0] != "Bearer" {
			return c.JSON(http.StatusUnauthorized, helper.ErrorResponse{Code: http.StatusUnauthorized, Message: "Invalid token format"})
		}

		tokenString = authParts[1]

		username, err := middleware.VerifyToken(tokenString, secretKey)
		if err != nil {
			return c.JSON(http.StatusUnauthorized, helper.ErrorResponse{Code: http.StatusUnauthorized, Message: "Invalid token"})
		}

		var user model.User
		result := db.Where("username = ?", username).First(&user)
		if result.Error != nil {
			return c.JSON(http.StatusInternalServerError, helper.ErrorResponse{Code: http.StatusInternalServerError, Message: "Failed to fetch user data"})
		}

		if !user.IsAdmin {
			return c.JSON(http.StatusForbidden, helper.ErrorResponse{Code: http.StatusForbidden, Message: "Only Admin can add promos"})
		}

		title := c.FormValue("title")
		namaPromo := c.FormValue("nama_promo")
		kodeVoucher := c.FormValue("kode_voucher")
		jumlahPotonganPersenStr := c.FormValue("jumlah_potongan_persen")
		statusAktifStr := c.FormValue("status_aktif")
		tanggalKadaluarsaStr := c.FormValue("tanggal_kadaluarsa")
		deskripsi := c.FormValue("deskripsi")
		peraturan := c.FormValue("peraturan")

		if len(title) < 5 {
			return c.JSON(http.StatusBadRequest, helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Title must be at least 5 characters"})
		}

		if len(title) > 100 {
			return c.JSON(http.StatusBadRequest, helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Title cannot exceed 100 characters"})
		}

		if len(namaPromo) < 5 {
			return c.JSON(http.StatusBadRequest, helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Nama Promo must be at least 5 characters"})
		}

		if len(namaPromo) > 100 {
			return c.JSON(http.StatusBadRequest, helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Nama Promo cannot exceed 100 characters"})
		}

		if len(kodeVoucher) < 5 {
			return c.JSON(http.StatusBadRequest, helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Kode voucher must be at least 5 characters"})
		}

		if len(kodeVoucher) > 40 {
			return c.JSON(http.StatusBadRequest, helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Kode Voucher cannot exceed 40 characters"})
		}

		if len(deskripsi) < 10 {
			return c.JSON(http.StatusBadRequest, helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Deskripsi must be at least 10 characters"})
		}

		if len(deskripsi) > 2000 {
			return c.JSON(http.StatusBadRequest, helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Deskripsi cannot exceed 2000 characters"})
		}

		// Validasi minimal 10 huruf untuk peraturan
		if len(peraturan) < 10 {
			return c.JSON(http.StatusBadRequest, helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Peraturan must be at least 10 characters"})
		}

		if len(peraturan) > 2000 {
			return c.JSON(http.StatusBadRequest, helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Peraturan cannot exceed 2000 characters"})
		}

		// Validasi agar tidak menggunakan kode_voucher yang sudah ada pada promo_model.go
		existingKodeVoucher := model.Promo{}
		if err := db.Where("kode_voucher = ?", kodeVoucher).First(&existingKodeVoucher).Error; err == nil {
			return c.JSON(http.StatusConflict, helper.ErrorResponse{Code: http.StatusConflict, Message: "Promo with this name for kode_voucher already exists"})
		}

		// Validasi jumlah_potongan_persen harus di atas 0
		jumlahPotongan, err := strconv.Atoi(jumlahPotonganPersenStr)
		if err != nil || jumlahPotongan <= 0 {
			return c.JSON(http.StatusBadRequest, helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Invalid jumlah_potongan_persen"})
		}

		if jumlahPotongan > 100 {
			return c.JSON(http.StatusBadRequest, helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Invalid jumlah_potongan_persen. It must not exceed 100"})
		}

		statusAktif, err := strconv.ParseBool(statusAktifStr)
		if err != nil {
			return c.JSON(http.StatusBadRequest, helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Invalid status_aktif"})
		}

		tanggalKadaluarsa, err := time.Parse("2006-01-02", tanggalKadaluarsaStr)
		if err != nil {
			return c.JSON(http.StatusBadRequest, helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Invalid tanggal_kadaluarsa format. Use YYYY-MM-DD"})
		}

		// Validasi agar tidak menggunakan title yang sudah ada pada promo_model.go
		existingTitle := model.Promo{}
		if err := db.Where("title = ?", title).First(&existingTitle).Error; err == nil {
			return c.JSON(http.StatusConflict, helper.ErrorResponse{Code: http.StatusConflict, Message: "Promo with this title already exists"})
		}

		// Validasi agar tidak menggunakan nama_promo yang sudah ada pada promo_model.go
		existingNamaPromo := model.Promo{}
		if err := db.Where("nama_promo = ?", namaPromo).First(&existingNamaPromo).Error; err == nil {
			return c.JSON(http.StatusConflict, helper.ErrorResponse{Code: http.StatusConflict, Message: "Promo with this nama_promo already exists"})
		}

		// Validasi tanggal_kadaluarsa tidak boleh tanggal yang sudah lewat
		if time.Now().After(tanggalKadaluarsa) {
			return c.JSON(http.StatusBadRequest, helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Invalid tanggal_kadaluarsa. It must be a future date"})
		}

		randomString := helper.GenerateRandomString(10)
		newPromo := model.Promo{
			Title:                title,
			KodeVoucher:          kodeVoucher,
			JumlahPotonganPersen: jumlahPotongan,
			NamaPromo:            namaPromo,
			StatusAktif:          statusAktif,
			TanggalKadaluarsa:    tanggalKadaluarsa,
			Deskripsi:            deskripsi,
			Peraturan:            peraturan,
		}

		imageFile, err := c.FormFile("image_voucher")
		if err == nil {
			if !helper.IsImageFile(imageFile) {
				return c.JSON(http.StatusBadRequest, helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Invalid image format"})
			}

			if !helper.IsFileSizeExceeds(imageFile, 5*1024*1024) {
				src, err := imageFile.Open()
				if err == nil {
					defer src.Close()
					imageData, err := io.ReadAll(src)
					if err == nil {
						timestamp := time.Now().Unix()
						imageName := fmt.Sprintf("promos/promo/image_%s_%d.jpg", randomString, timestamp)
						imageURL, err := helper.UploadImageToGCS(imageData, imageName)
						if err == nil {
							newPromo.ImageVoucher = imageURL
						}
					}
				}
			}
		}

		if err := db.Create(&newPromo).Error; err != nil {
			return c.JSON(http.StatusInternalServerError, helper.ErrorResponse{Code: http.StatusInternalServerError, Message: "Failed to create promo"})
		}

		return c.JSON(http.StatusOK, map[string]interface{}{
			"code":       http.StatusOK,
			"error":      false,
			"message":    "Promo created successfully",
			"promo_data": newPromo,
		})
	}
}
