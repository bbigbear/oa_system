<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>计划审批</title>
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
    <label class="layui-form-label">需求编号</label>
    <div class="layui-input-inline" style="width: 100px;">
      <input type="text" id="number" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-inline">
    <label class="layui-form-label">需求岗位</label>
    <div class="layui-input-inline" style="width: 100px;">
      <input type="text" id="name" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-inline">
    <label class="layui-form-label">需求人数</label>
    <div class="layui-input-inline" style="width: 100px;">
      <input type="text" id="name" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-inline">
    <label class="layui-form-label">需求部门</label>
    <div class="layui-input-inline" style="width: 100px;">
      <input type="text" id="name" autocomplete="off" class="layui-input">
    </div>
  </div>
  
  <div class="layui-inline">
    <button class="layui-btn" id="query">查询</button>
  </div>
  <div>

  <div class="layui-form-item">
    <!--<div class="layui-inline">
    <label class="layui-form-label">发布状态</label>
    <div class="layui-input-inline" style="width: 100px;">
      <select name="status" id="status" lay-filter="status_select">
		    <option value="全部" > 全部</option>
			<option value="通知" > 通知</option>
			<option value="通报" > 通报</option>
			<option value="其他" > 其他</option>
			<option value="无类型" > 无类型</option>
      </select>
    </div>
   </div>-->
   <div class="layui-inline">
    <label class="layui-form-label">用工时间</label>
    <div class="layui-input-inline" style="width: 120px;">
      <input type="text" name="date" id="date" autocomplete="off" class="layui-input">
    </div>
	<div class="layui-input-inline" style="width: 120px;">
      <input type="text" name="date" id="date1" autocomplete="off" class="layui-input">
    </div>
  </div>
<!--   <div class="layui-inline">
    <button class="layui-btn" id="add">新建计划</button>
   </div>-->
  </div>
</form>

<br><br>

	<table id="list" lay-filter="rq"></table>
	<script type="text/html" id="barDemo">
		{{#  if((d.Status =="待审批")||(d.Status=="不批准")){ }}
			 <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="yes">批准</a>
		{{#  }else{ }}
			<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="no">不批准</a>
		{{#  } }}
	</script>

<script src="/static/layui.js"></script>
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
	    ,url: '/v1/recruit/require/getdata'//数据接口
	    ,page: true //开启分页
		,id: 'listReload'
	    ,cols: [[ //表头
		  {type:'checkbox', fixed: 'left'}		  
	      ,{field:'Number', title:'计划编号', width:120}
		  ,{field:'Name',  title:'计划名称', width:120}
	      ,{field:'People',  title:'招聘人', width:120}
		  ,{field:'StartDay',  title:'开始日期', width:120}
		  ,{field:'Status',  title:'计划状态', width:120}
		  ,{fixed: 'right', title:'操作',width:200, align:'center', toolbar: '#barDemo'}
	    ]]
	  });
	//监听工具条
		table.on('tool(rq)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
		    var data = obj.data //获得当前行数据
		    ,layEvent = obj.event; //获得 lay-event 对应的值
		    if(layEvent === 'yes'){
		        var jsData={'id':data.Id,'status':"批准"}
				$.post('/v1/recruit/require/change', jsData, function (out) {
	                if (out.code == 200) {
	                    layer.alert('批准成功', {icon: 1},function(index){
	                        layer.close(index);
	                        //table.reload({});
							location.reload();	
	                    });
	                } else {
	                    layer.msg(out.message)
	                }
	            }, "json");
		        //向服务端发送删除指令			  
	    } else if(layEvent === 'no'){
	        var jsData={'id':data.Id,'status':"不批准"}
			$.post('/v1/recruit/require/change', jsData, function (out) {
                if (out.code == 200) {
                    layer.alert('不批准成功', {icon: 1},function(index){
                        layer.close(index);
                       // table.reload({});
						location.reload();	
                    });
                } else {
                    layer.msg(out.message)
                }
            }, "json");
	    }
	  });
  
	$('#add').on('click',function(){
		layer.open({
			  type: 2,
			  title: '新建计划信息',
			  //closeBtn: 0, //不显示关闭按钮
			  shadeClose: true,
			  shade: false,
			  area: ['893px', '600px'],
			 // offset: 'rb', //右下角弹出
			  //time: 2000, //2秒后自动关闭
			  maxmin: true,
			  anim: 2,
			  content: ['/v1/recruit/require/add'], //iframe的url，no代表不显示滚动条
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