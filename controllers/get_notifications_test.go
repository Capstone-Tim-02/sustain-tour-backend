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

func TestGetNotifications(t *testing.T) {

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

			getNotifications := GetUserNotifications(db, []byte(secretKey))
			if assert.NoError(t, getNotifications(ctx)) {
				assert.Equal(t, tokenTestCase.expectedCode, rec.Code)
			}

		})

	}

	userToken, _ := middleware.GenerateToken("aimrzki", []byte(secretKey))
	anyUserToken, _ := middleware.GenerateToken("anyUser", []byte(secretKey))
	falseToken := "false_token"

	testCases := []struct {
		name         string
		token        string
		expectedCode int
	}{
		{
			name:         "Unauthorized",
			token:        falseToken,
			expectedCode: http.StatusUnauthorized,
		},
		{
			name:         "User not found",
			token:        anyUserToken,
			expectedCode: http.StatusInternalServerError,
		},
		{
			name:         "Success",
			token:        userToken,
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

			getNotifications := GetUserNotifications(db, []byte(secretKey))
			if assert.NoError(t, getNotifications(ctx)) {
				assert.Equal(t, testCase.expectedCode, rec.Code)
			}

		})

	}

}

func TestMarkNotification(t *testing.T) {

	e := helper.InitEchoTestAPI()
	db, err := helper.InitDBTest(helper.TESTING_DB)
	if err != nil {
		panic(err)
	}

	secretKey := os.Getenv("SECRET_KEY")

	testCases := []struct {
		name           string
		notificationId string
		expectedCode   int
	}{
		{
			name:           "Notification not found",
			notificationId: "7777",
			expectedCode:   http.StatusNotFound,
		},
		{
			name:           "Success",
			notificationId: "1",
			expectedCode:   http.StatusOK,
		},
	}

	for _, testCase := range testCases {

		t.Run(testCase.name, func(t *testing.T) {

			req := httptest.NewRequest(http.MethodGet, "/", nil)
			rec := httptest.NewRecorder()
			ctx := e.NewContext(req, rec)
			ctx.SetPath("/")
			ctx.SetParamNames("id")
			ctx.SetParamValues(testCase.notificationId)

			markNotification := MarkNotificationAsRead(db, []byte(secretKey))
			if assert.NoError(t, markNotification(ctx)) {
				assert.Equal(t, testCase.expectedCode, rec.Code)
			}

		})

	}

}
