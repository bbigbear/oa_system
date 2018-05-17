<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>考勤审批</title>
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
    <li class="layui-this">请假</li>
    <li>加班</li>
  </ul>
  <div class="layui-tab-content" style="height:auto;">	
    <div class="layui-tab-item layui-show">		
		<table id="list_qj" lay-filter="qj"></table>
		<script type="text/html" id="barDemo1">
			<a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="tongguo">通过</a>	
			<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="bohui">驳回</a>		
		</script>
	</div>
    <div class="layui-tab-item">		
		<table id="list" lay-filter="rq"></table>
		<script type="text/html" id="barDemo">
			<a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit">查看</a>		
		</script>
	</div>
</div>


<script src="/static/layui.js"></script>
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
	      {field:'ApplyStyle',  title:'类型', width:100}	  
	      ,{field:'Name', title:'请假人', width:80}
		  ,{field:'Reason',  title:'请假原因', width:200}		  
		  ,{field:'StartTime',  title:'开始时间', width:180}
		  ,{field:'StopTime',  title:'结束时间', width:180}
		  ,{field:'Day',  title:'天', width:80}
		  ,{field:'Hour',  title:'时', width:80}
		  ,{fixed: 'right', title:'操作',width:150, align:'center', toolbar: '#barDemo1'}
	    ]]
	  });
	//监听工具条
		table.on('tool(qj)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
		    var data = obj.data //获得当前行数据
		    ,layEvent = obj.event; //获得 lay-event 对应的值
		    if(layEvent === 'tongguo'){
				layer.confirm('真的通过？', function(index){
		        var jsData={'id':data.Id,'state':parseInt(2)}
				$.post('/v1/personal/leave/change', jsData, function (out) {
	                if (out.code == 200) {
	                    layer.alert('已通过', {icon: 1},function(index){
	                        layer.close(index);
	                        table.reload({});
	                    });
	                } else {
	                    layer.msg(out.message)
	                }
	            }, "json");
		        layer.close(index);
		      });
			}else if(layEvent === 'bohui'){
				layer.confirm('真的驳回？', function(index){
		        var jsData={'id':data.Id,'state':parseInt(3)}
				$.post('/v1/personal/leave/change', jsData, function (out) {
	                if (out.code == 200) {
	                    layer.alert('驳回成功了', {icon: 1},function(index){
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