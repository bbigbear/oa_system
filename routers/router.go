package routers

import (
	"oa_system/controllers"

	"github.com/astaxie/beego"
)

func init() {
	beego.Router("/", &controllers.MainController{})
	//get file
	beego.Router("/v1/put_file", &controllers.BaseController{}, "*:PutFile")
	beego.Router("/v1/message_center", &controllers.MainController{}, "*:GetMessageCenter")
	beego.Router("/v1/quick_enter", &controllers.QuickController{}, "*:GetQuickEnter")

	beego.Router("/v1/office/announcement", &controllers.AdminOfficeController{}, "*:GetAnnouncement")
	beego.Router("/v1/office/announcement/getdata", &controllers.AdminOfficeController{}, "*:GetAnnouncementData")
	beego.Router("/v1/office/announcement/add", &controllers.AdminOfficeController{}, "*:AddAnnouncement")
	beego.Router("/v1/office/announcement/add_action", &controllers.AdminOfficeController{}, "post:AddAnnouncementAction")
	beego.Router("/v1/office/announcement/edit", &controllers.AdminOfficeController{}, "*:EditAnnouncement")
	beego.Router("/v1/office/announcement/edit_action", &controllers.AdminOfficeController{}, "post:EditAnnouncementAction")
	beego.Router("/v1/office/announcement/del", &controllers.AdminOfficeController{}, "post:DelAnnouncement")
	beego.Router("/v1/office/announcement/changestatus", &controllers.AdminOfficeController{}, "post:ChangeAnnouncementStatus")

	beego.Router("/v1/office/news", &controllers.AdminOfficeController{}, "*:GetNews")
	beego.Router("/v1/office/news/getdata", &controllers.AdminOfficeController{}, "*:GetNewsData")
	beego.Router("/v1/office/news/add", &controllers.AdminOfficeController{}, "*:AddNews")
	beego.Router("/v1/office/news/add_action", &controllers.AdminOfficeController{}, "post:AddNewsAction")
	beego.Router("/v1/office/news/edit", &controllers.AdminOfficeController{}, "*:EditNews")
	beego.Router("/v1/office/news/edit_action", &controllers.AdminOfficeController{}, "post:EditNewsAction")
	beego.Router("/v1/office/news/del", &controllers.AdminOfficeController{}, "post:DelNews")
	beego.Router("/v1/office/news/changestatus", &controllers.AdminOfficeController{}, "post:ChangeNewsStatus")

	beego.Router("/v1/recruit/require", &controllers.RecruitManageController{})
	beego.Router("/v1/recruit/require/add", &controllers.RecruitManageController{}, "*:AddRecruitRequire")
	beego.Router("/v1/recruit/require/add_action", &controllers.RecruitManageController{}, "post:AddRecruitRequireAction")
	beego.Router("/v1/recruit/require/getdata", &controllers.RecruitManageController{}, "*:GetRecruitRequireData")
	beego.Router("/v1/recruit/require/edit", &controllers.RecruitManageController{}, "*:EditRecruitRequire")
	beego.Router("/v1/recruit/require/edit_action", &controllers.RecruitManageController{}, "post:EditRecruitRequireAction")
	beego.Router("/v1/recruit/require/del", &controllers.RecruitManageController{}, "post:DelRecruitRequire")

	beego.Router("/v1/recruit/approval", &controllers.RecruitManageController{}, "*:GetRecruitApproval")
	beego.Router("/v1/quick_enter/add", &controllers.QuickController{}, "post:AddQuickMenu")

	beego.Router("/v1/desk", &controllers.DeskController{}, "*:GetDesktop")
	beego.Router("/v1/desk/add", &controllers.DeskController{}, "post:AddDesktop")
	beego.Router("/v1/desk/del", &controllers.DeskController{}, "*:RemoveDesktop")

	beego.Router("/v1/message_detail", &controllers.MainController{}, "*:GetMessageDetail")

}
