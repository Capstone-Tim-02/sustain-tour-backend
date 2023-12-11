package controllers

import (
	"myproject/helper"
	"myproject/middleware"
	"net/http"
	"net/http/httptest"
	"os"
	"testing"

	"github.com/labstack/echo/v4"
	"github.com/stretchr/testify/assert"
)

func TestGetTopWisata(t *testing.T) {

	e := helper.InitEchoTestAPI()
	db, err := helper.InitDBTest("sustain_tour_test_false")
	if err != nil {
		panic(err)
	}

	secretKey := os.Getenv("SECRET_KEY")

	// Token check

	var tokenTestCases = []struct {
		name         string
		token        string
		expectedCode int
	}{
		{
			name:         "Empty Token",
			token:        "",
			expectedCode: http.StatusUnauthorized,
		},
		{
			name:         "Invalid format",
			token:        "token",
			expectedCode: http.StatusUnauthorized,
		},
	}

	for idx, tokenTestCase := range tokenTestCases {

		t.Run(tokenTestCase.name, func(t *testing.T) {

			req := httptest.NewRequest(http.MethodGet, "/", nil)

			if idx == 0 {
				req.Header.Set(echo.HeaderAuthorization, tokenTestCase.token)
			} else {
				req.Header.Set(echo.HeaderAuthorization, "Wrong-Format "+tokenTestCase.token)
			}

			rec := httptest.NewRecorder()
			ctx := e.NewContext(req, rec)
			ctx.SetPath("/")

			getTopWisata := GetTopWisata(db, []byte(secretKey))
			if assert.NoError(t, getTopWisata(ctx)) {
				assert.Equal(t, tokenTestCase.expectedCode, rec.Code)
			}

		})

	}

	adminToken, _ := middleware.GenerateToken("admin", []byte(secretKey))
	userToken, _ := middleware.GenerateToken("putrishn27", []byte(secretKey))
	anyUserToken, _ := middleware.GenerateToken("anyUser", []byte(secretKey))
	falseToken := "false_token"

	var testCases = []struct {
		name       string
		path       string
		expectCode int
		token      string
	}{
		{
			name:       "Unauthorized",
			path:       "/",
			expectCode: http.StatusUnauthorized,
			token:      falseToken,
		},
		{
			name:       "User Request Not Found",
			path:       "/",
			expectCode: http.StatusNotFound,
			token:      anyUserToken,
		},
		{
			name:       "Not Admin",
			path:       "/",
			expectCode: http.StatusForbidden,
			token:      userToken,
		},
		{
			name:       "Success",
			path:       "/",
			expectCode: http.StatusOK,
			token:      adminToken,
		},
	}

	db, err = helper.InitDBTest("sustain_tour_test")
	if err != nil {
		panic(err)
	}

	for _, testCase := range testCases {

		t.Run(testCase.name, func(t *testing.T) {

			req := httptest.NewRequest(http.MethodGet, "/", nil)
			req.Header.Set(echo.HeaderAuthorization, "Bearer "+testCase.token)
			rec := httptest.NewRecorder()
			ctx := e.NewContext(req, rec)
			ctx.SetPath(testCase.path)

			getTopWisata := GetTopWisata(db, []byte(secretKey))
			if assert.NoError(t, getTopWisata(ctx)) {
				assert.Equal(t, testCase.expectCode, rec.Code)
			}

		})

	}

}
