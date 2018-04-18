package models

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
	Id      int64
	Auth    string
	Style   string
	Range   string
	Title   string
	Day     string
	Brief   string
	Detail  string
	KeyWord string
	Status  string
}
