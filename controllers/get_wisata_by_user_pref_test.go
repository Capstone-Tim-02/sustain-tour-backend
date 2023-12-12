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

func TestGetWisataByUserPref(t *testing.T) {

	e := helper.InitEchoTestAPI()
	db, err := helper.InitDBTest(helper.TESTING_DB)
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

			getWisataByUserPref := GetWisataByCategoryKesukaan(db, []byte(secretKey))
			if assert.NoError(t, getWisataByUserPref(ctx)) {
				assert.Equal(t, tokenTestCase.expectedCode, rec.Code)
			}

		})

	}

	userToken, _ := middleware.GenerateToken("putrishn27", []byte(secretKey))
	anyUserToken, _ := middleware.GenerateToken("any", []byte(secretKey))
	falseToken := "false_token"

	testCases := []struct {
		name         string
		path         string
		token        string
		expectedCode int
	}{
		{
			name:         "Unauthorized",
			path:         "/",
			expectedCode: http.StatusUnauthorized,
			token:        falseToken,
		},
		{
			name:         "Failed fetch user data",
			path:         "/",
			expectedCode: http.StatusInternalServerError,
			token:        anyUserToken,
		},
		{
			name:         "Success",
			path:         "/",
			expectedCode: http.StatusOK,
			token:        userToken,
		},
	}

	for _, testCase := range testCases {

		t.Run(testCase.name, func(t *testing.T) {

			req := httptest.NewRequest(http.MethodGet, "/", nil)
			req.Header.Set(echo.HeaderAuthorization, "Bearer "+testCase.token)
			rec := httptest.NewRecorder()
			ctx := e.NewContext(req, rec)
			ctx.SetPath("/")

			getWisataByUserPref := GetWisataByCategoryKesukaan(db, []byte(secretKey))
			if assert.NoError(t, getWisataByUserPref(ctx)) {
				assert.Equal(t, testCase.expectedCode, rec.Code)
			}

		})

	}

}
