package controllers

import (
	"fmt"
	"oa_system/models"

	"strings"

	_ "github.com/Go-SQL-Driver/MySQL"
	"github.com/astaxie/beego/orm"
)

type QuickController struct {
	BaseController
}

func (this *QuickController) GetQuickEnter() {
	if this.GetSession("islogin") != 1 {
		fmt.Println("未登录")
		this.Redirect("/v1/login", 302)
	}
	o := orm.NewOrm()
	var maps orm.ParamsList
	menu := new(models.Menu)
	query := o.QueryTable(menu)
	//查询数据库
	num, err := query.ValuesFlat(&maps, "name")
	//this.Data["menu"] = maps
	if err != nil {
		fmt.Println("err!")
	}
	fmt.Println("get menu num", num)

	var q_maps orm.ParamsList
	qm := new(models.QucikMenu)
	//查询数据库
	q_num, err := o.QueryTable(qm).ValuesFlat(&q_maps, "name")
	this.Data["quickmenu"] = q_maps
	if err != nil {
		fmt.Println("err!")
	}
	fmt.Println("get quickmenu num", q_num)

	menu_len := len(maps)
	qm_len := len(q_maps)
	var n_maps orm.ParamsList
	for i := 0; i < menu_len; i++ {
		flag := true
		for j := 0; j < qm_len; j++ {
			if maps[i] == q_maps[j] {
				flag = false
				break
			}
		}
		if flag {
			n_maps = append(n_maps, maps[i])
		}
	}
	this.Data["menu"] = n_maps

	this.TplName = "select_quick_enter.tpl"
}

func (this *QuickController) AddQuickMenu() {

	fmt.Println("新建快捷菜单")
	o := orm.NewOrm()
	name := this.Input().Get("name")
	fmt.Println("name:", name)
	//查询库
	var namelist orm.ParamsList
	quickmenu := new(models.QucikMenu)
	name_num, err := o.QueryTable(quickmenu).ValuesFlat(&namelist, "name")
	if err != nil {
		fmt.Println("err!")
	}
	fmt.Println("name_num", name_num)
	fmt.Println("name_list", namelist)
	namelen := len(namelist)

	nlist := strings.Split(name, ",")
	nlen := len(nlist) - 1

	//直接插入数据库
	for i := 0; i < nlen; i++ {
		var qm models.QucikMenu
		flag := true
		if namelen == 0 {
			qm.Name = nlist[i]
			_, err := o.Insert(&qm)
			if err != nil {
				fmt.Println("insert quickmenu err!")
			}
		} else {
			for j := 0; j < namelen; j++ {
				if nlist[i] == namelist[j] {
					flag = false
					break
				}
			}
			if flag {
				//插入
				qm.Name = nlist[i]
				_, err := o.Insert(&qm)
				if err != nil {
					fmt.Println("insert quickmenu err!")
				}
			}
		}
	}
	//删除
	for i := 0; i < namelen; i++ {
		qm := new(models.QucikMenu)
		flag := true
		for j := 0; j < nlen; j++ {
			if namelist[i] == nlist[j] {
				flag = false
				break
			}
		}
		if flag {
			//删除
			num, err := o.QueryTable(qm).Filter("Name", namelist[i]).Delete()
			if err != nil {
				fmt.Println("del quickMenu err!")
			}
			fmt.Println("del num", num)
		}
	}

	//this.ajaxList("新增成功", MSG_OK, 1, list)
	this.ajaxMsg("新增成功", MSG_OK)
	return
}
