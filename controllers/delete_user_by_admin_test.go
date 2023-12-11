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

func TestDeleteUserByAdmin(t *testing.T) {

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

			deleteUser := DeleteUserByAdmin(db, []byte(secretKey))
			if assert.NoError(t, deleteUser(ctx)) {
				assert.Equal(t, tokenTestCase.expectedCode, rec.Code)
			}

		})

	}

	var testCases = []struct {
		name       string
		path       string
		expectCode int
	}{
		{
			name:       "Unauthorized",
			path:       "/",
			expectCode: http.StatusUnauthorized,
		},
		{
			name:       "Server Error",
			path:       "/",
			expectCode: http.StatusInternalServerError,
		},
		{
			name:       "Not Admin",
			path:       "/",
			expectCode: http.StatusForbidden,
		},
		{
			name:       "User Not Found",
			path:       "/",
			expectCode: http.StatusNotFound,
		},
		{
			name:       "Success",
			path:       "/",
			expectCode: http.StatusOK,
		},
	}

	adminToken, _ := middleware.GenerateToken("admin", []byte(secretKey))
	userToken, _ := middleware.GenerateToken("putrishn27", []byte(secretKey))
	falseToken := "false_token"

	for idx, testCase := range testCases {

		tkn := falseToken
		idParam := "1899"

		if idx == 1 {
			tkn = userToken
		}

		if idx == 2 {
			var err error

			db, err = helper.InitDBTest("sustain_tour_test")
			if err != nil {
				assert.NoError(t, err)
			}

			err = helper.DeleteUserForTest(db)
			if err != nil {
				assert.NoError(t, err)
			}
			err = helper.InsertUserForTest(db)
			if err != nil {
				assert.NoError(t, err)
			}

			tkn = userToken
		}

		if idx == 3 {
			tkn = adminToken
		}

		if idx == 4 {
			tkn = adminToken
			idParam = "1900"
		}

		t.Run(testCase.name, func(t *testing.T) {

			req := httptest.NewRequest(http.MethodGet, "/", nil)
			req.Header.Set(echo.HeaderAuthorization, "Bearer "+tkn)
			rec := httptest.NewRecorder()
			ctx := e.NewContext(req, rec)
			ctx.SetPath(testCase.path)
			ctx.SetParamNames("id")
			ctx.SetParamValues(idParam)

			deleteUser := DeleteUserByAdmin(db, []byte(secretKey))
			if assert.NoError(t, deleteUser(ctx)) {
				assert.Equal(t, testCase.expectCode, rec.Code)
			}
		})

	}

}
