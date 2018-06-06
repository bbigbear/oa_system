<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>个人考勤</title>
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
<div class="layui-tab layui-tab-card">
  <ul class="layui-tab-title">
    <li class="layui-this">请假登记</li>
    <li>加班登记</li>
  </ul>
  <div class="layui-tab-content" style="height:auto;">	
    <div class="layui-tab-item layui-show">
		<div style="text-align:center;">
			<button class="layui-btn layui-btn-primary" id="qingjia">请假登记</button>	 			
		</div>
		<table id="list_qj" lay-filter="qj"></table>
		<script type="text/html" id="barDemo1">
		    {{#  if(d.Status =="审批中" ){ }}
			    <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit">销假</a>
			{{#  } }} 
			
		</script>
	</div>
    <div class="layui-tab-item">
		<div style="text-align:center;">
			<button class="layui-btn layui-btn-primary" id="jiabang">加班登记</button>	 			
		</div>
		<table id="list" lay-filter="rq"></table>
		<script type="text/html" id="barDemo">		    
			<a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit">查看</a>		
		</script>
	</div>
</div>


<script src="/static/layui.js"></script>
<script src="/static/js/jquery.cookie.js"></script>
<!-- <script src="../build/lay/dest/layui.all.js"></script> -->

<script>
layui.use(['form','laydate','upload','jquery','layedit','element','table','laytpl'], function(){
  var form = layui.form
  ,laydate=layui.laydate
  ,upload = layui.upload
  , $ = layui.jquery
  ,layedit=layui.layedit
  ,element=layui.element
  ,table=layui.table
  ,laytpl = layui.laytpl;

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
	    elem: '#list_qj'
	    ,height: 315
	    ,url: '/v1/personal/leave/getdata'//数据接口
	    //,page: true //开启分页
		,id: 'listReload'
	    ,cols: [[ //表头
		  //{type:'checkbox', fixed: 'left'}		  
	      {field:'Name', title:'请假人', width:80}
		  ,{field:'Reason',  title:'请假原因', width:200}
		  ,{field:'Style',  title:'请假类型', width:100}
		  ,{field:'ApplyTime',  title:'申请时间', width:180}
		  ,{field:'ApprovePeople',  title:'审批人', width:100}
		  ,{field:'StartTime',  title:'开始时间', width:180}
		  ,{field:'StopTime',  title:'结束时间', width:180}
		  ,{field:'Status',  title:'状态', width:100}
		  ,{fixed: 'right', title:'操作',width:100, align:'center', toolbar: '#barDemo1'}
	    ]]
	  });
	//监听工具条
		table.on('tool(qj)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
		    var data = obj.data //获得当前行数据
		    ,layEvent = obj.event; //获得 lay-event 对应的值
		    if(layEvent === 'edit'){
				layer.confirm('真的销假？', function(index){
		        var jsData={'id':data.Id,'state':parseInt(1)}
				$.post('/v1/personal/leave/change', jsData, function (out) {
	                if (out.code == 200) {
	                    layer.alert('销假成功了', {icon: 1},function(index){
	                        layer.close(index);
	                        table.reload({});
	                    });
	                } else {
	                    layer.msg(out.message)
	                }
	            }, "json");
		        layer.close(index);
		      });
			} 
	  });
  
	$('#qingjia').on('click',function(){
		layer.open({
			  type: 2,
			  title: '请假登记',
			  //closeBtn: 0, //不显示关闭按钮
			  shadeClose: true,
			  shade: false,
			  area: ['893px', '600px'],
			 // offset: 'rb', //右下角弹出
			  //time: 2000, //2秒后自动关闭
			  maxmin: true,
			  anim: 2,
			  content: ['/v1/personal/leave/add'], //iframe的url，no代表不显示滚动条			  
		});
	});	
});
</script>

</body>
</html>