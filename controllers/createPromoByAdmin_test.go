package controllers

import (
	"myproject/model"
	"net/http"
	"net/http/httptest"
	"strings"
	"testing"

	"github.com/labstack/echo/v4"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
)

func setupTestVoucher() *gorm.DB {
	dsn := "root:@tcp(127.0.0.1:3306)/testing?parseTime=True"
	db, err := gorm.Open(mysql.Open(dsn), &gorm.Config{})
	if err != nil {
		panic("Failed to connect to the database")
	}
	db.AutoMigrate(&model.User{}, &model.Promo{}, &model.Notification{})
	return db
}

func TestCreatePromo(t *testing.T) {
	db := setupTestVoucher()
	secretKey := []byte("your-secret-key")

	tests := []struct {
		name     string
		request  string
		expected int
		token 	 string
	}{
		{
			name: "ValidPromoCreation",
			request: `{
				"title": "Promo Hari Travel",
				"nama_promo": "Travel Yuk",
				"kode_voucher": "TRAVEL10",
				"jumlah_potongan_persen": "10",
				"status_aktif": "true",
				"tanggal_kadaluarsa": "2023-12-31",
				"deskripsi": "Get a 10% discount on your purchase",
				"peraturan": "Terms and conditions apply"
			}`,			
			expected: http.StatusOK,
			token: "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiZXhwIjoxNzA0MDg1MDM3LCJpYXQiOjE3MDI4NzU0Mzd9.xE2coMKTq1W8penu0_l8-lqLoocUyCVNTabefRd7_JQ",
		},
		{
			name: "DuplicateVoucherCode",
			request: `{
				"title": "Promo Akhir Bulan",
				"nama_promo": "Another Offer",
				"kode_voucher": "SPECIAL123",  
				"jumlah_potongan_persen": "15",
				"status_aktif": "true",
				"tanggal_kadaluarsa": "2023-12-31",
				"deskripsi": "Get a 15% discount on your purchase",
				"peraturan": "Terms and conditions apply"
			}`,
			expected: http.StatusConflict,
			token: "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiZXhwIjoxNzA0MDg1MDM3LCJpYXQiOjE3MDI4NzU0Mzd9.xE2coMKTq1W8penu0_l8-lqLoocUyCVNTabefRd7_JQ",
		},
		{
			name: "InvalidDiscountPercentage",
			request: `{
				"title": "Promo Libur Panjang",
				"nama_promo": "Holiday It's Here",
				"kode_voucher": "HOLIYAY10",
				"jumlah_potongan_persen": "120",
				"status_aktif": "true",
				"tanggal_kadaluarsa": "2023-12-31",
				"deskripsi": "Get a 20% discount on your purchase",
				"peraturan": "Terms and conditions apply"
			}`,	
			expected: http.StatusBadRequest,
			token: "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiZXhwIjoxNzA0MDg1MDM3LCJpYXQiOjE3MDI4NzU0Mzd9.xE2coMKTq1W8penu0_l8-lqLoocUyCVNTabefRd7_JQ",
		},
		{
			name: "InvalidDateFormat",
			request: `{
				"title": "Promo Akhir Tahun",
				"nama_promo": "End Year Sale",
				"kode_voucher": "HAPPYNEWYEAR20",
				"jumlah_potongan_persen": "20",
				"status_aktif": "true",
				"tanggal_kadaluarsa": "31-12-2023",
				"deskripsi": "Get a 20% discount on your purchase",
				"peraturan": "Terms and conditions apply"
			}`,	
			expected: http.StatusBadRequest,
			token: "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiZXhwIjoxNzA0MDg1MDM3LCJpYXQiOjE3MDI4NzU0Mzd9.xE2coMKTq1W8penu0_l8-lqLoocUyCVNTabefRd7_JQ",
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			e := echo.New()

			req := httptest.NewRequest(http.MethodPost, "/createpromo", strings.NewReader(tt.request))
			req.Header.Set("Content-Type", "application/json")
			
			// Set the Authorization header
            if tt.token != "" {
                req.Header.Set("Authorization", tt.token)
            }
			
			rec := httptest.NewRecorder()
			c := e.NewContext(req, rec)

			handler := CreatePromo(db, secretKey, true)
			err := handler(c)

			if err != nil {
				t.Fatal(err)
			}

			if rec.Code != tt.expected {
				t.Errorf("Expected status code %d, but got %d", tt.expected, rec.Code)
				t.Logf("Response Body: %s", rec.Body.String())
			}
		})
	}
}
