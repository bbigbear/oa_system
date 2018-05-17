package models

import (
	"time"
)

type Leave struct {
	Id            int64
	Name          string
	Reason        string
	ApplyTime     time.Time
	StartTime     time.Time
	StopTime      time.Time
	Day           int
	Hour          int
	Style         string
	ApprovePeople string
	Status        string
	ApplyStyle    string
}

type LeaveTime struct {
	StartTime string
	StopTime  string
}
