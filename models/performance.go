package models

import (
	"time"
)

type CheckProjectSet struct {
	Id         int64
	Name       string
	Detail     string
	Module     string
	Department string
	People     string
	Role       string
}

type CheckProjectDetail struct {
	Id      int64
	Cid     int64
	Project string
	Range1  int
	Range2  int
	Info    string
}

type CheckTask struct {
	Id                int64
	Title             string `json:"title"`
	CheckPeople       string `json:"checkPeople"`
	CheckedPeople     string `json:"checkedPeople"`
	SeePeople         string `json:"seePeople"`
	ManageRangeStatus int    `json:"manageRangeStatus"`
	CheckYourself     int    `json:"checkYourself"`
	CheckIndexs       string `json:"checkIndexs"`
	Anonymous         int    `json:"anonymous"`
	StartTime         time.Time
	EndTime           time.Time
	Warn              int    `json:"warn"`
	Info              string `json:"info"`
	Status            string `json:"status"`
}

type TaskTime struct {
	StartTime string
	EndTime   string
}
