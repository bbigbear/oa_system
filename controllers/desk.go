package controllers

import (
	"fmt"
	"oa_system/models"

	//"strings"
	"encoding/json"

	_ "github.com/Go-SQL-Driver/MySQL"
	"github.com/astaxie/beego/orm"
)

type DeskController struct {
	BaseController
}

func (this *DeskController) GetDesktop() {
	if this.GetSession("islogin") != 1 {
		fmt.Println("未登录")
		this.Redirect("/v1/login", 302)
	}

	o := orm.NewOrm()
	var maps []orm.Params
	menu := new(models.Menu)
	query := o.QueryTable(menu)
	//查询数据库
	num, err := query.Values(&maps)
	this.Data["menu"] = maps
	if err != nil {
		fmt.Println("err!")
	}
	fmt.Println("get menu num", num)

	var desk_maps []orm.Params
	desk := new(models.Desk)
	//查询数据库
	desk_num, err := o.QueryTable(desk).Values(&desk_maps)
	this.Data["desk"] = desk_maps
	if err != nil {
		fmt.Println("err!")
	}
	fmt.Println("get desk num", desk_num)

	var unset []map[string]interface{}

	for _, m := range maps {
		flag := true
		//out := make(map[string]interface{})
		for _, m1 := range desk_maps {
			if m1["Name"].(string) == m["Name"].(string) {
				flag = false
				break
			}
		}
		if flag {
			unset = append(unset, m)
		}

	}
	//fmt.Println(unset)
	this.Data["unset"] = unset

	this.TplName = "personal_desktop.tpl"
}

func (this *DeskController) AddDesktop() {
	fmt.Println("添加桌面应用")
	o := orm.NewOrm()
	list := make(map[string]interface{})
	var desk models.Desk
	json.Unmarshal(this.Ctx.Input.RequestBody, &desk)
	fmt.Println("desk_info:", &desk)
	//插入数据库
	num, err := o.Insert(&desk)
	if err != nil {
		this.ajaxMsg("添加桌面应用失败", MSG_ERR_Resources)
	}
	fmt.Println("自增Id(num)", num)
	list["id"] = num
	this.ajaxList("添加桌面应用成功", MSG_OK, 1, list)
	//this.ajaxMsg("添加桌面应用成功", MSG_OK)
	return
}

func (this *DeskController) RemoveDesktop() {
	fmt.Println("移除桌面应用")
	//获取id
	id, err := this.GetInt("id")
	if err != nil {
		this.ajaxMsg("删除桌面应用失败", MSG_ERR_Param)
	}
	fmt.Println("删除桌面id:", id)
	o := orm.NewOrm()
	desk := new(models.Desk)
	num, err := o.QueryTable(desk).Filter("Id", id).Delete()
	if err != nil {
		this.ajaxMsg("删除桌面应用失败", MSG_ERR_Resources)
	}
	fmt.Println("del desk reslut num:", num)
	//list["data"] = maps
	this.ajaxMsg("删除桌面应用成功", MSG_OK)
	return
}
