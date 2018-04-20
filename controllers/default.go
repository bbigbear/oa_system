package controllers

import (
	"fmt"
	"oa_system/models"

	_ "github.com/Go-SQL-Driver/MySQL"
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
)

type MainController struct {
	beego.Controller
}

func (c *MainController) Get() {
	o := orm.NewOrm()
	var maps []orm.Params
	desk := new(models.Desk)
	query := o.QueryTable(desk)
	//查询数据库
	num, err := query.Values(&maps)
	c.Data["maps"] = maps
	if err != nil {
		fmt.Println("err!")
	}
	fmt.Println("get desk num", num)
	c.TplName = "index.tpl"
}

func (c *MainController) GetDesktop() {

	c.TplName = "personal_desktop.tpl"
}

func (c *MainController) GetMessageCenter() {
	o := orm.NewOrm()
	var maps []orm.Params
	announce := new(models.Announcement)
	query := o.QueryTable(announce)
	//查询数据库
	num, err := query.Values(&maps)
	c.Data["maps"] = maps
	if err != nil {
		fmt.Println("err!")
	}
	fmt.Println("get announce num", num)
	//news
	var news_maps []orm.Params
	news := new(models.News)
	news_num, err := o.QueryTable(news).Values(&news_maps)
	if err != nil {
		fmt.Println("err!")
	}
	fmt.Println("get news num", news_num)
	c.Data["news_maps"] = news_maps
	c.TplName = "message_center.tpl"
}
