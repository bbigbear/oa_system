package controllers

type AdminOfficeController struct {
	BaseController
}

func (this *AdminOfficeController) Get() {

	this.TplName = "announcement_management.tpl"
}

func (this *AdminOfficeController) GetAnnouncement() {

	this.TplName = "announcement_management.tpl"
}

func (this *AdminOfficeController) GetNews() {

	this.TplName = "news_management.tpl"
}
