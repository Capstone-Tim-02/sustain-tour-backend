package controllers

import (
	"bytes"
	"mime/multipart"
	"myproject/helper"
	"myproject/middleware"
	"net/http"
	"net/http/httptest"
	"os"
	"testing"

	"github.com/labstack/echo/v4"
	"github.com/stretchr/testify/assert"
)

func TestEditUser(t *testing.T) {

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

			editUser := EditUser(db, []byte(secretKey))
			if assert.NoError(t, editUser(ctx)) {
				assert.Equal(t, tokenTestCase.expectedCode, rec.Code)
			}

		})

	}

	userToken, _ := middleware.GenerateToken("steven", []byte(secretKey))
	anyUser, _ := middleware.GenerateToken("any", []byte(secretKey))
	falseToken := "false_token"

	testCases := []struct {
		name             string
		Name             string
		Username         string
		Email            string
		PhoneNumber      string
		CategoryKesukaan string
		token            string
		expectedCode     int
	}{
		{
			name:         "Unauthorized",
			token:        falseToken,
			expectedCode: http.StatusUnauthorized,
		},
		{
			name:         "User req not found",
			token:        anyUser,
			expectedCode: http.StatusNotFound,
		},
		{
			name:         "Invalid format",
			token:        userToken,
			expectedCode: http.StatusBadRequest,
		},
	}

	for _, testCase := range testCases {

		bodyBuffer := new(bytes.Buffer)
		mw := multipart.NewWriter(bodyBuffer)
		mw.WriteField("name", testCase.Name)
		mw.Close()

		t.Run(testCase.name, func(t *testing.T) {

			req := httptest.NewRequest(http.MethodPut, "/", bodyBuffer)
			req.Header.Set(echo.HeaderAuthorization, "Bearer "+testCase.token)
			req.Header.Set(echo.HeaderContentType, "multipart/form-data; boundary=----WebKitFormBoundaryAaBbCcDdEeFfGgHhIiJjKkLlMm---EOF")
			rec := httptest.NewRecorder()
			ctx := e.NewContext(req, rec)
			ctx.SetPath("/")
			ctx.SetParamNames("id")
			ctx.SetParamValues("1")

			editUser := EditUser(db, []byte(secretKey))
			if assert.NoError(t, editUser(ctx)) {
				assert.Equal(t, testCase.expectedCode, rec.Code)
			}

		})

	}

}
