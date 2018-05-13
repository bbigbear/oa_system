package controllers

import (
	"encoding/json"
	"fmt"
	"oa_system/models"
	"time"
	//"time"

	_ "github.com/Go-SQL-Driver/MySQL"
	"github.com/alecthomas/log4go"
	"github.com/astaxie/beego/orm"
)

type TrainController struct {
	BaseController
}

func (this *TrainController) Get() {

	this.TplName = "train_plan.tpl"
}

func (this *TrainController) AddTrainPlan() {
	this.TplName = "add_train_plan.tpl"
}

func (this *TrainController) AddTrainPlanAction() {

	fmt.Println("新建培训计划")
	o := orm.NewOrm()
	list := make(map[string]interface{})
	var train models.Train
	json.Unmarshal(this.Ctx.Input.RequestBody, &train)

	var t models.TimeInfo
	json.Unmarshal(this.Ctx.Input.RequestBody, &t)

	fmt.Println("train_info:", &train)
	fmt.Println("time_info:", &t)

	train.Status = "待审批"
	//时间转换
	starttime, err := time.Parse("2006-01-02 15:04:05", t.TrainStartTime)
	if err != nil {
		fmt.Println("starttime err!")
	}
	endtime, err := time.Parse("2006-01-02 15:04:05", t.TrainEndTime)
	if err != nil {
		fmt.Println("endtime err!")
	}
	train.TrainStartTime = starttime
	train.TrainEndTime = endtime
	//插入数据库
	num, err := o.Insert(&train)
	if err != nil {
		log4go.Stdout("新增培训计划失败")
		this.ajaxMsg("新增失败", MSG_ERR_Resources)
	}
	fmt.Println("自增Id(num)", num)
	list["id"] = num
	this.ajaxList("新增成功", MSG_OK, 1, list)
	//this.ajaxMsg("新增成功", MSG_OK)
	return
}

func (this *TrainController) GetTrainPlanData() {
	fmt.Println("获取培训计划信息")
	o := orm.NewOrm()
	var maps []orm.Params
	train := new(models.Train)
	query := o.QueryTable(train)
	filters := make([]interface{}, 0)
	//获取number
	number := this.Input().Get("number")
	if number != "" {
		filters = append(filters, "Number", number)
	}
	fmt.Println("get number:", number)

	//获取post
	post := this.Input().Get("post")
	if post != "" {
		filters = append(filters, "Post", post)
	}
	fmt.Println("get post:", post)
	//获取people
	people := this.Input().Get("people")
	if people != "" {
		filters = append(filters, "People", people)
	}
	fmt.Println("get people:", people)
	//获取department
	department := this.Input().Get("department")
	if department != "" {
		filters = append(filters, "Department", department)
	}
	fmt.Println("department:", department)

	//获取时间
	day := this.Input().Get("day")
	if day != "" {
		filters = append(filters, "Day", day)
	}
	fmt.Println("day:", day)

	if len(filters) > 0 {
		l := len(filters)
		for k := 0; k < l; k += 2 {
			query = query.Filter(filters[k].(string), filters[k+1])
		}
	}
	//查询数据库
	num, err := query.Values(&maps)
	if err != nil {
		log4go.Stdout("获培训计划信息失败", err.Error())
		this.ajaxMsg("获取培训计划信息失败", MSG_ERR_Resources)
	}
	fmt.Println("get trainplan reslut num:", num)
	this.ajaxList("获取培训计划信息成功", 0, num, maps)
	return
}

func (this *TrainController) EditTrainPlan() {

	o := orm.NewOrm()
	var maps []orm.Params
	train := new(models.Train)

	id := this.Input().Get("id")
	fmt.Println("id:", id)

	num, err := o.QueryTable(train).Filter("Id", id).Values(&maps)
	if err != nil {
		log4go.Stdout("编辑培训计划失败", err.Error())
		this.ajaxMsg("编辑失败", MSG_ERR_Resources)
	}
	fmt.Println("edit rq reslut num:", num)
	for _, m := range maps {
		m["TrainStartTime"] = m["TrainStartTime"].(time.Time).Format("2006-01-02 15:04:05")
		m["TrainEndTime"] = m["TrainEndTime"].(time.Time).Format("2006-01-02 15:04:05")
	}
	this.Data["m"] = maps
	fmt.Println("maps", maps)
	this.TplName = "edit_train_plan.tpl"
}

func (this *TrainController) EditTrainPlanAction() {
	fmt.Println("更新培训计划")
	o := orm.NewOrm()
	//list := make(map[string]interface{})
	var train models.Train
	json.Unmarshal(this.Ctx.Input.RequestBody, &train)
	fmt.Println("train_info:", &train)
	//插入数据库
	num, err := o.Update(&train)
	if err != nil {
		log4go.Stdout("更新培训计划失败")
		this.ajaxMsg("更新失败", MSG_ERR_Resources)
	}
	fmt.Println("自增Id(num)", num)
	if num == 0 {
		log4go.Stdout("更新培训计划失败")
		this.ajaxMsg("更新失败", MSG_ERR_Param)
	}
	//list["id"] = num
	//this.ajaxList("更新成功", MSG_OK, 1, list)
	this.ajaxMsg("更新成功", MSG_OK)
	return
}

func (this *TrainController) DelTrainPlan() {
	fmt.Println("点击删除培训计划按钮")
	//获取id
	id, err := this.GetInt("id")
	if err != nil {
		log4go.Stdout("删除培训计划id失败", err.Error())
		this.ajaxMsg("删除培训计划id失败", MSG_ERR_Param)
	}
	fmt.Println("删除培训计划id:", id)
	o := orm.NewOrm()
	train := new(models.RecruitRequire)
	num, err := o.QueryTable(train).Filter("Id", id).Delete()
	if err != nil {
		log4go.Stdout("删除培训计划失败", err.Error())
		this.ajaxMsg("删除培训计划失败", MSG_ERR_Resources)
	}
	fmt.Println("del train reslut num:", num)
	//list["data"] = maps
	this.ajaxMsg("删除培训计划成功", MSG_OK)
	return
}

func (this *TrainController) GetTrainApproval() {

	this.TplName = "train_approval.tpl"
}
