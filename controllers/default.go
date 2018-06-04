package controllers

import (
	"fmt"
	"oa_system/models"

	_ "github.com/Go-SQL-Driver/MySQL"
	//"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
)

type MainController struct {
	BaseController
}

func (c *MainController) Get() {
	if c.GetSession("islogin") != 1 {
		fmt.Println("未登录")
		c.Redirect("/v1/login", 302)
	}
	fmt.Println("进入首页")
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

	var q_maps orm.ParamsList
	qm := new(models.QucikMenu)
	//查询数据库
	q_num, err := o.QueryTable(qm).ValuesFlat(&q_maps, "name")
	c.Data["quickmenu"] = q_maps
	if err != nil {
		fmt.Println("err!")
	}
	fmt.Println("get quickmenu num", q_num)

	c.TplName = "index.tpl"
}

func (c *MainController) GetMessageCenter() {
	if c.GetSession("islogin") != 1 {
		fmt.Println("未登录")
		c.Redirect("/v1/login", 302)
	}
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

func (c *MainController) GetQuickEnter() {
	if c.GetSession("islogin") != 1 {
		fmt.Println("未登录")
		c.Redirect("/v1/login", 302)
	}
	c.TplName = "select_quick_enter.tpl"
}

func (c *MainController) GetMessageDetail() {
	if c.GetSession("islogin") != 1 {
		fmt.Println("未登录")
		c.Redirect("/v1/login", 302)
	}

	//获取id
	id, err := c.GetInt("id")
	if err != nil {
		fmt.Println("get id err!")
	}
	typ := c.Input().Get("type")
	o := orm.NewOrm()
	var maps []orm.Params
	if typ == "announce" {
		announce := new(models.Announcement)
		query := o.QueryTable(announce).Filter("Id", id)
		//查询数据库
		num, err := query.Values(&maps)
		c.Data["maps"] = maps
		if err != nil {
			fmt.Println("err!")
		}
		fmt.Println("get announce num", num)
	} else if typ == "news" {
		news := new(models.News)
		news_num, err := o.QueryTable(news).Filter("Id", id).Values(&maps)
		if err != nil {
			fmt.Println("err!")
		}
		fmt.Println("get news num", news_num)
	}
	fmt.Println("maps:", maps)
	c.Data["maps"] = maps
	c.TplName = "message_detail.tpl"
}
