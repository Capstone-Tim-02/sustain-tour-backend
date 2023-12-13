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

func TestGetWisataById(t *testing.T) {

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

			getWisataById := GetWisataByID(db, []byte(secretKey))
			if assert.NoError(t, getWisataById(ctx)) {
				assert.Equal(t, tokenTestCase.expectedCode, rec.Code)
			}

		})

	}

	userToken, _ := middleware.GenerateToken("putrishn27", []byte(secretKey))
	falseToken := "false_token"

	var testCases = []struct {
		name       string
		path       string
		expectCode int
		token      string
		wisataId   string
	}{
		{
			name:       "Unauthorized",
			path:       "/",
			expectCode: http.StatusUnauthorized,
			token:      falseToken,
			wisataId:   "2020",
		},
		{
			name:       "Invalid param format",
			path:       "/",
			expectCode: http.StatusBadRequest,
			token:      userToken,
			wisataId:   "a",
		},
		{
			name:       "Wisata not found",
			path:       "/",
			expectCode: http.StatusNotFound,
			token:      userToken,
			wisataId:   "2020",
		},
		{
			name:       "Server error",
			path:       "/",
			expectCode: http.StatusInternalServerError,
			token:      userToken,
			wisataId:   "2",
		},
		{
			name:       "Success",
			path:       "/",
			expectCode: http.StatusOK,
			token:      userToken,
			wisataId:   "2",
		},
	}

	for idx, testCase := range testCases {

		if idx == 3 {
			db, err = helper.InitDBTest(helper.EMPTY_DB)
			assert.NoError(t, err)
		}
		if idx == 4 {
			db, err = helper.InitDBTest(helper.TESTING_DB)
			assert.NoError(t, err)
		}

		t.Run(testCase.name, func(t *testing.T) {

			req := httptest.NewRequest(http.MethodGet, "/", nil)
			req.Header.Set(echo.HeaderAuthorization, "Bearer "+testCase.token)
			rec := httptest.NewRecorder()
			ctx := e.NewContext(req, rec)
			ctx.SetPath(testCase.path)
			ctx.SetParamNames("id")
			ctx.SetParamValues(testCase.wisataId)

			getWisataById := GetWisataByID(db, []byte(secretKey))
			if assert.NoError(t, getWisataById(ctx)) {
				assert.Equal(t, testCase.expectCode, rec.Code)
			}

		})

	}

}
