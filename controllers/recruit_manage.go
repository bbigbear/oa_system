package controllers

import (
	"encoding/json"
	"fmt"
	"oa_system/models"
	//"time"

	_ "github.com/Go-SQL-Driver/MySQL"
	"github.com/alecthomas/log4go"
	"github.com/astaxie/beego/orm"
)

type RecruitManageController struct {
	BaseController
}

func (this *RecruitManageController) Get() {

	this.TplName = "recruit_require.tpl"
}

func (this *RecruitManageController) AddRecruitRequire() {
	this.TplName = "add_recruit_require.tpl"
}

func (this *RecruitManageController) AddRecruitRequireAction() {

	fmt.Println("新建招聘需求")
	o := orm.NewOrm()
	list := make(map[string]interface{})
	var rq models.RecruitRequire
	json.Unmarshal(this.Ctx.Input.RequestBody, &rq)
	fmt.Println("rq_info:", &rq)
	rq.Status = "待审批"
	//插入数据库
	num, err := o.Insert(&rq)
	if err != nil {
		log4go.Stdout("新增招聘需求失败")
		this.ajaxMsg("新增失败", MSG_ERR_Resources)
	}
	fmt.Println("自增Id(num)", num)
	list["id"] = num
	this.ajaxList("新增成功", MSG_OK, 1, list)
	//this.ajaxMsg("新增成功", MSG_OK)
	return
}

func (this *RecruitManageController) GetRecruitRequireData() {
	fmt.Println("获取招聘需求信息")
	o := orm.NewOrm()
	var maps []orm.Params
	rq := new(models.RecruitRequire)
	query := o.QueryTable(rq)
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
		log4go.Stdout("获取招聘需求信息失败", err.Error())
		this.ajaxMsg("获取招聘需求信息失败", MSG_ERR_Resources)
	}
	fmt.Println("get recruitrequire reslut num:", num)
	this.ajaxList("获取招聘需求信息成功", 0, num, maps)
	return
}

func (this *RecruitManageController) EditRecruitRequire() {

	o := orm.NewOrm()
	var maps []orm.Params
	rq := new(models.RecruitRequire)

	id := this.Input().Get("id")
	fmt.Println("id:", id)

	num, err := o.QueryTable(rq).Filter("Id", id).Values(&maps)
	if err != nil {
		log4go.Stdout("编辑招聘需求失败", err.Error())
		this.ajaxMsg("编辑失败", MSG_ERR_Resources)
	}
	fmt.Println("edit rq reslut num:", num)
	this.Data["m"] = maps
	fmt.Println("maps", maps)
	this.TplName = "edit_recruit_require.tpl"
}

func (this *RecruitManageController) EditRecruitRequireAction() {
	fmt.Println("编辑招聘需求通知")
	o := orm.NewOrm()
	//list := make(map[string]interface{})
	var rq models.RecruitRequire
	json.Unmarshal(this.Ctx.Input.RequestBody, &rq)
	fmt.Println("rq_info:", &rq)
	//插入数据库
	num, err := o.Update(&rq)
	if err != nil {
		log4go.Stdout("更新招聘需求失败")
		this.ajaxMsg("更新失败", MSG_ERR_Resources)
	}
	fmt.Println("自增Id(num)", num)
	if num == 0 {
		log4go.Stdout("更新招聘需求失败")
		this.ajaxMsg("更新失败", MSG_ERR_Param)
	}
	//list["id"] = num
	//this.ajaxList("更新成功", MSG_OK, 1, list)
	this.ajaxMsg("更新成功", MSG_OK)
	return
}

func (this *RecruitManageController) DelRecruitRequire() {
	fmt.Println("点击删除招聘需求按钮")
	//获取id
	id, err := this.GetInt("id")
	if err != nil {
		log4go.Stdout("删除招聘需求id失败", err.Error())
		this.ajaxMsg("删除招聘需求id失败", MSG_ERR_Param)
	}
	fmt.Println("删除招聘需求id:", id)
	o := orm.NewOrm()
	rq := new(models.RecruitRequire)
	num, err := o.QueryTable(rq).Filter("Id", id).Delete()
	if err != nil {
		log4go.Stdout("删除招聘需求失败", err.Error())
		this.ajaxMsg("删除招聘需求失败", MSG_ERR_Resources)
	}
	fmt.Println("del news reslut num:", num)
	//list["data"] = maps
	this.ajaxMsg("删除招聘需求成功", MSG_OK)
	return
}

func (this *RecruitManageController) GetRecruitApproval() {

	this.TplName = "recruit_approval.tpl"
}
