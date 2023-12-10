package controllers

import (
	"os"

	"encoding/json"
	"myproject/config"
	"myproject/model"
	"net/http"
	"net/http/httptest"
	"testing"

	"github.com/stretchr/testify/assert"
)

func InsertDataTnCForGetTnCs() error {
	term_condition := model.TermCondition{
		Name:     	 "User Agreement",
		Description: "This User Agreement (this 'Agreement') is a contract between you ('you' or 'User') and Destimate (Storetasker', 'we', 'our' or 'us'). You must read, agree to, and accept all of the terms and conditions contained in this Agreement in order to use our application. All affiliated applications, including websites owned and operated by us, our predecessors or successors in interest, or our Affiliates (collectively, the 'Site'), all services. applications and products that are accessible through the Site and all Storetasker mobile applications that link to or reference this Agreement ('Services') whether provided by us or our Affiliates.",
	}

	var err error
	if err = config.DB.Create(&term_condition).Error; err != nil {
		return err
	}
	return nil
}

func TestGetTermConditionByID(t *testing.T) {
	var testCases = []struct {
		name       string
		path       string
		expectCode int
		dataName	 string
		id				 string
		errors     bool
		message    string
		token			 string
	}{
		{
			name:       "get term condition normal",
			path:       "/tnc/:id",
			expectCode: http.StatusOK,
			dataName:   "User Agreement",
			id:   			"1",
			errors:			false,
			message:    "",
			token: 			"Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiZXhwIjoxNzAyMTMwNzkxLCJpYXQiOjE3MDIwNDQzOTF9.8QQ6da-gkH9Xz-UemUy8mC-lBmSWGS4pQRZHBn3qzI0",
		},
		{
			name:       "get term condition without token",
			path:       "/tnc/:id",
			expectCode: http.StatusUnauthorized,
			dataName:   "User Agreement",
			id:   			"1",
			errors:			false,
			message:    "Authorization token is missing",
			token: 			"",
		},
		{
			name:       "get term condition with invalid token format",
			path:       "/tnc/:id",
			expectCode: http.StatusUnauthorized,
			dataName:   "User Agreement",
			id:   			"1",
			errors:			false,
			message:    "Invalid token format",
			token: 			"Bearer-eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiZXhwIjoxNzAyMTMwNzkxLCJpYXQiOjE3MDIwNDQzOTF9.8QQ6da-gkH9Xz-UemUy8mC-lBmSWGS4pQRZHBn3qzI0",
		},
		{
			name:       "get term condition with invalid token",
			path:       "/tnc/:id",
			expectCode: http.StatusUnauthorized,
			dataName:   "User Agreement",
			id:   			"1",
			errors:			false,
			message:    "Invalid token",
			token: 			"Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6Imltc3RlZmFubnkiLCJleHAiOjE3MDE5Njc3NTAsImlhdCI6MTcwMTg4MTM1MH0.RMRRDbnOb-fHrVTC7T4kSCKiFPXnAniwJENsLPEEQ2Q",
		},
		{
			name:       "get term condition with data not found",
			path:       "/tnc/:id",
			expectCode: http.StatusNotFound,
			dataName:   "User Agreement",
			id:   			"1000",
			errors:			false,
			message:    "TermCondition not found",
			token: 			"Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluIiwiZXhwIjoxNzAyMTMwNzkxLCJpYXQiOjE3MDIwNDQzOTF9.8QQ6da-gkH9Xz-UemUy8mC-lBmSWGS4pQRZHBn3qzI0",
		},
	}

	e := config.InitEchoTestAPI()
	e.Debug = false
	InsertDataTnCForGetTnCs()

	for _, testCase := range testCases {
		req := httptest.NewRequest(http.MethodGet, "/", nil)
		req.Header.Set("Authorization", testCase.token)
		rec := httptest.NewRecorder()

		c := e.NewContext(req, rec)
		c.SetPath(testCase.path)
		c.SetParamNames("id")
		c.SetParamValues(testCase.id)

		tmp := GetTermConditionByID(config.DB, []byte(os.Getenv("SECRET_KEY")))
		if assert.NoError(t, tmp(c)) {
			assert.Equal(t, testCase.expectCode, rec.Code)
			body := rec.Body.String()

			type TnCResponse struct {
				Code 		int
				Error		bool
				Message string
				Term_condition   	model.TermCondition
			}
			var termcondition TnCResponse
			err := json.Unmarshal([]byte(body), &termcondition)

			if err != nil {
				assert.Error(t, err, "error")
			}

			if rec.Code == 200 {
				assert.Equal(t, testCase.errors, termcondition.Error)
				assert.Equal(t, testCase.dataName, termcondition.Term_condition.Name)
			} else {
				assert.Equal(t, testCase.message, termcondition.Message)
			}
		}
	}
}
