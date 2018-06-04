package controllers

import (
	"encoding/json"
	"fmt"
	"oa_system/models"
	"time"

	_ "github.com/Go-SQL-Driver/MySQL"
	"github.com/alecthomas/log4go"
	"github.com/astaxie/beego/orm"
)

type PersonalThingsController struct {
	BaseController
}

func (this *PersonalThingsController) GetAttendance() {

	this.TplName = "attendance_manage.tpl"
}

func (this *PersonalThingsController) AddLeave() {

	this.TplName = "add_leave.tpl"
}

func (this *PersonalThingsController) AddLeaveAction() {

	fmt.Println("新建请假申请")
	o := orm.NewOrm()
	list := make(map[string]interface{})
	var leave models.Leave
	json.Unmarshal(this.Ctx.Input.RequestBody, &leave)
	fmt.Println("leave_info:", &leave)
	var t models.LeaveTime
	json.Unmarshal(this.Ctx.Input.RequestBody, &t)
	fmt.Println("t_info:", &t)
	//时间转换
	starttime, err := time.Parse("2006-01-02 15:04:05", t.StartTime)
	if err != nil {
		fmt.Println("starttime err!")
	}
	stoptime, err := time.Parse("2006-01-02 15:04:05", t.StopTime)
	if err != nil {
		fmt.Println("endtime err!")
	}
	//time
	nowtime, err := time.Parse("2006-01-02 15:04:05", time.Now().Format("2006-01-02 15:04:05"))
	if err != nil {
		fmt.Println("新建失败")
	}
	leave.ApplyStyle = "请假申请"
	leave.ApplyTime = nowtime
	leave.StartTime = starttime
	leave.StopTime = stoptime
	//审批中 通过  不通过
	leave.Status = "审批中"
	//插入数据库
	num, err := o.Insert(&leave)
	if err != nil {
		log4go.Stdout("新增请假失败")
		this.ajaxMsg("新增失败", MSG_ERR_Resources)
	}
	fmt.Println("自增Id(num)", num)
	list["id"] = num
	this.ajaxList("新增成功", MSG_OK, 1, list)
	//this.ajaxMsg("新增成功", MSG_OK)
	return
}

func (this *PersonalThingsController) GetLeaveData() {
	fmt.Println("获取请假信息")
	o := orm.NewOrm()
	var maps []orm.Params
	leave := new(models.Leave)
	query := o.QueryTable(leave)
	//	filters := make([]interface{}, 0)
	//查询数据库
	num, err := query.Values(&maps)
	if err != nil {
		log4go.Stdout("获取请假信息失败", err.Error())
		this.ajaxMsg("获取请假失败", MSG_ERR_Resources)
	}
	for _, m := range maps {
		m["StartTime"] = m["StartTime"].(time.Time).Format("2006-01-02 15:04:05")
		m["StopTime"] = m["StopTime"].(time.Time).Format("2006-01-02 15:04:05")
		m["ApplyTime"] = m["ApplyTime"].(time.Time).Format("2006-01-02 15:04:05")
	}
	fmt.Println("get checkprojectset reslut num:", num)
	this.ajaxList("获取请假信息成功", 0, num, maps)
	return
}

//func (this *PersonalThingsController) ChangeLeaveStauts() {
//	fmt.Println("点击销假")
//	//获取id
//	id, err := this.GetInt("id")
//	if err != nil {
//		log4go.Stdout("请假id失败", err.Error())
//		this.ajaxMsg("请假id失败", MSG_ERR_Param)
//	}
//	fmt.Println("请假id:", id)
//	o := orm.NewOrm()
//	var leave models.Leave
//	leave.Id = int64(id)
//	leave.ApplyStyle = "申请销假"
//	num, err := o.Update(&leave, "ApplyStyle")
//	if err != nil {
//		log4go.Stdout("修改状态失败", err.Error())
//		this.ajaxMsg("修改状态失败", MSG_ERR_Resources)
//	}
//	fmt.Println("del news reslut num:", num)
//	//list["data"] = maps
//	this.ajaxMsg("修改状态成功", MSG_OK)
//	return
//}

func (this *PersonalThingsController) GetAttendanceApprove() {
	if this.GetSession("islogin") != 1 {
		fmt.Println("未登录")
		this.Redirect("/v1/login", 302)
	}
	this.TplName = "attendance_approve.tpl"
}

func (this *PersonalThingsController) ChangeLeaveStauts() {
	fmt.Println("点击销假")
	//获取id
	id, err := this.GetInt("id")
	if err != nil {
		log4go.Stdout("请假id失败", err.Error())
		this.ajaxMsg("请假id失败", MSG_ERR_Param)
	}
	fmt.Println("请假id:", id)
	//获取state 1 员工销假 2 管理员通过 3 驳回
	state, err := this.GetInt("state")
	if err != nil {
		log4go.Stdout("state失败", err.Error())
		this.ajaxMsg("state失败", MSG_ERR_Param)
	}
	fmt.Println("请假state:", state)

	o := orm.NewOrm()
	var leave models.Leave
	leave.Id = int64(id)
	if state == 1 {
		leave.ApplyStyle = "申请销假"
		num, err := o.Update(&leave, "ApplyStyle")
		if err != nil {
			log4go.Stdout("修改状态失败", err.Error())
			this.ajaxMsg("修改状态失败", MSG_ERR_Resources)
		}
		fmt.Println("del news reslut num:", num)
	} else if state == 2 {
		leave.Status = "通过"
		num, err := o.Update(&leave, "Status")
		if err != nil {
			log4go.Stdout("修改状态失败", err.Error())
			this.ajaxMsg("修改状态失败", MSG_ERR_Resources)
		}
		fmt.Println("del news reslut num:", num)
	} else if state == 3 {
		leave.Status = "不通过"
		num, err := o.Update(&leave, "Status")
		if err != nil {
			log4go.Stdout("修改状态失败", err.Error())
			this.ajaxMsg("修改状态失败", MSG_ERR_Resources)
		}
		fmt.Println("del news reslut num:", num)
	}

	//list["data"] = maps
	this.ajaxMsg("修改状态成功", MSG_OK)
	return
}
