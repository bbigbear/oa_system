package main

import (
	"fmt"
	"oa_system/models"
	_ "oa_system/routers"

	_ "github.com/Go-SQL-Driver/MySQL"
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
)

func init() {
	DBConnection()
	RegisterModel()
}

func main() {
	orm.Debug = true
	orm.RunSyncdb("default", false, true)
	beego.SetStaticPath("/static", "static")
	beego.Run()
}

func DBConnection() {
	fmt.Println("初始化数据库")
	orm.RegisterDriver("mysql", orm.DRMySQL)
	orm.RegisterDataBase("default", "mysql", "root:qwe!23@/oa_system?charset=utf8")
}

func RegisterModel() {
	fmt.Println("注册数据库模型")
	orm.RegisterModel(new(models.Announcement), new(models.News), new(models.RecruitRequire), new(models.Desk), new(models.Menu), new(models.QucikMenu), new(models.Train), new(models.CheckProjectSet), new(models.CheckProjectDetail))

}
