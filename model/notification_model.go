package model

import "time"

type Notification struct {
	ID        uint       `gorm:"primaryKey" json:"id"`
	UserID    uint       `json:"user_id"`
	Message   string     `json:"message"`
	Status    string     `json:"status" gorm:"default:'unread'"`
	CreatedAt *time.Time `json:"created_at"`
}
