<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>详情</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="apple-mobile-web-app-status-bar-style" content="black"> 
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="format-detection" content="telephone=no">
  <link rel="stylesheet" href="/static/css/layui.css">

<style>
body{padding: 10px;}

    #ui_notify_show_preveiw{
        background-color: #fff;
        padding: 8px 10px;
    }
    .ui-notify-tips-preview{
        display: inline-block;
        width: 30%;
    }
    .ui-notify-tips-preview div{
        width: 200px;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
        -o-text-overflow: ellipsis;
        margin-top:10px;
    }

</style>
</head>
<body>
{{range .maps}}
<table border="1" width="90%" align="center" >
	<tr>
        <td  width="100%" style="padding:0px">
            <table class="TableTop" width="100%" cellpadding="0" >
                <tr>
                    <td class="center"  width="100%"  style="font-size:20px;"><font color=''>[{{.Style}}]</font>{{.Title}}               
					</td>
                </tr>
            </table>
        </td>
    </tr>
	<tr>
        <td class="TableContent" align="left" id="ui_notify_show_preveiw">
            <span class="ui-notify-tips-preview">
                <!--公告类型-->
                <div>
                    公告类型: <span>{{.Style}}</span>
                </div>
                <!--发布人-->
                <div>
                    发布人: <span>{{.Auth}}</span>
                </div>
                <!--审核人-->
            </span>
            <span class="ui-notify-tips-preview" style="margin-left: 4%">
                <!--发布部门-->
                <div>
                    发布部门：<span>学校</span>
                </div>
                <!--发布时间-->
                <div>
                    发布时间：<span>{{.Day}}</span>
                </div>
                <!--审核时间-->
            </span>
            <span class="ui-notify-tips-preview" style="margin-left: 4%">
                <!--阅读量-->
                <div>
                    阅读量: <span>9</span>
                </div>
                <!--发布范围-->
                <div>
                    发布范围: <span title="{{.Range}}">{{.Range}}</span>
                </div>
            </span>
        </td>
    </tr>
	<br>
	<tr>
        <td colspan="2" valign="top"  class="rich-content content" style="height:300px;font-size:12pt;">
		{{.Detail}}
		</td>
    </tr>
	<tr>
        <td class="TableContent" align="left">
            &nbsp;&nbsp;<span title="{{.Auth}}">{{.Auth}}</span>&nbsp;
            最后编辑于：<span>{{.Day}}</span>
        </td>
    </tr>
</table>
{{end}}
<script src="/static/layui.js"></script>
<!-- <script src="../build/lay/dest/layui.all.js"></script> -->
<script>
layui.use(['form','laydate','upload','jquery','layedit','element'], function(){
  var form = layui.form
  ,laydate=layui.laydate
  ,upload = layui.upload
  , $ = layui.jquery
  ,layedit=layui.layedit
  ,element=layui.element;

	
});
</script>

</body>
</html>