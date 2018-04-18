package controllers

//"encoding/json"
//"fmt"
//"oa_system/models"
//"time"

//_ "github.com/Go-SQL-Driver/MySQL"
//"github.com/alecthomas/log4go"
//"github.com/astaxie/beego/orm"

type RecruitManageController struct {
	BaseController
}

func (this *RecruitManageController) Get() {

	this.TplName = "recruit_require.tpl"
}

func (this *RecruitManageController) AddRecruitRequire() {

	this.TplName = "add_recruit_require.tpl"
}
