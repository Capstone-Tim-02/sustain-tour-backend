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

func setupTestCategory() *gorm.DB {
	dsn := "root:@tcp(127.0.0.1:3306)/testing?parseTime=True"
	db, err := gorm.Open(mysql.Open(dsn), &gorm.Config{})
	if err != nil {
		panic("Failed to connect to the database")
	}
	db.AutoMigrate(&model.User{}, &model.Notification{})
	return db
}

func TestCreateCategory(t *testing.T) {
	db := setupTestVoucher()
	secretKey := []byte("your-secret-key")

	tests := []struct {
		name     string
		request  string
		expected int
		token 	 string
	}{
		{
			name: "ValidCategoryCreation",
			request: `{
        		"category_name": "Wisata Pantai"
    		}`,
			expected: http.StatusCreated,
			token: "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiZXhwIjoxNzA0MTkzMDkwLCJpYXQiOjE3MDI5ODM0OTB9.JG2zCWuN1HjMVVEyrzpiVCFPMFiVaMRkCYR17_laqrM",
		},
		{
			name: "EmptyCategoryName",
			request: `{
        		"category_name": ""
    		}`,
			expected: http.StatusBadRequest,
			token: "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiZXhwIjoxNzA0MTkzMDkwLCJpYXQiOjE3MDI5ODM0OTB9.JG2zCWuN1HjMVVEyrzpiVCFPMFiVaMRkCYR17_laqrM",
		},
		{
			name: "DuplicateCategoryCreation",
			request: `{
        		"category_name": "Wisata Alam"
    		}`,
			expected: http.StatusConflict,
			token: "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiZXhwIjoxNzA0MTkzMDkwLCJpYXQiOjE3MDI5ODM0OTB9.JG2zCWuN1HjMVVEyrzpiVCFPMFiVaMRkCYR17_laqrM",
		},
		{
			name: "InvalidToken",
			request: `{
        		"category_name": "Wisata Untuk Anak"
    		}`,
			expected: http.StatusUnauthorized,
			token: "Bearer eyhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiZXhwIjoxNzA0MTkzMDkwLCJpYXQiOjE3MDI5ODM0OTB9.JG2zCWuN1HjMVVEyrzpiVCFPMFiVaMRkCYR17_laqrM",
		},
		{
			name: "Missing Token",
			request: `{
        		"category_name": "Wisata Untuk Anak"
    		}`,
			expected: http.StatusUnauthorized,
			token: "",
		},
		{
			name: "LongCategoryName",
			request: `{
 				"category_name": "A very long category name that exceeds the allowed limit for category names"
			}`,
			expected: http.StatusBadRequest,
			token: "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiZXhwIjoxNzA0MTkzMDkwLCJpYXQiOjE3MDI5ODM0OTB9.JG2zCWuN1HjMVVEyrzpiVCFPMFiVaMRkCYR17_laqrM",
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			e := echo.New()

			req := httptest.NewRequest(http.MethodPost, "/createcategory", strings.NewReader(tt.request))
			req.Header.Set("Content-Type", "application/json")
			
			// Set the Authorization header
            if tt.token != "" {
                req.Header.Set("Authorization", tt.token)
            }
			
			rec := httptest.NewRecorder()
			c := e.NewContext(req, rec)

			handler := CreateCategoryByAdmin(db, secretKey)
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
