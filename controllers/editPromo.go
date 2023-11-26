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

func EditPromo(db *gorm.DB, secretKey []byte) echo.HandlerFunc {
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
			return c.JSON(http.StatusForbidden, helper.ErrorResponse{Code: http.StatusForbidden, Message: "Only Admin can update promos"})
		}

		promoID := c.Param("id")

		var existingPromo model.Promo
		if err := db.First(&existingPromo, promoID).Error; err != nil {
			return c.JSON(http.StatusNotFound, helper.ErrorResponse{Code: http.StatusNotFound, Message: "Promo not found"})
		}

		title := c.FormValue("title")
		kodeVoucher := c.FormValue("kode_voucher")
		jumlahPotonganPersen := c.FormValue("jumlah_potongan_persen")
		namaPromo := c.FormValue("nama_promo")
		statusAktifStr := c.FormValue("status_aktif")
		tanggalKadaluarsaStr := c.FormValue("tanggal_kadaluarsa")
		deskripsi := c.FormValue("deskripsi")
		peraturan := c.FormValue("peraturan")

		if title != "" && title != existingPromo.Title {
			if len(title) < 5 {
				return c.JSON(http.StatusBadRequest, helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Title must have at least 5 characters"})
			}

			if len(title) > 100 {
				return c.JSON(http.StatusBadRequest, helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Title cannot exceed 100 characters"})
			}

			existingTitle := model.Promo{}
			if err := db.Where("title = ?", title).First(&existingTitle).Error; err == nil {
				return c.JSON(http.StatusConflict, helper.ErrorResponse{Code: http.StatusConflict, Message: "Promo with this title already exists"})
			}

			existingPromo.Title = title
		}

		if namaPromo != "" && namaPromo != existingPromo.NamaPromo {
			if len(namaPromo) < 5 {
				return c.JSON(http.StatusBadRequest, helper.ErrorResponse{Code: http.StatusBadRequest, Message: "NamaPromo must have at least 5 characters"})
			}

			if len(namaPromo) > 100 {
				return c.JSON(http.StatusBadRequest, helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Nama Promo cannot exceed 100 characters"})
			}

			existingNamaPromo := model.Promo{}
			if err := db.Where("nama_promo = ?", namaPromo).First(&existingNamaPromo).Error; err == nil {
				return c.JSON(http.StatusConflict, helper.ErrorResponse{Code: http.StatusConflict, Message: "Promo with this nama_promo already exists"})
			}

			existingPromo.NamaPromo = namaPromo
		}

		if kodeVoucher != "" && kodeVoucher != existingPromo.KodeVoucher {
			if len(kodeVoucher) < 5 {
				return c.JSON(http.StatusBadRequest, helper.ErrorResponse{Code: http.StatusBadRequest, Message: "KodeVoucher must have at least 5 characters"})
			}

			if len(kodeVoucher) > 40 {
				return c.JSON(http.StatusBadRequest, helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Kode Voucher cannot exceed 40 characters"})
			}

			existingKodeVoucher := model.Promo{}
			if err := db.Where("kode_voucher = ?", kodeVoucher).First(&existingKodeVoucher).Error; err == nil {
				return c.JSON(http.StatusConflict, helper.ErrorResponse{Code: http.StatusConflict, Message: "Promo with this kode_voucher already exists"})
			}

			existingPromo.KodeVoucher = kodeVoucher
		}

		if jumlahPotonganPersen != "" {
			jumlahPotongan, err := strconv.Atoi(jumlahPotonganPersen)
			if err != nil {
				return c.JSON(http.StatusBadRequest, helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Invalid jumlah_potongan_persen"})
			}

			if jumlahPotongan <= 0 {
				return c.JSON(http.StatusBadRequest, helper.ErrorResponse{Code: http.StatusBadRequest, Message: "JumlahPotonganPersen must be greater than 0"})
			}

			if jumlahPotongan > 100 {
				return c.JSON(http.StatusBadRequest, helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Invalid jumlah_potongan_persen. It must not exceed 100"})
			}

			existingPromo.JumlahPotonganPersen = jumlahPotongan
		}

		if deskripsi != "" && deskripsi != existingPromo.Deskripsi {
			if len(deskripsi) < 10 {
				return c.JSON(http.StatusBadRequest, helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Deskripsi must be at least 10 characters"})
			}

			if len(deskripsi) > 2000 {
				return c.JSON(http.StatusBadRequest, helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Deskripsi cannot exceed 2000 characters"})
			}

			existingPromo.Deskripsi = deskripsi
		}

		if peraturan != "" && peraturan != existingPromo.Peraturan {
			if len(peraturan) < 10 {
				return c.JSON(http.StatusBadRequest, helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Peraturan must be at least 10 characters"})
			}

			if len(peraturan) > 2000 {
				return c.JSON(http.StatusBadRequest, helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Peraturan cannot exceed 2000 characters"})
			}
			existingPromo.Peraturan = peraturan
		}

		if tanggalKadaluarsaStr != "" {
			tanggalKadaluarsa, err := time.Parse("2006-01-02", tanggalKadaluarsaStr)
			if err != nil {
				return c.JSON(http.StatusBadRequest, helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Invalid tanggal_kadaluarsa format. Use YYYY-MM-DD"})
			}
			if time.Now().After(tanggalKadaluarsa) {
				return c.JSON(http.StatusBadRequest, helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Invalid tanggal_kadaluarsa. It must be a future date"})
			}
			existingPromo.TanggalKadaluarsa = tanggalKadaluarsa
		}

		if statusAktifStr != "" {
			statusAktif, err := strconv.ParseBool(statusAktifStr)
			if err != nil {
				return c.JSON(http.StatusBadRequest, helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Invalid status_aktif"})
			}
			existingPromo.StatusAktif = statusAktif
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
						imageName := fmt.Sprintf("promos/promo%d/image_%d.jpg", existingPromo.ID, timestamp)
						imageURL, err := helper.UploadImageToGCS(imageData, imageName)
						if err == nil {
							existingPromo.ImageVoucher = imageURL
						}
					}
				}
			}
		}

		if err := db.Save(&existingPromo).Error; err != nil {
			return c.JSON(http.StatusInternalServerError, helper.ErrorResponse{Code: http.StatusInternalServerError, Message: "Failed to update promo"})
		}

		return c.JSON(http.StatusOK, map[string]interface{}{
			"code":       http.StatusOK,
			"error":      false,
			"message":    "Promo updated successfully",
			"promo_data": existingPromo,
		})
	}
}
