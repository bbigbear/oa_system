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
	Title             string
	CheckPeople       string
	CheckedPeople     string
	SeePeople         string
	ManageRangeStatus int
	CheckYourself     int
	CheckIndexs       string
	Anonymous         int
	StartTime         time.Time
	EndTime           time.Time
	Warn              int
	Info              string
	Status            string
}
