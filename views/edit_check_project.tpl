<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>新增公告通知</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="apple-mobile-web-app-status-bar-style" content="black"> 
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="format-detection" content="telephone=no">
  <link rel="stylesheet" href="/static/css/layui.css">

<style>
body{padding: 10px;}
</style>
</head>
<body>
<form class="layui-form layui-form-pane1" action="">
	  <div class="layui-form-item">
	    <label class="layui-form-label">考核指标集名称</label>
	    <div class="layui-input-block" style="width: 500px;">
		<input type="text" name="name" id="name" autocomplete="off" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">考核指标集合描述</label>
	    <div class="layui-input-block" style="width: 500px;">
		<input type="text" name="detail" id="detail" autocomplete="off" class="layui-input">
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">设置考核指标集模块</label>
	    <div class="layui-input-inline" style="width: 150px;">
	      <select name="module" id="module" lay-filter="style_select">
			    <option value="请选择" > 请选择</option>
				<option value="个人工作日志" > 个人工作日志</option>
				<option value="个人日常安排" > 个人日常安排</option>
	      </select>
	    </div>
	  </div>		  
	  <div class="layui-form-item">
	    <label class="layui-form-label">按部门设置</label>
	    <div class="layui-input-block">
	      <textarea class="layui-textarea" name="department" id="department"></textarea>
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">按人员设置</label>
	    <div class="layui-input-block">
	      <textarea class="layui-textarea" name="people" id="people"></textarea>
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">按角色设置</label>
	    <div class="layui-input-block">
	      <textarea class="layui-textarea" name="role" id="role"></textarea>
	    </div>
	  </div>
	  <div class="layui-form-item" style="text-algin:center;">
	    <label class="layui-form-label" style="width:auto;">考核指标集使用范围取部门、人员和角色的并集</label>
	  </div>
	  <div class="layui-form-item">
	    <div class="layui-input-block">
	      <button class="layui-btn layui-btn-primary" id="add">新建</button>
	    </div>
	  </div>
</form>

<br><br><br>


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

	//自动加载
	var id
	$(function(){
		//获取
		//console.log({{.m}})	
		{{range .m}}
			id={{.Id}}
			$("#name").val({{.Name}})			
			$("#detail").val({{.Detail}})	
			$("#module").val({{.Module}})
			$("#department").val({{.Department}})
			$("#people").val({{.People}})
			$("#role").val({{.Role}})
		{{end}}		
		
	});
	
	 laydate.render({
	    elem: '#date1'
	    ,type: 'date'
	  });
	
	
		   
		
	//数据上传
	function uploadData(){
		var module=$("#module").val()
		var data={
			'id':id,
			'name':$("#name").val(),
			'detail':$("#detail").val(),
			'module':module,
			'department':$("#department").val(),
			'people':$("#people").val(),
			'role':$("#role").val()
			};
			console.log(data)
			if(module=="请选择"){
				alert("请选择考核指标集模块")
			}else{
				//发布
				$.ajax({
					type:"POST",
					contentType:"application/json;charset=utf-8",
					url:"/v1/perform/checkset/edit_action",
					data:JSON.stringify(data),
					async:false,
					error:function(request){ 
						alert("post error")						
					},
					success:function(res){
						if(res.code==200){
							alert("保存成功")
							window.location.reload();		
						}else{
							alert("保存失败")
						}						
					}
			  	});	
			}			
	}
	
	//保存
	$('#save').on('click',function(){
		
		uploadData()		
		return false;
	});
});
</script>

</body>
</html>