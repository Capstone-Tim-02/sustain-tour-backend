package routes

import (
	"github.com/labstack/echo/v4"
	"gorm.io/gorm"
	"io/ioutil"
	"log"
	"myproject/controllers"
	"net/http"
	"os"
)

func ServeHTML(c echo.Context) error {
	htmlData, err := ioutil.ReadFile("index.html")
	if err != nil {
		return err
	}
	return c.HTML(http.StatusOK, string(htmlData))
}

func SetupRoutes(e *echo.Echo, db *gorm.DB) {
	e.Use(Logger())
	secretKey := []byte(getSecretKeyFromEnv())
	// Menggunakan routes yang telah dipisahkan
	e.GET("/", ServeHTML)
	e.POST("/signup", controllers.Signup(db, secretKey))
	e.GET("/verify", controllers.VerifyEmail(db))
	e.POST("/signin", controllers.Signin(db, secretKey))
	e.POST("/admin/signin", controllers.AdminSignin(db, secretKey))
	e.GET("/profile", controllers.GetProfile(db, secretKey))
	e.PUT("/user/change-password", controllers.ChangePassword(db, secretKey))
	e.POST("/wisata/create", controllers.CreateWisata(db, secretKey))
	e.GET("/wisata", controllers.GetWisatas(db, secretKey))
	e.GET("/wisata/:id", controllers.GetWisataByID(db, secretKey))
	e.PUT("/user/:id", controllers.EditUser(db, secretKey))
	e.PUT("/admin/user/:id", controllers.EditUserByAdmin(db, secretKey))
	e.DELETE("/admin/user/:id", controllers.DeleteUserByAdmin(db, secretKey))
	e.DELETE("/admin/:id", controllers.DeleteAdminByAdmin(db, secretKey))
	e.GET("/admin/user", controllers.GetAllUsersByAdmin(db, secretKey))
	e.GET("/admin", controllers.GetAllAdminsByAdmin(db, secretKey))
	e.GET("/carbonfootprint/:user_id", controllers.GetTotalCarbonFootprintByUser(db, secretKey))
	e.POST("/user/buy", controllers.BuyTicket(db, secretKey))
	e.GET("/carbonfootprintwisata/:wisata_id", controllers.GetTotalCarbonFootprintByWisataID(db, secretKey))
	e.GET("/user/wisata", controllers.GetTicketsByUser(db, secretKey))
	e.GET("/user/wisata/:invoice_number", controllers.GetTransactionHistoryByInvoiceNumber(db, secretKey))
	e.GET("/user/notification", controllers.GetUserNotifications(db, secretKey))
	e.POST("/createpromo", controllers.CreatePromo(db, secretKey))
	e.POST("/createcategory", controllers.CreateCategoryByAdmin(db, secretKey))
	e.GET("/user/promo", controllers.GetPromos(db, secretKey))
	e.GET("/user/preferences", controllers.GetWisataByCategoryKesukaan(db, secretKey))
	e.GET("/admin/ticket/:invoiceNumber", controllers.GetTicketByInvoiceNumber(db, secretKey))
	e.GET("/dashboard", controllers.GetAdminDashboardData(db, secretKey))
	e.PUT("/admin/ticket/:invoiceId", controllers.UpdatePaidStatus(db, secretKey))
	e.PUT("/admin/updatewisata/:id", controllers.UpdateWisata(db, secretKey))
	e.PUT("/userlocation/:id", controllers.EditUserLocation(db, secretKey))
	e.GET("/user/points", controllers.GetUserPoints(db, secretKey))
	e.POST("/cekharga", controllers.CheckTicketPrice(db, secretKey))
	e.GET("/user/:user_id", controllers.GetUserDataByID(db, secretKey))
	e.GET("/user/points/history", controllers.GetPointsHistory(db, secretKey))
	e.PUT("/admin/wisata/:id", controllers.UpdateWisata(db, secretKey))
	e.GET("/admin/ticket", controllers.GetAllTicketsByAdmin(db, secretKey))

	e.DELETE("/admin/wisata/:id", controllers.DeleteWisata(db, secretKey))
	wisataUsecase := controllers.NewWisataUsecase() // Inisialisasi use case
	e.POST("/chatbot/recommend-wisata", func(c echo.Context) error {
		return controllers.RecommendWisata(c, wisataUsecase) // Panggil fungsi dengan use case
	})

	//delete profil photo
	e.DELETE("/user/photo/:id", controllers.DeleteUserProfilePhoto(db, secretKey))

	// term and condition routes
	e.GET("/tnc", controllers.GetAllTermCondition(db, secretKey))
	e.GET("/tnc/:id", controllers.GetTermConditionByID(db, secretKey))
	e.POST("/admin/tnc", controllers.CreateTermCondition(db, secretKey))
	e.PUT("/admin/tnc/:id", controllers.EditTermCondition(db, secretKey))
	e.DELETE("/admin/tnc/:id", controllers.DeleteTermCondition(db, secretKey))

	// edit cvoucher
	e.PUT("/admin/promo/:id", controllers.EditPromo(db, secretKey))

	//get cities
	e.GET("/cities", controllers.GetCities(db, secretKey))

	e.GET("/categories", controllers.GetCategories(db, secretKey))
	e.GET("/user/promo/:id", controllers.GetPromoByID(db, secretKey))

	// Update Category
	e.PUT("/admin/categories/:id", controllers.UpdateCategoryByAdmin(db, secretKey))

	// Delete Category By Id
	e.DELETE("/admin/categories/:id", controllers.DeleteCategoryByAdmin(db, secretKey))

	// Update user by admin
	e.PUT("/admin/user/:id", controllers.EditUserByAdmin(db, secretKey))

	// Delete Promo By Admin
	e.DELETE("/admin/promo/:id", controllers.DeletePromoByAdmin(db, secretKey))

	// Delete Ticket By Admin
	e.DELETE("/admin/ticket/:invoice_number", controllers.DeleteTicketByAdmin(db, secretKey))

	e.POST("/cooperation", controllers.CreateCooperationMessage(db))
	e.GET("/cooperation", controllers.GetCooperationMessagesByAdmin(db, secretKey))

	//signup with google account
	e.GET("/auth/google/initiate", controllers.GoogleAuthInitiate)
	e.GET("/auth/google/callback", controllers.GoogleAuthCallback(db, secretKey))

	// Get Top Wisata
	e.GET("/top/wisata", controllers.GetTopWisata(db, secretKey))
	e.GET("/top/emition", controllers.GetTopEmition(db, secretKey))

	//cancel ticket
	e.DELETE("/user/ticket/:invoice_number", controllers.CancelTicket(db, secretKey))

	promoChatbotUsecase := controllers.NewPromoChatbotUsecase() // Inisialisasi use case
	e.POST("/chatbot/recommend-promo", func(c echo.Context) error {
		return controllers.RecommendPromoChatbot(c, promoChatbotUsecase, db, secretKey) // Panggil fungsi dengan use case dan instance Gorm DB
	})

	e.PUT("/user/notification/:id", controllers.MarkNotificationAsRead(db, secretKey))
}

func getSecretKeyFromEnv() string {
	secretKey := os.Getenv("SECRET_KEY")
	if secretKey == "" {
		log.Fatal("SECRET_KEY tidak ditemukan di .env")
	}
	return secretKey
}
