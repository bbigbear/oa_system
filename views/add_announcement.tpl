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
  <div class="layui-inline">
    <div class="layui-input-inline" style="width: 150px;">
      <select name="style" id="style" lay-filter="style_select">
		    <option value="选择公告类型" > 选择公告类型</option>
			<option value="决定" > 决定</option>
			<option value="通知" > 通知</option>
			<option value="通报" > 通报</option>
			<option value="其他" > 其他</option>
      </select>
    </div>
  </div>
  <div class="layui-inline">
    <div class="layui-input-inline" style="width: 500px;">
      <input type="text" name="title" id="title" autocomplete="off" placeholder="请输入公告标题..." class="layui-input">
    </div>
  </div>
 </div>
  <div class="layui-form-item">
    <label class="layui-form-label">按部门发布</label>
    <div class="layui-input-block" style="width: 500px;">
	<input type="text" name="range" id="range" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">发布时间</label>
    <div class="layui-input-block" style="width: 500px;">
	<input type="text" name="date" id="day" autocomplete="off" class="layui-input">
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
 <!-- <div class="layui-form-item">
    <div class="layui-inline">
    <label class="layui-form-label">事务提醒</label>
      <div class="layui-input-block">
	      <input type="checkbox" name="like1[write]" lay-skin="primary" title="发送事务提醒信息" checked="">
	      <input type="checkbox" name="like1[read]" lay-skin="primary" title="分享到企业社区" checked="">
	  </div>
    </div>
  </div>-->
  <div class="layui-form-item">
    <div class="layui-inline">
    <label class="layui-form-label">置顶</label>
      <div class="layui-input-inline" style="width: 250px;">
	      <input type="checkbox" name="top" lay-skin="primary" title="使公告通知置顶，显示为重要" checked="">	      
	  </div>
	  <div class="layui-input-inline"  style="width: 50px;">
          <input type="text" name="topday" id="topday" autocomplete="off" class="layui-input" value="0">	  
      </div>
	  <div class="layui-form-mid layui-word-aux">天后结束置顶，0表示一直置顶</div>  
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">内容简介</label>
    <div class="layui-input-block" style="width: 500px;">
	<input type="text" name="brief" id="brief" autocomplete="off" placeholder="最多输入30个字" class="layui-input">
    </div>
  </div>
<!--  <div class="layui-form-item">
    <div class="layui-inline">
    <label class="layui-form-label">附件与权限</label>
      <div class="layui-input-inline">
		  <div style="margin-top:10px;">	    
	        <i class="layui-icon">&#xe61d;</i><a id="dish_del">添加附件</a>	
		  </div>     
	  </div>
    </div>
  </div>-->
  <div class="layui-form-item layui-form-text">
    <div class="layui-input-block">
      <textarea placeholder="请输入内容" class="layui-textarea" name="detail" id="detail"></textarea>
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">关键词</label>
    <div class="layui-input-inline" style="width: 300px;">
	  <input type="text" name="keyword" id="keyword" autocomplete="off" class="layui-input">
    </div>
	<div class="layui-form-mid layui-word-aux">(您可以调整关键词内容，多个关键词请用,分隔)</div>
  </div>
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" id="add">发布</button>
<!--	  <input type="hidden" id="pic_path">-->
      <button class="layui-btn layui-btn-primary" id="save">保存</button>
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
	    elem: '#day'
		,type: 'datetime'
	  });
	
	 laydate.render({
	    elem: '#date1'
	    ,type: 'date'
	  });
	
	 laydate.render({
	    elem: '#date2'
	    ,type: 'date'
	  });
	
	//文本域
	var index=layedit.build('detail',{
		hideTool:['image','face']
	});
		
 
   //发布
	$('#add').on('click',function(){
		var style=$("#style").val()
		var topStauts=$("input[name='top']:checked").val()
		var topday=$("#topday").val()
		if (topStauts=="on"){
			topStauts="on"
		}else{
			topStauts="off"
			topday=""
		}
		//alert($("input[name='top']:checked").val())
		//if($("input[name={{.Type}}]:checked").val()!=undefined){
		//	checkbox_src=checkbox_src+$("input[name={{.Type}}]:checked").val()+',';
		//}
		var data={
			'auth':"admin",
			'style':$("#style").val(),
			'range':$("#range").val(),
			'title':$("#title").val(),
			'day':$("#day").val(),
			'topStatus':topStauts,
			'topDay':topday,
			'brief':$("#brief").val(),
			'detail':layedit.getContent(index),
			'keyWord':$("#keyword").val(),
			'startTime':$("#date1").val(),
			'endTime':$("#date2").val(),
			'status':"生效"
			};
		console.log(data)
		if (style=="选择公告类型"){
			alert("请选择公告类型")
		}else{
			//发布
			$.ajax({
			type:"POST",
			contentType:"application/json;charset=utf-8",
			url:"/v1/office/announcement/add_action",
			data:JSON.stringify(data),
			async:false,
			error:function(request){
				alert("post error")						
			},
			success:function(res){
				if(res.code==200){
					alert("发布成功")
					window.location.reload();		
				}else{
					alert("发布失败")
				}						
			}
		  	});			
		}			
		return false;
	});
	//保存
	$('#save').on('click',function(){
		var style=$("#style").val()
		var topStauts=$("input[name='top']:checked").val()
		var topday=$("#topday").val()
		if (topStauts=="on"){
			topStauts="on"
		}else{
			topStauts="off"
			topday=""
		}
		//alert($("input[name='top']:checked").val())
		//if($("input[name={{.Type}}]:checked").val()!=undefined){
		//	checkbox_src=checkbox_src+$("input[name={{.Type}}]:checked").val()+',';
		//}
		var data={
			'auth':"admin",
			'style':$("#name").val(),
			'range':$("#range").val(),
			'title':$("#title").val(),
			'day':$("#day").val(),
			'topStatus':topStauts,
			'topDay':topday,
			'brief':$("#brief").val(),
			'detail':$("#detail").val(),
			'keyWord':$("#keyword").val(),
			'startTime':$("#date1").val(),
			'endTime':$("#date2").val(),
			'status':"草稿"
			};
		console.log(data)
		if (style=="选择公告类型"){
			alert("请选择公告类型")
		}else{
			//发布
			$.ajax({
			type:"POST",
			contentType:"application/json;charset=utf-8",
			url:"/v1/office/announcement/add_action",
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
		return false;
	});
});
</script>

</body>
</html>