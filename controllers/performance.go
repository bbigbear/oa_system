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

type PerformanceController struct {
	BaseController
}

func (this *PerformanceController) Get() {
	this.TplName = "check_project_setting.tpl"
}

func (this *PerformanceController) AddCheckProjectSet() {

	fmt.Println("新建考核项目")
	o := orm.NewOrm()
	list := make(map[string]interface{})
	var cp models.CheckProjectSet
	json.Unmarshal(this.Ctx.Input.RequestBody, &cp)
	fmt.Println("cp_info:", &cp)
	//	rq.Status = "待审批"
	//插入数据库
	num, err := o.Insert(&cp)
	if err != nil {
		log4go.Stdout("新增考核项目失败")
		this.ajaxMsg("新增失败", MSG_ERR_Resources)
	}
	fmt.Println("自增Id(num)", num)
	list["id"] = num
	this.ajaxList("新增成功", MSG_OK, 1, list)
	//this.ajaxMsg("新增成功", MSG_OK)
	return
}

func (this *PerformanceController) GetCheckProjectSetData() {
	fmt.Println("获取考核项目信息")
	o := orm.NewOrm()
	var maps []orm.Params
	cp := new(models.CheckProjectSet)
	query := o.QueryTable(cp)
	//	filters := make([]interface{}, 0)

	//查询数据库
	num, err := query.Values(&maps)
	if err != nil {
		log4go.Stdout("获取考核项目失败", err.Error())
		this.ajaxMsg("获取考核项目失败", MSG_ERR_Resources)
	}
	fmt.Println("get checkprojectset reslut num:", num)
	this.ajaxList("获取考核项目成功", 0, num, maps)
	return
}

func (this *PerformanceController) EditCheckProjectSet() {
	o := orm.NewOrm()
	var maps []orm.Params
	cp := new(models.CheckProjectSet)

	id := this.Input().Get("id")
	fmt.Println("id:", id)

	num, err := o.QueryTable(cp).Filter("Id", id).Values(&maps)
	if err != nil {
		log4go.Stdout("编辑考核项目失败", err.Error())
		this.ajaxMsg("编辑失败", MSG_ERR_Resources)
	}
	fmt.Println("edit cp reslut num:", num)
	this.Data["m"] = maps
	fmt.Println("maps", maps)
	this.TplName = "edit_check_project.tpl"
}

func (this *PerformanceController) EditCheckProjectSetAction() {
	fmt.Println("编辑考核项目通知")
	o := orm.NewOrm()
	//list := make(map[string]interface{})
	var cp models.CheckProjectSet
	json.Unmarshal(this.Ctx.Input.RequestBody, &cp)
	fmt.Println("cp_info:", &cp)
	//插入数据库
	num, err := o.Update(&cp)
	if err != nil {
		log4go.Stdout("更新考核项目失败")
		this.ajaxMsg("更新失败", MSG_ERR_Resources)
	}
	fmt.Println("自增Id(num)", num)
	if num == 0 {
		log4go.Stdout("更新考核项目失败")
		this.ajaxMsg("更新失败", MSG_ERR_Param)
	}
	//list["id"] = num
	//this.ajaxList("更新成功", MSG_OK, 1, list)
	this.ajaxMsg("更新成功", MSG_OK)
	return
}

func (this *PerformanceController) DelCheckProjectSet() {
	fmt.Println("点击删除考核项目按钮")
	//获取id
	id, err := this.GetInt("id")
	if err != nil {
		log4go.Stdout("删除考核项目id失败", err.Error())
		this.ajaxMsg("删除考核项目id失败", MSG_ERR_Param)
	}
	fmt.Println("删除考核项目id:", id)
	o := orm.NewOrm()
	cp := new(models.CheckProjectSet)
	num, err := o.QueryTable(cp).Filter("Id", id).Delete()
	if err != nil {
		log4go.Stdout("删除考核项目失败", err.Error())
		this.ajaxMsg("删除考核项目失败", MSG_ERR_Resources)
	}
	fmt.Println("del news reslut num:", num)
	//list["data"] = maps
	this.ajaxMsg("删除考核项目成功", MSG_OK)
	return
}

func (this *PerformanceController) CheckProjectDetail() {
	//获取id
	id, err := this.GetInt("id")
	if err != nil {
		fmt.Println("get cid err!")
	}
	fmt.Println("cid:", id)
	this.Data["cid"] = id

	o := orm.NewOrm()
	var maps []orm.Params
	detail := new(models.CheckProjectDetail)
	query := o.QueryTable(detail).Filter("Cid", id)
	//	filters := make([]interface{}, 0)

	//查询数据库
	num, err := query.Values(&maps)
	if err != nil {
		log4go.Stdout("获取失败", err.Error())
		this.ajaxMsg("获取失败", MSG_ERR_Resources)
	}
	fmt.Println("get checkprojectset reslut num:", num)
	this.Data["maps"] = maps

	this.TplName = "check_project_detail.tpl"
}

func (this *PerformanceController) AddCheckProjectDetail() {

	fmt.Println("新建考核集项目")
	o := orm.NewOrm()
	list := make(map[string]interface{})
	var detail models.CheckProjectDetail
	json.Unmarshal(this.Ctx.Input.RequestBody, &detail)
	fmt.Println("detail_info:", &detail)
	//	rq.Status = "待审批"
	//插入数据库
	num, err := o.Insert(&detail)
	if err != nil {
		log4go.Stdout("新增考核集失败")
		this.ajaxMsg("新增失败", MSG_ERR_Resources)
	}
	fmt.Println("自增Id(num)", num)
	list["id"] = num
	this.ajaxList("新增成功", MSG_OK, 1, list)
	//this.ajaxMsg("新增成功", MSG_OK)
	return
}

func (this *PerformanceController) DelCheckProjectDetail() {
	fmt.Println("点击删除按钮")
	//获取id
	id, err := this.GetInt("id")
	if err != nil {
		log4go.Stdout("删除考核项目id失败", err.Error())
		this.ajaxMsg("删除考核项目id失败", MSG_ERR_Param)
	}
	fmt.Println("删除考核项目id:", id)
	o := orm.NewOrm()
	detail := new(models.CheckProjectDetail)
	num, err := o.QueryTable(detail).Filter("Id", id).Delete()
	if err != nil {
		log4go.Stdout("删除考核项目失败", err.Error())
		this.ajaxMsg("删除考核项目失败", MSG_ERR_Resources)
	}
	fmt.Println("del news reslut num:", num)
	//list["data"] = maps
	this.ajaxMsg("删除考核项目成功", MSG_OK)
	return
}

func (this *PerformanceController) GetCheckTaskManage() {
	this.TplName = "check_task_manage.tpl"
}

func (this *PerformanceController) AddCheckTask() {
	o := orm.NewOrm()
	cp := new(models.CheckProjectDetail)
	var maps []orm.Params
	num, err := o.QueryTable(cp).Values(&maps)
	if err != nil {
		fmt.Println("err!", err)
	}
	fmt.Println("num", num, maps)
	this.Data["maps"] = maps

	this.TplName = "add_check_task.tpl"
}

func (this *PerformanceController) AddCheckTaskAction() {

	fmt.Println("新建考核任务")
	o := orm.NewOrm()
	list := make(map[string]interface{})
	var ct models.CheckTask
	json.Unmarshal(this.Ctx.Input.RequestBody, &ct)
	fmt.Println("ct_info:", &ct)
	var t models.TaskTime
	json.Unmarshal(this.Ctx.Input.RequestBody, &t)
	fmt.Println("ct_info:", &t)
	ct.Status = "生效"
	//时间转换
	starttime, err := time.Parse("2006-01-02 15:04:05", t.StartTime)
	if err != nil {
		fmt.Println("starttime err!")
	}
	endtime, err := time.Parse("2006-01-02 15:04:05", t.EndTime)
	if err != nil {
		fmt.Println("endtime err!")
	}
	ct.StartTime = starttime
	ct.EndTime = endtime
	//插入数据库
	num, err := o.Insert(&ct)
	if err != nil {
		log4go.Stdout("新增考核项目失败")
		this.ajaxMsg("新增失败", MSG_ERR_Resources)
	}
	fmt.Println("自增Id(num)", num)
	list["id"] = num
	this.ajaxList("新增成功", MSG_OK, 1, list)
	//this.ajaxMsg("新增成功", MSG_OK)
	return
}

func (this *PerformanceController) GetCheckTaskData() {
	fmt.Println("获取考核项目信息")
	o := orm.NewOrm()
	var maps []orm.Params
	ct := new(models.CheckTask)
	query := o.QueryTable(ct)
	//	filters := make([]interface{}, 0)
	//查询数据库
	num, err := query.Values(&maps)
	if err != nil {
		log4go.Stdout("获取考核项目失败", err.Error())
		this.ajaxMsg("获取考核项目失败", MSG_ERR_Resources)
	}
	for _, m := range maps {
		if m["Anonymous"].(int64) == 1 {
			m["Anonymous"] = "允许"
		} else {
			m["Anonymous"] = "不允许"
		}
		m["StartTime"] = m["StartTime"].(time.Time).Format("2006-01-02 15:04:05")
		m["EndTime"] = m["EndTime"].(time.Time).Format("2006-01-02 15:04:05")

	}
	fmt.Println("get checkprojectset reslut num:", num)
	this.ajaxList("获取考核项目成功", 0, num, maps)
	return
}

func (this *PerformanceController) EditCheckTask() {
	o := orm.NewOrm()
	var maps []orm.Params
	ct := new(models.CheckTask)

	id := this.Input().Get("id")
	fmt.Println("id:", id)

	num, err := o.QueryTable(ct).Filter("Id", id).Values(&maps)
	if err != nil {
		log4go.Stdout("编辑考核项目失败", err.Error())
		this.ajaxMsg("编辑失败", MSG_ERR_Resources)
	}
	fmt.Println("edit cp reslut num:", num)
	this.Data["m"] = maps
	fmt.Println("maps", maps)
	this.TplName = "edit_check_task.tpl"
}

func (this *PerformanceController) EditCheckTaskAction() {
	fmt.Println("编辑考核项目通知")
	o := orm.NewOrm()
	//list := make(map[string]interface{})
	var ct models.CheckTask
	json.Unmarshal(this.Ctx.Input.RequestBody, &ct)
	fmt.Println("cp_info:", &ct)
	//插入数据库
	num, err := o.Update(&ct)
	if err != nil {
		log4go.Stdout("更新考核项目失败")
		this.ajaxMsg("更新失败", MSG_ERR_Resources)
	}
	fmt.Println("自增Id(num)", num)
	if num == 0 {
		log4go.Stdout("更新考核项目失败")
		this.ajaxMsg("更新失败", MSG_ERR_Param)
	}
	//list["id"] = num
	//this.ajaxList("更新成功", MSG_OK, 1, list)
	this.ajaxMsg("更新成功", MSG_OK)
	return
}

func (this *PerformanceController) DelCheckTask() {
	fmt.Println("点击删除考核项目按钮")
	//获取id
	id, err := this.GetInt("id")
	if err != nil {
		log4go.Stdout("删除考核项目id失败", err.Error())
		this.ajaxMsg("删除考核项目id失败", MSG_ERR_Param)
	}
	fmt.Println("删除考核项目id:", id)
	o := orm.NewOrm()
	ct := new(models.CheckTask)
	num, err := o.QueryTable(ct).Filter("Id", id).Delete()
	if err != nil {
		log4go.Stdout("删除考核项目失败", err.Error())
		this.ajaxMsg("删除考核项目失败", MSG_ERR_Resources)
	}
	fmt.Println("del news reslut num:", num)
	//list["data"] = maps
	this.ajaxMsg("删除考核项目成功", MSG_OK)
	return
}

func (this *PerformanceController) ChangeCheckTaskStauts() {
	fmt.Println("点击删除考核项目按钮")
	//获取id
	id, err := this.GetInt("id")
	if err != nil {
		log4go.Stdout("考核项目id失败", err.Error())
		this.ajaxMsg("考核项目id失败", MSG_ERR_Param)
	}
	fmt.Println("考核项目id:", id)
	status := this.GetString("status")
	fmt.Println("status", status)
	o := orm.NewOrm()
	var ct_info models.CheckTask
	ct_info.Id = int64(id)
	ct_info.Status = status
	num, err := o.Update(&ct_info, "Status")
	if err != nil {
		log4go.Stdout("修改状态失败", err.Error())
		this.ajaxMsg("修改状态失败", MSG_ERR_Resources)
	}
	fmt.Println("del news reslut num:", num)
	//list["data"] = maps
	this.ajaxMsg("修改状态成功", MSG_OK)
	return
}
func (this *PerformanceController) CheckDetail() {
	//获取id
	fmt.Println("考核情况")
	id, err := this.GetInt("id")
	if err != nil {
		fmt.Println("get cid err!")
	}
	fmt.Println("cid:", id)
	this.Data["cid"] = id

	o := orm.NewOrm()
	var maps []orm.Params
	detail := new(models.CheckTask)
	query := o.QueryTable(detail).Filter("Id", id)
	//	filters := make([]interface{}, 0)

	//查询数据库
	num, err := query.Values(&maps, "CheckPeople", "CheckedPeople", "Id")
	if err != nil {
		log4go.Stdout("获取失败", err.Error())
		this.ajaxMsg("获取失败", MSG_ERR_Resources)
	}
	fmt.Println("get checkprojectset reslut num:", num)
	this.Data["maps"] = maps

	this.TplName = "check_result.tpl"
}

func (this *PerformanceController) GetCheckSelf() {
	this.TplName = "checkself.tpl"
}

func (this *PerformanceController) GetCheckSelfData() {
	fmt.Println("获取被考核人自评信息")
	o := orm.NewOrm()
	var maps []orm.Params
	ct := new(models.CheckTask)
	query := o.QueryTable(ct).Filter("CheckYourself", 1)
	//	filters := make([]interface{}, 0)
	//查询数据库
	num, err := query.Values(&maps, "Title", "CheckPeople", "Id")
	if err != nil {
		log4go.Stdout("获取被考核人自评失败", err.Error())
		this.ajaxMsg("获取被考核人自评失败", MSG_ERR_Resources)
	}
	fmt.Println("get checkprojectset reslut num:", num)
	this.ajaxList("获取考核项目成功", 0, num, maps)
	return
}

func (this *PerformanceController) GetCheckSelfDetail() {
	this.TplName = "checkself_detail.tpl"
}
