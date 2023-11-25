package controllers

import (
	"encoding/json"
	"fmt"
	"io"
	"myproject/helper"
	"myproject/middleware"
	"myproject/model"
	"net/http"
	"strconv"
	"strings"
	"time"

	"github.com/labstack/echo/v4"
	"gorm.io/gorm"
)

func UpdateWisata(db *gorm.DB, secretKey []byte) echo.HandlerFunc {
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

		var adminUser model.User
		result := db.Where("username = ?", username).First(&adminUser)
		if result.Error != nil {
			errorResponse := helper.ErrorResponse{Code: http.StatusNotFound, Message: "Anda bukan admin!"}
			return c.JSON(http.StatusNotFound, errorResponse)
		}

		if !adminUser.IsAdmin {
			errorResponse := helper.ErrorResponse{Code: http.StatusForbidden, Message: "Hanya Admin yang dapat mengedit wisata"}
			return c.JSON(http.StatusForbidden, errorResponse)
		}

		wisataID, err := strconv.Atoi(c.Param("id"))
		if err != nil {
			errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Invalid Wisata ID"}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}

		var existingWisata model.Wisata
		result = db.First(&existingWisata, wisataID)
		if result.Error != nil {
			errorResponse := helper.ErrorResponse{Code: http.StatusNotFound, Message: "Wisata not found"}
			return c.JSON(http.StatusNotFound, errorResponse)
		}

		kode := c.FormValue("kode")
		title := c.FormValue("title")
		location := c.FormValue("location")
		kota := c.FormValue("kota")
		description := c.FormValue("description")
		price := c.FormValue("price")
		lat := c.FormValue("lat")
		long := c.FormValue("long")
		availableTickets := c.FormValue("available_tickets")
		categoryName := c.FormValue("category_name")
		mapsLink := c.FormValue("maps_link")
		isOpenStr := c.FormValue("is_open")
		descriptionIsOpen := c.FormValue("description_is_open")
		fasilitasStr := c.FormValue("fasilitas")
		videoLink := c.FormValue("video_link")

		if fasilitasStr != "" {
			fasilitas := strings.Split(fasilitasStr, ",")
			for _, f := range fasilitas {
				if len(strings.Trim(f, "\"")) < 5 {
					errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Setiap fasilitas harus minimal terdiri dari 5 huruf"}
					return c.JSON(http.StatusBadRequest, errorResponse)
				}

				if len(fasilitasStr) > 100 {
					errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Fasilitas harus maksimal 100 karakter"}
					return c.JSON(http.StatusBadRequest, errorResponse)
				}
			}
			fasilitasJSON, err := json.Marshal(fasilitas)
			if err != nil {
				errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Gagal mengonversi fasilitas ke JSON"}
				return c.JSON(http.StatusBadRequest, errorResponse)
			}
			existingWisata.Fasilitas = string(fasilitasJSON)
		}

		if kode != "" {
			if len(kode) < 3 {
				errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Kode harus minimal terdiri dari 3 huruf"}
				return c.JSON(http.StatusBadRequest, errorResponse)
			}

			var existingKodeCount int64
			db.Model(&model.Wisata{}).Where("kode = ?", kode).Not("id = ?", wisataID).Count(&existingKodeCount)
			if existingKodeCount > 0 {
				errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Kode sudah ada, pilih Kode lain"}
				return c.JSON(http.StatusBadRequest, errorResponse)
			}
			existingWisata.Kode = kode
		}

		if title != "" {
			if len(title) < 8 {
				errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Title harus minimal terdiri dari 8 huruf"}
				return c.JSON(http.StatusBadRequest, errorResponse)
			}

			if len(title) > 100 {
				errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Title harus maksimal 100 karakter"}
				return c.JSON(http.StatusBadRequest, errorResponse)
			}

			var existingTitleCount int64
			db.Model(&model.Wisata{}).Where("title = ?", title).Not("id = ?", wisataID).Count(&existingTitleCount)
			if existingTitleCount > 0 {
				errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Title sudah ada, pilih title lain"}
				return c.JSON(http.StatusBadRequest, errorResponse)
			}
			existingWisata.Title = title
		}

		if location != "" {
			if len(location) < 8 {
				errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Location harus minimal terdiri dari 8 huruf"}
				return c.JSON(http.StatusBadRequest, errorResponse)
			}

			if len(location) > 200 {
				errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Location harus maksimal 200 karakter"}
				return c.JSON(http.StatusBadRequest, errorResponse)
			}
		}

		if location != "" {
			existingWisata.Location = location
		}

		if kota != "" {
			if len(kota) < 4 {
				errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Kota harus minimal terdiri dari 4 huruf"}
				return c.JSON(http.StatusBadRequest, errorResponse)
			}

			if len(kota) > 30 {
				errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Kota harus maksimal 30 karakter"}
				return c.JSON(http.StatusBadRequest, errorResponse)
			}
		}

		if kota != "" {
			existingWisata.Kota = kota
		}

		if description != "" {
			if len(description) < 10 {
				errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Description harus minimal terdiri dari 10 huruf"}
				return c.JSON(http.StatusBadRequest, errorResponse)
			}

			if len(description) > 2000 {
				errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Description harus maksimal 2000 karakter"}
				return c.JSON(http.StatusBadRequest, errorResponse)
			}
		}

		if description != "" {
			existingWisata.Description = description
		}

		if price != "" {
			priceInt, err := strconv.Atoi(price)
			if err != nil || priceInt <= 0 {
				errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Price harus lebih besar dari 0"}
				return c.JSON(http.StatusBadRequest, errorResponse)
			}
			existingWisata.Price = priceInt
		}

		if lat != "" {
			latFloat, err := strconv.ParseFloat(lat, 64)
			if err != nil {
				errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Invalid latitude value"}
				return c.JSON(http.StatusBadRequest, errorResponse)
			}
			existingWisata.Lat = latFloat
		}
		if long != "" {
			longFloat, err := strconv.ParseFloat(long, 64)
			if err != nil {
				errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Invalid longitude value"}
				return c.JSON(http.StatusBadRequest, errorResponse)
			}
			existingWisata.Long = longFloat
		}

		if availableTickets != "" {
			availableTicketsInt, err := strconv.Atoi(availableTickets)
			if err != nil || availableTicketsInt <= 0 {
				errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Available Tickets harus lebih dari 0"}
				return c.JSON(http.StatusBadRequest, errorResponse)
			}
			existingWisata.AvailableTickets = availableTicketsInt
		}

		if categoryName != "" {
			var existingCategory model.Category
			if err := db.Where("category_name = ?", categoryName).First(&existingCategory).Error; err != nil {
				errorResponse := helper.ErrorResponse{Code: http.StatusNotFound, Message: "Category not found"}
				return c.JSON(http.StatusNotFound, errorResponse)
			}
			existingWisata.Category = existingCategory
		}

		if mapsLink != "" {
			if len(mapsLink) < 5 {
				errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Maps Link harus minimal terdiri dari 5 huruf"}
				return c.JSON(http.StatusBadRequest, errorResponse)
			}

			if len(mapsLink) > 200 {
				errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Maps Link harus maksimal 200 karakter"}
				return c.JSON(http.StatusBadRequest, errorResponse)
			}
		}

		if mapsLink != "" {
			existingWisata.MapsLink = mapsLink
		}

		if videoLink != "" {
			existingWisata.VideoLink = videoLink
		}

		if isOpenStr != "" {
			isOpen, err := strconv.ParseBool(isOpenStr)
			if err != nil {
				errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Invalid is_open value"}
				return c.JSON(http.StatusBadRequest, errorResponse)
			}
			existingWisata.IsOpen = isOpen
		}

		if descriptionIsOpen != "" {
			if len(descriptionIsOpen) < 5 {
				errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Description Is Open harus minimal terdiri dari 5 huruf"}
				return c.JSON(http.StatusBadRequest, errorResponse)
			}

			if len(descriptionIsOpen) > 40 {
				errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Description Is Open harus maksimal 40 karakter"}
				return c.JSON(http.StatusBadRequest, errorResponse)
			}
		}

		if descriptionIsOpen != "" {
			existingWisata.DescriptionIsOpen = descriptionIsOpen
		}

		for i := 1; i <= 3; i++ {
			imageFormField := fmt.Sprintf("image%d", i)
			imageFile, err := c.FormFile(imageFormField)
			if err == nil {
				if helper.IsImageFile(imageFile) {
					if !helper.IsFileSizeExceeds(imageFile, 5*1024*1024) {
						src, err := imageFile.Open()
						if err == nil {
							defer src.Close()
							imageData, err := io.ReadAll(src)
							if err == nil {
								timestamp := time.Now().Unix()
								imageName := fmt.Sprintf("wisata%d/photo%d_%d.jpg", wisataID, i, timestamp)
								imageURL, err := helper.UploadImageToGCS(imageData, imageName)
								if err == nil {
									if i == 1 {
										existingWisata.PhotoWisata1 = imageURL
									} else if i == 2 {
										existingWisata.PhotoWisata2 = imageURL
									} else if i == 3 {
										existingWisata.PhotoWisata3 = imageURL
									}
								}
							}
						}
					}
				}
			}
		}

		if err := db.Save(&existingWisata).Error; err != nil {
			errorResponse := helper.ErrorResponse{Code: http.StatusInternalServerError, Message: "Failed to save changes to Wisata"}
			return c.JSON(http.StatusInternalServerError, errorResponse)
		}

		// Preload Category
		result = db.Preload("Category").First(&existingWisata, wisataID)
		if result.Error != nil {
			errorResponse := helper.ErrorResponse{Code: http.StatusNotFound, Message: "Wisata not found"}
			return c.JSON(http.StatusNotFound, errorResponse)
		}

		return c.JSON(http.StatusOK, map[string]interface{}{
			"code":       http.StatusOK,
			"error":      false,
			"message":    "Wisata updated successfully",
			"wisataData": existingWisata,
		})
	}
}
