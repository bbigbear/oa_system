package models

import (
	"time"
)

type Announcement struct {
	Id        int64
	Auth      string
	Style     string
	Range     string
	Title     string
	Day       string
	TopStatus string
	TopDay    int
	Brief     string
	Detail    string
	KeyWord   string
	StartTime string
	EndTime   string
	Status    string
}

type News struct {
	Id        int64
	Auth      string
	Style     string
	Range     string
	Title     string
	Day       time.Time
	Brief     string
	Detail    string
	KeyWord   string
	StartTime time.Time
	EndTime   time.Time
	Status    string
}