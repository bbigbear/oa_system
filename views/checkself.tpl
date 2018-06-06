<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>被考核人自评</title>
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
    <label class="layui-form-label">状态</label>
    <div class="layui-input-inline" style="width: 100px;">
      <select name="status" id="status" lay-filter="status_select">
		    <option value="全部" > 全部</option>
			<option value="已自评" > 已自评</option>
			<option value="未自评" > 未自评</option>
      </select>
    </div>
  </div>
  <div class="layui-inline">
    <button class="layui-btn" id="query">查询</button>
  </div>
  <div>

</form>

<br><br>

	<table id="list" lay-filter="rq"></table>
	<script type="text/html" id="barDemo">
		<a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit">详细情况</a>			
	</script>

<script src="/static/layui.js"></script>
<script src="/static/js/jquery.cookie.js"></script>
<!-- <script src="../build/lay/dest/layui.all.js"></script> -->

<script>
layui.use(['form','laydate','upload','jquery','layedit','element','table'], function(){
  var form = layui.form
  ,laydate=layui.laydate
  ,upload = layui.upload
  , $ = layui.jquery
  ,layedit=layui.layedit
  ,element=layui.element
  ,table=layui.table;
	//自动加载
	$(function(){
		//获取缓存
		if($.cookie('userCookie')!=1){
			$(window).attr('location','/');
		}	
	});
	
	
	laydate.render({
	    elem: '#date'
	    ,type: 'date'
	  });
	
	 laydate.render({
	    elem: '#date1'
	    ,type: 'date'
	  });
	 //table 渲染
	  table.render({
	    elem: '#list'
	    ,height: 315
	    ,url: '/v1/perform/checkself/getdata'//数据接口
	    //,page: true //开启分页
		,id: 'listReload'
	    ,cols: [[ //表头
		  //{type:'checkbox', fixed: 'left'}	  
	      {field:'Title', title:'考核任务名称', width:120}
		  ,{field:'CheckPeople',  title:'考核人', width:120}
		  ,{field:'Status',  title:'考核状态', width:120}
		  ,{fixed: 'right', title:'操作',width:250, align:'center', toolbar: '#barDemo'}
	    ]]
	  });
	//监听工具条
		table.on('tool(rq)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
		    var data = obj.data //获得当前行数据
		    ,layEvent = obj.event; //获得 lay-event 对应的值
		    if(layEvent === 'edit'){
		      //layer.msg('查看操作');		
			  layer.open({
			  type: 2,
			  title: '查看详细情况',
			  //closeBtn: 0, //不显示关闭按钮
			  shadeClose: true,
			  shade: false,
			  area: ['893px', '600px'],
			 // offset: 'rb', //右下角弹出
			  //time: 2000, //2秒后自动关闭
			  maxmin: true,
			  anim: 2,
			  content: ['/v1/perform/checkself/detail?id='+data.Id], //iframe的url，no代表不显示滚动条			  
		});
	    }
	  });
  
	$('#add').on('click',function(){
		layer.open({
			  type: 2,
			  title: '新建考核任务',
			  //closeBtn: 0, //不显示关闭按钮
			  shadeClose: true,
			  shade: false,
			  area: ['893px', '600px'],
			 // offset: 'rb', //右下角弹出
			  //time: 2000, //2秒后自动关闭
			  maxmin: true,
			  anim: 2,
			  content: ['/v1/perform/checkmanage/add'], //iframe的url，no代表不显示滚动条
			  //cancel: function(index, layero){ 
			 // if(confirm('确定要关闭么')){ //只有当点击confirm框的确定时，该层才会关闭
			  //  layer.close(index)
			 // }
			   
			 // },
		});
		return false;
	});	
});
</script>

</body>
</html>