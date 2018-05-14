package models

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
