package routers

import (
	"oa_system/controllers"

	"github.com/astaxie/beego"
)

func init() {
	beego.Router("/", &controllers.MainController{})
	beego.Router("/v1/desk", &controllers.MainController{}, "*:GetDesktop")
	beego.Router("/v1/office/announcement", &controllers.AdminOfficeController{}, "*:GetAnnouncement")
	beego.Router("/v1/office/announcement/getdata", &controllers.AdminOfficeController{}, "*:GetAnnouncementData")
	beego.Router("/v1/office/announcement/add", &controllers.AdminOfficeController{}, "*:AddAnnouncement")
	beego.Router("/v1/office/announcement/add_action", &controllers.AdminOfficeController{}, "*:AddAnnouncementAction")
	beego.Router("/v1/office/announcement/changestatus", &controllers.AdminOfficeController{}, "*:ChangeAnnouncementStatus")
	beego.Router("/v1/office/news", &controllers.AdminOfficeController{}, "*:GetNews")
	beego.Router("/v1/office/news/add", &controllers.AdminOfficeController{}, "*:AddNews")
}
