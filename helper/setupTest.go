package helper

import (
	"fmt"
	"myproject/model"

	"github.com/labstack/echo/v4"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
)

func InitDBTest(dbName string) (*gorm.DB, error) {

	const DB_USER_TEST = "root"
	const DB_PASS_TEST = ""
	const DB_HOST_TEST = "127.0.0.1"
	const DB_PORT_TEST = "3306"

	connectionString := fmt.Sprintf("%s:%s@tcp(%s:%s)/%s?charset=utf8mb4&parseTime=True&loc=Local",
		DB_USER_TEST,
		DB_PASS_TEST,
		DB_HOST_TEST,
		DB_PORT_TEST,
		dbName,
	)
	var err error
	DB, err := gorm.Open(mysql.Open(connectionString), &gorm.Config{})
	if err != nil {
		return nil, err
	}

	return DB, nil

}

func InsertUserForTest(db *gorm.DB) error {

	users := []model.User{
		{ID: 1900, Name: "Bryan", Email: "abc", PhoneNumber: "123", Username: "abc"},
		{ID: 1901, Name: "Rizqi", Email: "bcd", PhoneNumber: "234", Username: "bcd"},
		{ID: 1902, Name: "Yha", Email: "cde", PhoneNumber: "345", Username: "cde"},
		{ID: 1903, Name: "Okh", Email: "def", PhoneNumber: "456", Username: "def"},
		{ID: 1904, Name: "Seep", Email: "efg", PhoneNumber: "567", Username: "efg"},
	}

	err := db.Create(users).Error
	if err != nil {
		return err
	}

	return nil

}

func DeleteUserForTest(db *gorm.DB) error {

	users := []model.User{{ID: 1900}, {ID: 1901}, {ID: 1902}, {ID: 1903}, {ID: 1904}}

	err := db.Delete(users).Error
	if err != nil {
		return err
	}

	return nil

}

func InitEchoTestAPI() *echo.Echo {

	e := echo.New()

	return e

}
