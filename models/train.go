package models

import (
	"time"
)

type Train struct {
	Id                int64
	Number            string `json:"number"`
	PlanName          string `json:"planName"`
	TrainChannel      string `json:"trainChannel"`
	TrainForm         string `json:"trainForm"`
	Department        string `json:"department"`
	Leader            string `json:"leader"`
	JoinNum           int    `json:"joinNum"`
	TrainPlace        string `json:"trainPlace"`
	TrainName         string `json:"trainName"`
	TrainContract     string `json:"trainContract"`
	TrainCname        string `json:"trainCname"`
	TrainTotalTime    int    `json:"trainTotalTime"`
	Budget            int    `json:"budget"`
	Approver          string `json:"approver"`
	JoinDepartment    string `json:"joinDepartment"`
	JoinPeople        string `json:"joinPeople"`
	TrainInfo         string `json:"trainInfo"`
	TrainContractInfo string `json:"trainContractInfo"`
	TrainRequire      string `json:"trainRequire"`
	TrainExplain      string `json:"trainExplain"`
	Remark            string `json:"remark"`
	FilePath          string `json:"filePath"`
	TrainDetail       string `json:"trainDetail"`
	Status            string
	TrainStartTime    time.Time
	TrainEndTime      time.Time
}

type TimeInfo struct {
	TrainStartTime string `json:"trainStartTime"`
	TrainEndTime   string `json:"trainEndTime"`
}
