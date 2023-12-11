package controllers

import (
	"encoding/json"
	"myproject/helper"
	"net/http"
	"net/http/httptest"
	"strings"
	"testing"

	"github.com/labstack/echo/v4"
	"github.com/stretchr/testify/assert"
)

func TestCreateCooperationMessage(t *testing.T) {

	e := helper.InitEchoTestAPI()
	db, err := helper.InitDBTest("sustain_tour_test_false")
	if err != nil {
		panic(err)
	}

	testCases := []struct {
		name         string
		FirstName    any    `json:"first_name"`
		Email        string `json:"email"`
		PhoneNumber  string `json:"phone_number"`
		Message      string `json:"message"`
		expectedCode int
	}{
		{
			name:         "Bind error",
			FirstName:    1900,
			expectedCode: http.StatusBadRequest,
		},
		{
			name:         "First name validation",
			FirstName:    "Ok",
			expectedCode: http.StatusBadRequest,
		},
		{
			name:         "Email validation",
			FirstName:    "It's Oke",
			Email:        "wrong",
			expectedCode: http.StatusBadRequest,
		},
		{
			name:         "Only nunmber phone number validation",
			FirstName:    "It's Oke",
			Email:        "bryan@gmail.com",
			PhoneNumber:  "abc",
			expectedCode: http.StatusBadRequest,
		},
		{
			name:         "Min 10 digit phone number validation",
			FirstName:    "It's Oke",
			Email:        "bryan@gmail.com",
			PhoneNumber:  "123456",
			expectedCode: http.StatusBadRequest,
		},
		{
			name:         "Message validation",
			FirstName:    "It's Oke",
			Email:        "bryan@gmail.com",
			PhoneNumber:  "0823456789",
			expectedCode: http.StatusBadRequest,
			Message:      "Kurang",
		},
		{
			name:         "Success",
			FirstName:    "It's Oke",
			Email:        "bryan@gmail.com",
			PhoneNumber:  "0823456789",
			expectedCode: http.StatusCreated,
			Message:      "Ini adalah pesan untuk mengajak kerja sama bukan kerja paksa",
		},
	}

	for _, testCase := range testCases {

		jsonBody, _ := json.Marshal(testCase)

		t.Run(testCase.name, func(t *testing.T) {

			req := httptest.NewRequest(http.MethodPost, "/", strings.NewReader(string(jsonBody)))
			req.Header.Set(echo.HeaderContentType, echo.MIMEApplicationJSON)
			rec := httptest.NewRecorder()
			ctx := e.NewContext(req, rec)
			ctx.SetPath("/")

			getWisataById := CreateCooperationMessage(db)
			if assert.NoError(t, getWisataById(ctx)) {
				assert.Equal(t, testCase.expectedCode, rec.Code)
			}

		})

	}

}
