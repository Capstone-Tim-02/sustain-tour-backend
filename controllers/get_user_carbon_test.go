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

func TestGetUserCarbon(t *testing.T) {

	e := helper.InitEchoTestAPI()
	db, err := helper.InitDBTest("sustain_tour_test")
	if err != nil {
		panic(err)
	}

	secretKey := os.Getenv("SECRET_KEY")

	// Token check

	tokenTestCases := []struct {
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

			getUsercarbon := GetTotalCarbonFootprintByUser(db, []byte(secretKey))
			if assert.NoError(t, getUsercarbon(ctx)) {
				assert.Equal(t, tokenTestCase.expectedCode, rec.Code)
			}

		})

	}

	adminToken, _ := middleware.GenerateToken("admin", []byte(secretKey))
	userToken, _ := middleware.GenerateToken("putrishn27", []byte(secretKey))
	anyUser, _ := middleware.GenerateToken("any", []byte(secretKey))
	falseToken := "false_token"

	testCases := []struct {
		name         string
		token        string
		userId       string
		expectedCode int
	}{
		{
			name:         "Unauthorized",
			token:        falseToken,
			userId:       "32",
			expectedCode: http.StatusUnauthorized,
		},
		{
			name:         "User not found",
			token:        anyUser,
			userId:       "32",
			expectedCode: http.StatusNotFound,
		},
		{
			name:         "Invalid param",
			token:        userToken,
			userId:       "wrong",
			expectedCode: http.StatusBadRequest,
		},
		{
			name:         "Access denied",
			token:        userToken,
			userId:       "32",
			expectedCode: http.StatusForbidden,
		},
		{
			name:         "Success",
			token:        adminToken,
			userId:       "32",
			expectedCode: http.StatusOK,
		},
	}

	for _, testCase := range testCases {

		t.Run(testCase.name, func(t *testing.T) {

			req := httptest.NewRequest(http.MethodGet, "/", nil)
			req.Header.Set(echo.HeaderAuthorization, "Bearer "+testCase.token)
			rec := httptest.NewRecorder()
			ctx := e.NewContext(req, rec)
			ctx.SetPath("/")
			ctx.SetParamNames("user_id")
			ctx.SetParamValues(testCase.userId)

			getUsercarbon := GetTotalCarbonFootprintByUser(db, []byte(secretKey))
			if assert.NoError(t, getUsercarbon(ctx)) {
				assert.Equal(t, testCase.expectedCode, rec.Code)
			}

		})

	}

}
