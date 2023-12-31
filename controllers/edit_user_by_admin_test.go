package controllers

import (
	"encoding/json"
	"myproject/helper"
	"myproject/middleware"
	"net/http"
	"net/http/httptest"
	"os"
	"strings"
	"testing"

	"github.com/labstack/echo/v4"
	"github.com/stretchr/testify/assert"
)

func TestEditUserByAdmin(t *testing.T) {

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

			editUser := EditUserByAdmin(db, []byte(secretKey))
			if assert.NoError(t, editUser(ctx)) {
				assert.Equal(t, tokenTestCase.expectedCode, rec.Code)
			}

		})

	}

	adminToken, _ := middleware.GenerateToken("admin", []byte(secretKey))
	userToken, _ := middleware.GenerateToken("putrishn27", []byte(secretKey))
	anyUser, _ := middleware.GenerateToken("any", []byte(secretKey))
	falseToken := "false_token"

	var testCases = []struct {
		name        string
		path        string
		expectCode  int
		userId      string
		token       string
		Username    any    `json:"username"`
		PhoneNumber string `json:"phone_number"`
		Email       string `json:"email"`
		Name        string `json:"name"`
	}{
		{
			name:       "Unauthorized",
			path:       "/",
			expectCode: http.StatusUnauthorized,
			userId:     "1900",
			token:      falseToken,
		},
		{
			name:       "User request not found",
			path:       "/",
			expectCode: http.StatusNotFound,
			userId:     "1900",
			token:      anyUser,
		},
		{
			name:       "Not admin",
			path:       "/",
			expectCode: http.StatusForbidden,
			userId:     "1900",
			token:      userToken,
		},
		{
			name:       "User not found",
			path:       "/",
			expectCode: http.StatusNotFound,
			userId:     "1899",
			token:      adminToken,
		},
		{
			name:       "Bind error",
			path:       "/",
			expectCode: http.StatusBadRequest,
			userId:     "1900",
			token:      adminToken,
			Username:   123,
		},
		{
			name:       "Username validation 1",
			path:       "/",
			expectCode: http.StatusBadRequest,
			userId:     "1900",
			token:      adminToken,
			Username:   "ok",
		},
		{
			name:       "Username validation 2",
			path:       "/",
			expectCode: http.StatusConflict,
			userId:     "1900",
			token:      adminToken,
			Username:   "putrishn27",
		},
		{
			name:        "Phone number validation 1",
			path:        "/",
			expectCode:  http.StatusBadRequest,
			userId:      "1900",
			token:       adminToken,
			PhoneNumber: "wrong",
		},
		{
			name:        "Phone number validation 2",
			path:        "/",
			expectCode:  http.StatusConflict,
			userId:      "1900",
			token:       adminToken,
			PhoneNumber: "7154397970",
		},
		{
			name:       "Email validation 1",
			path:       "/",
			expectCode: http.StatusBadRequest,
			userId:     "1900",
			token:      adminToken,
			Email:      "wrong",
		},
		{
			name:       "Email validation 2",
			path:       "/",
			expectCode: http.StatusConflict,
			userId:     "1900",
			token:      adminToken,
			Email:      "angeline123@gmail.com",
		},
		{
			name:       "Name validation",
			path:       "/",
			expectCode: http.StatusBadRequest,
			userId:     "1900",
			token:      adminToken,
			Name:       "ok",
		},
		{
			name:        "Success",
			path:        "/",
			expectCode:  http.StatusOK,
			userId:      "1900",
			token:       adminToken,
			Username:    "prakozov123",
			PhoneNumber: "0897777777777",
			Email:       "bryanrp777@gmail.com",
			Name:        "Bryan Rizqiev",
		},
	}

	err = helper.DeleteUserForTest(db)
	assert.NoError(t, err)
	err = helper.InsertUserForTest(db)
	assert.NoError(t, err)

	for _, testCase := range testCases {

		jsonBody, _ := json.Marshal(testCase)

		t.Run(testCase.name, func(t *testing.T) {

			req := httptest.NewRequest(http.MethodPost, "/", strings.NewReader(string(jsonBody)))
			req.Header.Set(echo.HeaderAuthorization, "Bearer "+testCase.token)
			req.Header.Set(echo.HeaderContentType, echo.MIMEApplicationJSON)
			rec := httptest.NewRecorder()
			ctx := e.NewContext(req, rec)
			ctx.SetPath(testCase.path)
			ctx.SetParamNames("id")
			ctx.SetParamValues(testCase.userId)

			editUser := EditUserByAdmin(db, []byte(secretKey))
			if assert.NoError(t, editUser(ctx)) {
				assert.Equal(t, testCase.expectCode, rec.Code)
			}

		})

	}

}
