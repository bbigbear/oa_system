<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>编辑考核任务</title>
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
    <label class="layui-form-label">考核任务标题</label>
    <div class="layui-input-block" style="width: 500px;">
	<input type="text" name="title" id="title" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">考核人</label>
    <div class="layui-input-block" style="width: 500px;">
	<input type="text" name="checkPeople" id="checkPeople" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">被考核人</label>
    <div class="layui-input-block" style="width: 500px;">
	<input type="text" name="checkedPeople" id="checkedPeople" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">考核任务查看者</label>
    <div class="layui-input-block" style="width: 500px;">
	<input type="text" name="seePeople" id="seePeople" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">按照管理范围</label>
    <div class="layui-input-block" style="width: 500px;">
		<input type="checkbox" name="mangeRangeStatus"  id="mangeRangeStatus"  title="按照管理范围" lay-skin="primary" >
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">自评</label>
    <div class="layui-input-block" style="width: 500px;">
		<input type="checkbox" name="checkYouself" id="checkYouself" title="先自评" lay-skin="primary" >
    </div>
  </div>
	<div class="layui-form-item"> 
		<label class="layui-form-label">考核指标集</label>
	    <div class="layui-input-inline" style="width: 150px;">
	      <select name="checkIndexs" id="checkIndexs" lay-filter="status_select">
				  <<<range .maps>>>
				  <option value="<<<.Project>>>" > <<<.Project>>></option>
				  <<<end>>>
<!--				  <option value="通知" > 通知</option>-->
	      </select>
	    </div>
	</div>
  <div class="layui-form-item">
    <label class="layui-form-label">匿名</label>
    <div class="layui-input-block" style="width: 500px;">
		<input type="checkbox" name="anonymous" id="anonymous" title="允许匿名" lay-skin="primary">
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-inline">
    <label class="layui-form-label">有效期</label>
    <div class="layui-input-inline" style="width: 120px;">
      <input type="text" name="date" id="date1" autocomplete="off" class="layui-input">
    </div>
	<div class="layui-input-inline" style="width: 120px;">
      <input type="text" name="date" id="date2" autocomplete="off" class="layui-input">
    </div>
  </div>
  </div>
	<div class="layui-form-item">
    <label class="layui-form-label">提醒</label>
    <div class="layui-input-block" style="width: 500px;">
		<input type="checkbox" name="warn" id="warn" title="发送事务提醒消息" lay-skin="primary">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">描述</label>
    <div class="layui-input-block">
      <textarea class="layui-textarea" name="info" id="info"></textarea>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" id="add">发布</button>
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


	//自动加载
	var id
	$(function(){
		//获取
		//console.log(<<<.m>>>)	
		<<<range .m>>>
			id=<<<.Id>>>
			$("#title").val(<<<.Title>>>)			
			$("#checkPeople").val(<<<.CheckPeople>>>)	
			$("#checkedPeople").val(<<<.CheckedPeople>>>)
			$("#seePeople").val(<<<.SeePeople>>>)
			$("#info").val(<<<.Info>>>)		
			$("#date1").val(<<<.StartTime>>>)			
			$("#date2").val(<<<.EndTime>>>)
		<<<end>>>		
		
	});

	 laydate.render({
	    elem: '#day'
		,type: 'datetime'
	  });
	
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
		var mangeRangeStatus
		var checkYouself
		var anonymous
		var warn
		var checkIndexs=$("#checkIndexs").val()
		if($('#mangeRangeStatus').is(':checked')) {
		    // do something
			mangeRangeStatus=1
		}else{
			mangeRangeStatus=0
		}
		if($('#checkYouself').is(':checked')) {
		    // do something
			checkYouself=1
		}else{
			checkYouself=0
		}
		if($('#anonymous').is(':checked')) {
		    // do something
			anonymous=1
		}else{
			anonymous=0
		}
		if($('#warn').is(':checked')) {
		    // do something
			warn=1
		}else{
			warn=0
		}
		var data={
			'title':$("#title").val(),
			'checkPeople':$("#checkPeople").val(),
			'checkIndexs':checkIndexs,
			'checkedPeople':$("#checkedPeople").val(),
			'seePeople':$("#seePeople").val(),
			'manageRangeStatus':parseInt(mangeRangeStatus),
			'checkYourself':parseInt(checkYouself),
			'anonymous':parseInt(anonymous),
			'warn':parseInt(warn),
			'info':$("#info").val(),
			'startTime':$("#date1").val(),
			'endTime':$("#date2").val()
			};
			console.log(data)
			if(checkIndexs=="请选择"){
				alert("请选择考核指标集")
			}else if($("#date1").val()==""||$("#date2").val()==""){
				alert("时间不能为空")
			}else{
				//发布
				$.ajax({
					type:"POST",
					contentType:"application/json;charset=utf-8",
					url:"/v1/perform/checkmanage/add_action",
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