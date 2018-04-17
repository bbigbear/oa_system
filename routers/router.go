package routers

import (
	"oa_system/controllers"

	"github.com/astaxie/beego"
)

func init() {
	beego.Router("/", &controllers.MainController{})
	beego.Router("/v1/desk", &controllers.MainController{}, "*:GetDesktop")
	beego.Router("/v1/message_center", &controllers.MainController{}, "*:GetMessageCenter")
	beego.Router("/v1/office/announcement", &controllers.AdminOfficeController{}, "*:GetAnnouncement")
	beego.Router("/v1/office/announcement/getdata", &controllers.AdminOfficeController{}, "*:GetAnnouncementData")
	beego.Router("/v1/office/announcement/add", &controllers.AdminOfficeController{}, "*:AddAnnouncement")
	beego.Router("/v1/office/announcement/add_action", &controllers.AdminOfficeController{}, "post:AddAnnouncementAction")
	beego.Router("/v1/office/announcement/edit", &controllers.AdminOfficeController{}, "*:EditAnnouncement")
	beego.Router("/v1/office/announcement/edit_action", &controllers.AdminOfficeController{}, "post:EditAnnouncementAction")
	beego.Router("/v1/office/announcement/del", &controllers.AdminOfficeController{}, "post:DelAnnouncement")
	beego.Router("/v1/office/announcement/changestatus", &controllers.AdminOfficeController{}, "post:ChangeAnnouncementStatus")
	beego.Router("/v1/office/news", &controllers.AdminOfficeController{}, "*:GetNews")
	beego.Router("/v1/office/news/add", &controllers.AdminOfficeController{}, "*:AddNews")
}
