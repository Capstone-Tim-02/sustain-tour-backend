package controllers

import (
	"encoding/json"
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

// nambahin data sesuai model wisata

func CreateWisata(db *gorm.DB, secretKey []byte) echo.HandlerFunc {
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
			errorResponse := helper.ErrorResponse{Code: http.StatusForbidden, Message: "Hanya Admin yang dapat menambahkan wisata"}
			return c.JSON(http.StatusForbidden, errorResponse)
		}

		kode := c.FormValue("kode")
		title := c.FormValue("title")
		location := c.FormValue("location")
		kota := c.FormValue("kota")
		description := c.FormValue("description")
		price := c.FormValue("price")
		availableTickets := c.FormValue("available_tickets")
		lat := c.FormValue("lat")
		long := c.FormValue("long")
		categoryName := c.FormValue("category_name")
		fasilitasStr := c.FormValue("fasilitas")
		priceInt, err := strconv.Atoi(price)

		if len(title) < 8 {
			errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Judul harus minimal 8 huruf"}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}

		if len(title) > 100 {
			errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Judul harus maksimal 100 karakter"}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}

		existingWisata := model.Wisata{}
		result = db.Where("title = ?", title).First(&existingWisata)
		if result.RowsAffected > 0 {
			errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Judul sudah digunakan"}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}

		if len(kode) < 3 {
			errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Kode harus minimal 3 huruf"}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}

		if len(kode) > 5 {
			errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Kode harus maksimal 5 karakter"}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}

		existingKode := model.Wisata{}
		result = db.Where("kode = ?", kode).First(&existingKode)
		if result.RowsAffected > 0 {
			errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Kode sudah digunakan"}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}

		if len(kota) < 4 {
			errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Kota harus minimal 4 huruf"}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}

		if len(kota) > 30 {
			errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Kota harus maksimal 30 huruf"}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}

		if len(location) < 8 {
			errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Lokasi harus minimal 8 huruf"}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}

		if len(location) > 200 {
			errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Lokasi harus maksimal 200 karakter"}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}

		if len(description) < 10 {
			errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Deskripsi harus minimal 10 huruf"}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}

		if len(description) > 2000 {
			errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Deskripsi harus maksimal 2000 karakter"}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}

		if priceInt <= 0 {
			errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Price must be greater than 0"}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}

		if err != nil {
			errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Invalid price value"}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}

		availableTicketsInt, err := strconv.Atoi(availableTickets)
		if err != nil {
			errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Invalid available_tickets value"}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}

		if availableTicketsInt <= 0 {
			errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Available Tickets harus lebih dari 0"}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}

		if len(fasilitasStr) < 5 {
			errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Fasilitas harus lebih dari 5 huruf"}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}

		if len(fasilitasStr) > 100 {
			errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Fasilitas harus maksimal 100 karakter"}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}

		if title == "" {
			errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Judul harus diisi"}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}

		if location == "" {
			errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Lokasi harus diisi"}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}

		if kota == "" {
			errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Kota harus diisi"}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}

		if description == "" {
			errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Deskripsi harus diisi"}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}

		latFloat, err := strconv.ParseFloat(lat, 64)
		if err != nil {
			errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Invalid latitude value"}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}

		longFloat, err := strconv.ParseFloat(long, 64)
		if err != nil {
			errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Invalid longitude value"}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}

		var category model.Category
		result = db.Where("category_name = ?", categoryName).First(&category)
		if result.Error != nil {
			errorResponse := helper.ErrorResponse{Code: http.StatusNotFound, Message: "Category not found"}
			return c.JSON(http.StatusNotFound, errorResponse)
		}

		//mengubah string menjadi potongan slice
		fasilitas := strings.Split(fasilitasStr, ",")
		if len(fasilitas) == 0 {
			errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Fasilitas harus di isi minimal satu "}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}

		// Menghapus karakter escape ganda dari awal dan akhir string
		for i, f := range fasilitas {
			fasilitas[i] = strings.Trim(f, "\"")
		}

		// Digunakan untuk mengubah atau konversi dari slice menjadi format slice
		fasilitasJSON, err := json.Marshal(fasilitas)
		if err != nil {
			errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Gagal mengonversi fasilitas ke JSON"}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}

		mapsLink := c.FormValue("maps_link")
		isopenStr := c.FormValue("is_open")
		isopen, err := strconv.ParseBool(isopenStr)
		descriptionIsOpen := c.FormValue("description_is_open")
		videoLink := c.FormValue("video_link")

		if isopenStr == "" {
			errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Field 'is_open' harus diisi"}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}

		if err != nil {
			errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Invalid is_open value"}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}

		if len(mapsLink) < 5 {
			errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Link maps harus lebih dari 5 huruf"}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}

		if len(mapsLink) > 200 {
			errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Link maps harus maksimal 200 karakter"}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}

		if mapsLink == "" {
			errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Anda harus memasukan link maps_link"}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}

		if len(descriptionIsOpen) < 5 {
			errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "DescriptionIsOpen harus lebih dari 5 huruf"}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}

		if len(descriptionIsOpen) > 40 {
			errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "DescriptionIsOpen harus maksimal 40 karakter"}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}

		if descriptionIsOpen == "" {
			errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Anda harus memasukan description_is_open, keterangan buka jam berapa sampai jam berapa"}
			return c.JSON(http.StatusBadRequest, errorResponse)
		}

		randomString := helper.GenerateRandomString(10)

		createdWisata := model.Wisata{
			Kode:              kode,
			Title:             title,
			Location:          location,
			Kota:              kota,
			Description:       description,
			Price:             priceInt,
			AvailableTickets:  availableTicketsInt,
			Lat:               latFloat,
			Long:              longFloat,
			UserID:            adminUser.ID,
			CreatedAt:         &[]time.Time{time.Now()}[0],
			CategoryID:        category.ID,
			MapsLink:          mapsLink,
			IsOpen:            isopen,
			DescriptionIsOpen: descriptionIsOpen,
			Fasilitas:         string(fasilitasJSON),
			VideoLink:         videoLink,
		}

		var imageUrls []string
		var photoNames []string
		for i := 1; i <= 3; i++ {
			imageFormField := fmt.Sprintf("image%d", i)
			imageFile, err := c.FormFile(imageFormField)
			if err != nil {
				if i == 1 {
					errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Setidaknya satu gambar diperlukan."}
					return c.JSON(http.StatusBadRequest, errorResponse)
				}
				break
			}

			if !helper.IsImageFile(imageFile) {
				errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Jenis file tidak valid. Hanya file gambar yang diperbolehkan."}
				return c.JSON(http.StatusBadRequest, errorResponse)
			}

			if helper.IsFileSizeExceeds(imageFile, 5*1024*1024) {
				errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Ukuran file melebihi batas yang diizinkan (5MB)."}
				return c.JSON(http.StatusBadRequest, errorResponse)
			}

			src, err := imageFile.Open()
			if err != nil {
				errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Gagal membuka file gambar"}
				return c.JSON(http.StatusBadRequest, errorResponse)
			}
			defer src.Close()

			imageData, err := io.ReadAll(src)
			if err != nil {
				errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Gagal membaca data gambar"}
				return c.JSON(http.StatusBadRequest, errorResponse)
			}

			timestamp := time.Now().Unix()
			imageName := fmt.Sprintf("wisatas/wisata/image_%s_%d_%d.jpg", randomString, timestamp, i)
			imageURL, err := helper.UploadImageToGCS(imageData, imageName)
			if err != nil {
				errorResponse := helper.ErrorResponse{Code: http.StatusInternalServerError, Message: "Gagal mengunggah gambar ke GCS"}
				return c.JSON(http.StatusInternalServerError, errorResponse)
			}

			imageUrls = append(imageUrls, imageURL)
			photoNames = append(photoNames, imageName)
		}

		if len(imageUrls) >= 1 {
			createdWisata.PhotoWisata1 = imageUrls[0]
		}
		if len(imageUrls) >= 2 {
			createdWisata.PhotoWisata2 = imageUrls[1]
		}
		if len(imageUrls) >= 3 {
			createdWisata.PhotoWisata3 = imageUrls[2]
		}

		if err := db.Create(&createdWisata).Error; err != nil {
			errorResponse := helper.ErrorResponse{Code: http.StatusInternalServerError, Message: "Gagal menyimpan wisata"}
			return c.JSON(http.StatusInternalServerError, errorResponse)
		}

		if err := db.Preload("Category").First(&createdWisata, createdWisata.ID).Error; err != nil {
			errorResponse := helper.ErrorResponse{Code: http.StatusInternalServerError, Message: "Gagal memuat data kategori"}
			return c.JSON(http.StatusInternalServerError, errorResponse)
		}

		return c.JSON(http.StatusOK, map[string]interface{}{
			"code":       http.StatusOK,
			"error":      false,
			"message":    "Wisata berhasil dibuat",
			"wisataData": createdWisata,
		})
	}
}
