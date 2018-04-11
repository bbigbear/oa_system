package routers

import (
	"oa_system/controllers"

	"github.com/astaxie/beego"
)

func init() {
	beego.Router("/", &controllers.MainController{})
	beego.Router("/v1/desk", &controllers.MainController{}, "*:GetDesktop")
	beego.Router("/v1/office/announcement", &controllers.AdminOfficeController{}, "*:GetAnnouncement")
	beego.Router("/v1/office/news", &controllers.AdminOfficeController{}, "*:GetNews")
}
