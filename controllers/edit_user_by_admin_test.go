package controllers

import (
	"encoding/json"
	"myproject/helper"
	"myproject/middleware"
	"myproject/model"
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

			editUser := EditUserByAdmin(db, []byte(secretKey))
			if assert.NoError(t, editUser(ctx)) {
				assert.Equal(t, tokenTestCase.expectedCode, rec.Code)
			}

		})

	}

	adminToken, _ := middleware.GenerateToken("admin", []byte(secretKey))
	userToken, _ := middleware.GenerateToken("putrishn27", []byte(secretKey))
	falseToken := "false_token"

	var testCases = []struct {
		name       string
		path       string
		expectCode int
		userId     string
		token      string
	}{
		{
			name:       "Unauthorized",
			path:       "/",
			expectCode: http.StatusUnauthorized,
			userId:     "1900",
			token:      falseToken,
		},
		{
			name:       "User Request Not Found",
			path:       "/",
			expectCode: http.StatusNotFound,
			userId:     "1900",
			token:      userToken,
		},
		{
			name:       "Not Admin",
			path:       "/",
			expectCode: http.StatusForbidden,
			userId:     "1900",
			token:      userToken,
		},
		{
			name:       "User Not Found",
			path:       "/",
			expectCode: http.StatusNotFound,
			userId:     "1899",
			token:      adminToken,
		},
		{
			name:       "Bind Error",
			path:       "/",
			expectCode: http.StatusBadRequest,
			userId:     "1900",
			token:      adminToken,
		},
		{
			name:       "Success",
			path:       "/",
			expectCode: http.StatusOK,
			userId:     "1900",
			token:      adminToken,
		},
	}

	invalidRequest := struct {
		Name int `json:"name"`
	}{
		Name: 7676,
	}
	validRequest := model.User{
		Name: "Bryan Rizqi",
	}

	jsonBody, _ := json.Marshal(invalidRequest)

	for idx, testCase := range testCases {

		if idx == 2 {
			var err error

			db, err = helper.InitDBTest("sustain_tour_test")
			if err != nil {
				assert.NoError(t, err)
			}

			err = helper.DeleteUserForTest(db)
			assert.NoError(t, err)
			err = helper.InsertUserForTest(db)
			assert.NoError(t, err)
		}

		if idx == 5 {
			jsonBody, _ = json.Marshal(validRequest)
		}

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
