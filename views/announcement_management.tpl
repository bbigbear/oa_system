<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>公告管理</title>
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
    <label class="layui-form-label">标题名称</label>
    <div class="layui-input-inline" style="width: 100px;">
      <input type="text" id="title" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-inline">
    <label class="layui-form-label">类型</label>
    <div class="layui-input-inline" style="width: 100px;">
      <select name="style" id="style" lay-filter="status_select">
		    <option value="全部" > 全部</option>
			<option value="生效" > 生效</option>
			<option value="终止" > 终止</option>
      </select>
    </div>
  </div>
  <div class="layui-inline">
    <label class="layui-form-label">发布日期</label>
    <div class="layui-input-inline" style="width: 120px;">
      <input type="text" name="date" id="date" autocomplete="off" class="layui-input">
    </div>
	<div class="layui-input-inline" style="width: 120px;">
      <input type="text" name="date" id="date1" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-inline">
    <button class="layui-btn" id="query">查询</button>
  </div>
  <div>

  <div class="layui-form-item">
    <div class="layui-inline">
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
   </div>
   <div class="layui-inline">
    <button class="layui-btn" id="add">新建公告</button>
   </div>
  </div>
</form>

<br><br>

	<table id="list" lay-filter="announcement"></table>
	<script type="text/html" id="barDemo">
		<a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit">详情</a>		
		<a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="stop">终止</a>
		<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
	</script>

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
	    elem: '#list'
	    ,height: 315
	    ,url: '/v1/office/announcement/getdata'//数据接口
	    ,page: true //开启分页
		,id: 'listReload'
	    ,cols: [[ //表头
		  {type:'checkbox', fixed: 'left'}		  
	      ,{field:'Auth', title:'发布人', width:120}
		  ,{field:'Style',  title:'类型', width:120}
	      ,{field:'Range',  title:'发布范围', width:120}
		  ,{field:'Title',  title:'标题', width:120}
		  ,{field:'Day',  title:'发布时间', width:120}
		  ,{field:'StartTime',  title:'生效时间', width:120}
		  ,{field:'EndTime',  title:'终止日期', width:120}
		  ,{field:'Status',  title:'发布状态', width:120}
		  ,{fixed: 'right', title:'操作',width:200, align:'center', toolbar: '#barDemo'}
	    ]]
	  });
	//监听工具条
		table.on('tool(announcement)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
		    var data = obj.data //获得当前行数据
		    ,layEvent = obj.event; //获得 lay-event 对应的值
		    if(layEvent === 'edit'){
		      //layer.msg('查看操作');		
			  layer.open({
			  type: 2,
			  title: '查看公告',
			  //closeBtn: 0, //不显示关闭按钮
			  shadeClose: true,
			  shade: false,
			  area: ['893px', '600px'],
			 // offset: 'rb', //右下角弹出
			  //time: 2000, //2秒后自动关闭
			  maxmin: true,
			  anim: 2,
			  content: ['/v1/office/announcement/edit?id='+data.Id], //iframe的url，no代表不显示滚动条
			  cancel: function(index, layero){ 
			  if(confirm('确定要关闭么')){ //只有当点击confirm框的确定时，该层才会关闭
			    layer.close(index)
				window.location.reload();
			  }
			  return false; 
			  },
		});
	    } else if(layEvent === 'del'){
	      layer.confirm('真的删除行么', function(index){
	        var jsData={'id':data.Id}
			$.post('/v1/office/announcement/del', jsData, function (out) {
                if (out.code == 200) {
                    layer.alert('删除成功了', {icon: 1},function(index){
                        layer.close(index);
                        table.reload({});
                    });
                } else {
                    layer.msg(out.message)
                }
            }, "json");
			obj.del(); //删除对应行（tr）的DOM结构
	        layer.close(index);
	        //向服务端发送删除指令
	      });
	    } else if(layEvent === 'stop'){
	      	layer.confirm('真的终止？', function(index){
	        var jsData={'id':data.Id,'status':"终止"}
			$.post('/v1/office/announcement/changestatus', jsData, function (out) {
                if (out.code == 200) {
                    layer.alert('修改成功了', {icon: 1},function(index){
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
  
	$('#add').on('click',function(){
		layer.open({
			  type: 2,
			  title: '新建公告通知',
			  //closeBtn: 0, //不显示关闭按钮
			  shadeClose: true,
			  shade: false,
			  area: ['893px', '600px'],
			 // offset: 'rb', //右下角弹出
			  //time: 2000, //2秒后自动关闭
			  maxmin: true,
			  anim: 2,
			  content: ['/v1/office/announcement/add'], //iframe的url，no代表不显示滚动条
			  //cancel: function(index, layero){ 
			 // if(confirm('确定要关闭么')){ //只有当点击confirm框的确定时，该层才会关闭
			  //  layer.close(index)
			 // }
			   
			 // },
		});
		return false;
	});
	
	$('#query').on('click',function(){
		//alert("点击查询")	
		table.reload('listReload',{
			where:{
				title:$("#title").val(),
				status:$("#status").val(),
				start_time:$("#date").val(),
				end_time:$("#date1").val(),
				style:$("#style").val(),
			}
		})
	})
});
</script>

</body>
</html>