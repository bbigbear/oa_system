<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>请假登记</title>
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
    <label class="layui-form-label">员工编号</label>
    <div class="layui-input-block" style="width: 500px;">
	<input type="text" name="name" id="name" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">请假原因</label>
    <div class="layui-input-block">
      <textarea class="layui-textarea" name="reason" id="reason"></textarea>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-inline">  
	<div class="layui-input-inline" style="width:100px;">
		<label class="layui-form-label">开始时间</label>
	</div>
    <div class="layui-input-inline" >	  
      <input type="text" name="date" id="date1" autocomplete="off" class="layui-input">
    </div>
	<div class="layui-input-inline" style="width:100px;">
		<label class="layui-form-label">结束时间</label>
	</div>
	<div class="layui-input-inline">
      <input type="text" name="date" id="date2" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-inline"> 
	<label class="layui-form-label">请假时长</label>
    <div class="layui-input-inline" style="width: 200px;">	  
      <input type="text" name="day" id="day" autocomplete="off" class="layui-input">
    </div>
	<div class="layui-form-mid layui-word-aux">天</div>
	<div class="layui-input-inline" style="width: 200px;">
      <input type="text" name="hour" id="hour" autocomplete="off" class="layui-input">
    </div>
	<div class="layui-form-mid layui-word-aux">时</div>
  </div>
	<div class="layui-form-item"> 
		<label class="layui-form-label">请假类型</label>
	    <div class="layui-input-inline" style="width: 150px;">
	      <select name="style" id="style" lay-filter="status_select">
				<option value="事假" > 事假</option>
				<option value="公休" > 公休</option>
				<option value="病假" > 病假</option>
				<option value="其他" > 其他</option>
				<option value="调休" > 调休</option>
				<option value="年假" > 年假</option>
	      </select>
	    </div>
	</div>
	<div class="layui-form-item"> 
		<label class="layui-form-label">审批人员</label>
	    <div class="layui-input-inline" style="width: 150px;">
	      <select name="approvePeople" id="approvePeople" lay-filter="status_select">				
				<option value="系统管理员"> 系统管理员</option>
	      </select>
	    </div>
	</div>
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" id="add">申请</button>
<!--	  <input type="hidden" id="pic_path">-->
<!--	<button class="layui-btn layui-btn-primary" id="save">保存</button>-->
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

	
	 laydate.render({
	    elem: '#date1'
	    ,type: 'datetime'
	  });
	
	 laydate.render({
	    elem: '#date2'
	    ,type: 'datetime'
	  });
	
	//文本域
	var index=layedit.build('detail',{
		hideTool:['image','face']
	});
		
		
	//数据上传
	function uploadData(){		
		var data={
			'name':$("#name").val(),
			'reason':$("#reason").val(),
			'day':parseInt($("#day").val()),
			'hour':parseInt($("#hour").val()),
			'style':$("#style").val(),
			'approvePeople':$("#approvePeople").val(),
			'startTime':$("#date1").val(),
			'StopTime':$("#date2").val()
			};
			console.log(data)
		if($("#date1").val()==""||$("#date2").val()==""){
			alert("时间不能为空")
		}else{
		//发布
				$.ajax({
					type:"POST",
					contentType:"application/json;charset=utf-8",
					url:"/v1/personal/leave/add_action",
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
	$('#add').on('click',function(){
		//console.log($("#demoList tr").length)			
		//var len = $("#demoList tr").length
		//if (len==0){
		uploadData()
		//}
		return false;
		
	});
});
</script>

</body>
</html>