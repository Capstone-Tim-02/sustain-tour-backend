package controllers

import (
	"fmt"
	"myproject/helper"
	"myproject/middleware"
	"net/http"
	"net/http/httptest"
	"os"
	"testing"

	"github.com/labstack/echo/v4"
	"github.com/stretchr/testify/assert"
)

func TestGetTransactionHistoryByInvoice(t *testing.T) {

	e := helper.InitEchoTestAPI()
	db, err := helper.InitDBTest(helper.TESTING_DB)
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

			getTransactionHistory := GetTransactionHistoryByInvoiceNumber(db, []byte(secretKey))
			if assert.NoError(t, getTransactionHistory(ctx)) {
				assert.Equal(t, tokenTestCase.expectedCode, rec.Code)
			}

		})

	}

	userToken, _ := middleware.GenerateToken("steven", []byte(secretKey))
	anyUser, _ := middleware.GenerateToken("any", []byte(secretKey))
	falseToken := "false_token"

	testCases := []struct {
		name          string
		token         string
		invoiceNumber string
		expectedCode  int
	}{
		{
			name:          "Unauthorized",
			token:         falseToken,
			invoiceNumber: "1700741552-565",
			expectedCode:  http.StatusUnauthorized,
		},
		{
			name:          "User not found",
			token:         anyUser,
			invoiceNumber: "1700741552-565",
			expectedCode:  http.StatusInternalServerError,
		},
		{
			name:          "Success",
			token:         userToken,
			invoiceNumber: "1700741552-565",
			expectedCode:  http.StatusOK,
		},
	}

	for _, testCase := range testCases {

		t.Run(testCase.name, func(t *testing.T) {

			req := httptest.NewRequest(http.MethodGet, "/", nil)
			req.Header.Set(echo.HeaderAuthorization, "Bearer "+testCase.token)
			rec := httptest.NewRecorder()
			ctx := e.NewContext(req, rec)
			ctx.SetPath("/")
			ctx.SetParamNames("invoice_number")
			ctx.SetParamValues(testCase.invoiceNumber)

			getTransactionHistory := GetTransactionHistoryByInvoiceNumber(db, []byte(secretKey))
			if assert.NoError(t, getTransactionHistory(ctx)) {
				assert.Equal(t, testCase.expectedCode, rec.Code)
				fmt.Println(rec.Body)
			}

		})

	}

}
