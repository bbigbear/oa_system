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

type AdminOfficeController struct {
	BaseController
}

func (this *AdminOfficeController) Get() {

	this.TplName = "announcement_management.tpl"
}

func (this *AdminOfficeController) GetAnnouncement() {

	this.TplName = "announcement_management.tpl"
}

func (this *AdminOfficeController) GetNews() {

	this.TplName = "news_management.tpl"
}

func (this *AdminOfficeController) AddAnnouncement() {

	this.TplName = "add_announcement.tpl"
}

func (this *AdminOfficeController) AddNews() {

	this.TplName = "add_news.tpl"
}

func (this *AdminOfficeController) AddAnnouncementAction() {
	fmt.Println("新建公告通知")
	o := orm.NewOrm()
	list := make(map[string]interface{})
	var announce models.Announcement
	json.Unmarshal(this.Ctx.Input.RequestBody, &announce)
	fmt.Println("announce_info:", &announce)
	//插入数据库
	num, err := o.Insert(&announce)
	if err != nil {
		log4go.Stdout("新增公告通知失败")
		this.ajaxMsg("新增失败", MSG_ERR_Resources)
	}
	fmt.Println("自增Id(num)", num)
	list["id"] = num
	this.ajaxList("新增成功", MSG_OK, 1, list)
	//this.ajaxMsg("新增成功", MSG_OK)
	return
}
func (this *AdminOfficeController) EditAnnouncement() {

	o := orm.NewOrm()
	var maps []orm.Params
	announce := new(models.Announcement)

	id := this.Input().Get("id")
	fmt.Println("id:", id)

	num, err := o.QueryTable(announce).Filter("Id", id).Values(&maps)
	if err != nil {
		log4go.Stdout("编辑公告失败", err.Error())
		this.ajaxMsg("编辑失败", MSG_ERR_Resources)
	}
	fmt.Println("edit announce reslut num:", num)
	this.Data["m"] = maps
	fmt.Println("maps", maps)
	this.TplName = "edit_announcement.tpl"
}

func (this *AdminOfficeController) EditAnnouncementAction() {
	fmt.Println("编辑公告通知")
	o := orm.NewOrm()
	//list := make(map[string]interface{})
	var announce models.Announcement
	json.Unmarshal(this.Ctx.Input.RequestBody, &announce)
	fmt.Println("announce_info:", &announce)
	//插入数据库
	num, err := o.Update(&announce)
	if err != nil {
		log4go.Stdout("更新公告通知失败")
		this.ajaxMsg("更新失败", MSG_ERR_Resources)
	}
	fmt.Println("自增Id(num)", num)
	if num == 0 {
		log4go.Stdout("更新公告通知失败")
		this.ajaxMsg("更新失败", MSG_ERR_Param)
	}
	//list["id"] = num
	//this.ajaxList("更新成功", MSG_OK, 1, list)
	this.ajaxMsg("更新成功", MSG_OK)
	return
}

func (this *AdminOfficeController) GetAnnouncementData() {
	fmt.Println("获取公告通知信息")
	o := orm.NewOrm()
	var maps []orm.Params
	announce := new(models.Announcement)
	query := o.QueryTable(announce)
	filters := make([]interface{}, 0)
	//获取id
	id := this.Input().Get("id")
	if id != "" {
		filters = append(filters, "Id", id)
	}
	fmt.Println("get id:", id)

	//获取标题名称
	title := this.Input().Get("title")
	if title != "" {
		filters = append(filters, "Title", title)
	}
	fmt.Println("get title:", title)
	//获取发布状态
	status := this.Input().Get("status")
	if status != "" {
		filters = append(filters, "Status", status)
	}
	fmt.Println("get status:", status)
	//发布日期
	start_time := this.Input().Get("start_time")
	if start_time != "" {
		filters = append(filters, "StartTime", start_time)
	}
	fmt.Println("start_time:", start_time)

	end_time := this.Input().Get("end_time")
	if end_time != "" {
		filters = append(filters, "EndTime", end_time)
	}
	fmt.Println("end_time:", end_time)
	//类型
	style := this.Input().Get("style")
	if style != "" {
		filters = append(filters, "Style", style)
	}
	fmt.Println("get status:", status)

	if len(filters) > 0 {
		l := len(filters)
		for k := 0; k < l; k += 2 {
			query = query.Filter(filters[k].(string), filters[k+1])
		}
	}
	//查询数据库
	num, err := query.Values(&maps)
	if err != nil {
		log4go.Stdout("获取公告通知信息失败", err.Error())
		this.ajaxMsg("获取公告通知信息失败", MSG_ERR_Resources)
	}
	fmt.Println("get diningroom reslut num:", num)
	this.ajaxList("获取公告通知信息成功", 0, num, maps)
	return
}

func (this *AdminOfficeController) ChangeAnnouncementStatus() {
	fmt.Println("修改发布状态")
	//获取id
	id, _ := this.GetInt64("id")
	fmt.Println("get id:", id)

	//获取发布状态
	status := this.Input().Get("status")
	fmt.Println("get status:", status)
	o := orm.NewOrm()
	var announce models.Announcement
	//update status
	announce.Id = id
	announce.Status = status
	num, err := o.Update(&announce, "Status")
	if err != nil {
		log4go.Stdout("更新公告通知失败")
		this.ajaxMsg("更新失败", MSG_ERR_Resources)
	}
	if num == 0 {
		log4go.Stdout("更新公告通知失败")
		this.ajaxMsg("更新失败", MSG_ERR_Param)
	}
	fmt.Println("update(num)", num)
	//this.ajaxList("新增成功", MSG_OK, 1, list)
	this.ajaxMsg("修改成功", MSG_OK)
	return
}

func (this *AdminOfficeController) DelAnnouncement() {
	fmt.Println("点击删除公告通知按钮")
	//获取id
	id, err := this.GetInt("id")
	if err != nil {
		log4go.Stdout("删除公告通知id失败", err.Error())
		this.ajaxMsg("删除公告通知id失败", MSG_ERR_Param)
	}
	fmt.Println("删除公告通知id:", id)
	o := orm.NewOrm()
	announce := new(models.Announcement)
	num, err := o.QueryTable(announce).Filter("Id", id).Delete()
	if err != nil {
		log4go.Stdout("删除公告通知失败", err.Error())
		this.ajaxMsg("删除公告通知失败", MSG_ERR_Resources)
	}
	fmt.Println("del announce reslut num:", num)
	//list["data"] = maps
	this.ajaxMsg("删除公告通知成功", MSG_OK)
	return
}

func (this *AdminOfficeController) AddNewsAction() {

	fmt.Println("新建新闻通知")
	o := orm.NewOrm()
	list := make(map[string]interface{})
	var announce models.Announcement
	json.Unmarshal(this.Ctx.Input.RequestBody, &announce)
	fmt.Println("announce_info:", &announce)

	//插入数据库
	num, err := o.Insert(&announce)
	if err != nil {
		log4go.Stdout("新增公告通知失败")
		this.ajaxMsg("新增失败", MSG_ERR_Resources)
	}
	fmt.Println("自增Id(num)", num)
	list["id"] = num
	this.ajaxList("新增成功", MSG_OK, 1, list)
	//this.ajaxMsg("新增成功", MSG_OK)
	return
}
