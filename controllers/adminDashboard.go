package controllers

import (
	"github.com/labstack/echo/v4"
	"gorm.io/gorm"
	"myproject/helper"
	"myproject/middleware"
	"myproject/model"
	"net/http"
	"strings"
	"time"
)

func GetAdminDashboardData(db *gorm.DB, secretKey []byte) echo.HandlerFunc {
	return func(c echo.Context) error {
		tokenString := c.Request().Header.Get("Authorization")
		if tokenString == "" {
			errorResponse := helper.ErrorResponse{Code: http.StatusUnauthorized, Message: "Authorization token is missing"}
			return c.JSON(http.StatusUnauthorized, errorResponse)
		}

		authParts := strings.SplitN(tokenString, " ", 2)
		if len(authParts) != 2 || authParts[0] != "Bearer" {
			errorResponse := helper.ErrorResponse{Code: http.StatusUnauthorized, Message: "Invalid token format"}
			return c.JSON(http.StatusUnauthorized, errorResponse)
		}

		tokenString = authParts[1]

		username, err := middleware.VerifyToken(tokenString, secretKey)
		if err != nil {
			errorResponse := helper.ErrorResponse{Code: http.StatusUnauthorized, Message: "Invalid token"}
			return c.JSON(http.StatusUnauthorized, errorResponse)
		}

		var adminUser model.User
		result := db.Where("username = ?", username).First(&adminUser)
		if result.Error != nil {
			errorResponse := helper.ErrorResponse{Code: http.StatusNotFound, Message: "Admin user not found"}
			return c.JSON(http.StatusNotFound, errorResponse)
		}

		if !adminUser.IsAdmin {
			errorResponse := helper.ErrorResponse{Code: http.StatusForbidden, Message: "Access denied"}
			return c.JSON(http.StatusForbidden, errorResponse)
		}

		startDateStr := c.QueryParam("start_date")
		endDateStr := c.QueryParam("end_date")

		var startDate, endDate time.Time
		var errDate error

		if startDateStr == "" || endDateStr == "" {
			currentDate := time.Now()
			startDate = time.Date(currentDate.Year(), currentDate.Month(), 1, 0, 0, 0, 0, time.UTC)
			endDate = startDate.AddDate(0, 1, 0).Add(-time.Second)
		} else {
			if startDate, errDate = time.Parse("2006-01-02", startDateStr); errDate != nil {
				errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Invalid start date format. Use YYYY-MM-DD"}
				return c.JSON(http.StatusBadRequest, errorResponse)
			}

			if endDate, errDate = time.Parse("2006-01-02", endDateStr); errDate != nil {
				errorResponse := helper.ErrorResponse{Code: http.StatusBadRequest, Message: "Invalid end date format. Use YYYY-MM-DD"}
				return c.JSON(http.StatusBadRequest, errorResponse)
			}

			if startDateStr != "" && endDateStr != "" {
				endDate = endDate.AddDate(0, 0, 1)
				startDate = endDate.AddDate(0, -6, 0)
			}
		}

		var totalUserCount int64
		if err := db.Model(&model.User{}).Where("created_at BETWEEN ? AND ?", startDate, endDate).Count(&totalUserCount).Error; err != nil {
			errorResponse := helper.ErrorResponse{Code: http.StatusInternalServerError, Message: "Failed to fetch total user count"}
			return c.JSON(http.StatusInternalServerError, errorResponse)
		}

		var totalWisataCount int64
		if err := db.Model(&model.Wisata{}).Where("created_at BETWEEN ? AND ?", startDate, endDate).Count(&totalWisataCount).Error; err != nil {
			errorResponse := helper.ErrorResponse{Code: http.StatusInternalServerError, Message: "Failed to fetch total wisata count"}
			return c.JSON(http.StatusInternalServerError, errorResponse)
		}

		var totalVisitors int
		if err := db.Model(&model.Ticket{}).Where("paid_status = ? AND created_at BETWEEN ? AND ?", true, startDate, endDate).Select("COALESCE(SUM(quantity), 0) as total_visitors").Scan(&totalVisitors).Error; err != nil {
			errorResponse := helper.ErrorResponse{Code: http.StatusInternalServerError, Message: "Failed to calculate total visitors"}
			return c.JSON(http.StatusInternalServerError, errorResponse)
		}

		var totalTicketPurchaseCount int64
		if err := db.Model(&model.Ticket{}).Where("created_at BETWEEN ? AND ?", startDate, endDate).Count(&totalTicketPurchaseCount).Error; err != nil {
			errorResponse := helper.ErrorResponse{Code: http.StatusInternalServerError, Message: "Failed to fetch total ticket purchase count"}
			return c.JSON(http.StatusInternalServerError, errorResponse)
		}

		var totalIncome int
		query := db.Model(&model.Ticket{}).
			Select("COALESCE(SUM(total_cost), 0) as total_income").
			Where("paid_status = ?", true).
			Where("created_at BETWEEN ? AND ?", startDate, endDate)

		if err := query.Scan(&totalIncome).Error; err != nil {
			errorResponse := helper.ErrorResponse{Code: http.StatusInternalServerError, Message: "Failed to fetch total income"}
			return c.JSON(http.StatusInternalServerError, errorResponse)
		}

		startMonth := endDate.AddDate(0, -5, 0)
		currentDate := time.Now()
		monthlyIncome := make([]map[string]interface{}, 0)
		var totalSixMonthsIncome int

		for currentMonth := startMonth; !currentMonth.After(currentDate.AddDate(0, 1, 0)); currentMonth = currentMonth.AddDate(0, 1, 0) {
			startOfMonth := time.Date(currentMonth.Year(), currentMonth.Month(), 1, 0, 0, 0, 0, time.UTC)
			endOfMonth := startOfMonth.AddDate(0, 1, 0).Add(-time.Second)

			if endOfMonth.After(endDate) {
				endOfMonth = endDate
			}

			if (startDateStr != "" && endOfMonth.Before(startDate)) || (endDateStr != "" && startOfMonth.After(endDate)) {
				continue
			}

			var monthlyTotalIncome int
			monthlyQuery := db.Model(&model.Ticket{}).
				Select("COALESCE(SUM(total_cost), 0) as total_income").
				Where("paid_status = ?", true).
				Where("created_at BETWEEN ? AND ?", startOfMonth, endOfMonth)

			if err := monthlyQuery.Scan(&monthlyTotalIncome).Error; err != nil {
				errorResponse := helper.ErrorResponse{Code: http.StatusInternalServerError, Message: "Failed to fetch monthly income"}
				return c.JSON(http.StatusInternalServerError, errorResponse)
			}

			monthlyIncome = append(monthlyIncome, map[string]interface{}{
				"month":  startOfMonth.Format("January"),
				"income": monthlyTotalIncome,
			})
			totalSixMonthsIncome += monthlyTotalIncome
		}

		return c.JSON(http.StatusOK, map[string]interface{}{
			"code":                     http.StatusOK,
			"error":                    false,
			"totalUserCount":           totalUserCount,
			"totalWisataCount":         totalWisataCount,
			"totalVisitors":            totalVisitors,
			"totalTicketPurchaseCount": totalTicketPurchaseCount,
			"totalIncomeForTimeRange":  totalIncome,
			"timeRangeStart":           startDate.Format("2006-01-02"),
			"timeRangeEnd":             endDate.Format("2006-01-02"),
			"monthlyIncome":            monthlyIncome,
		})
	}
}
