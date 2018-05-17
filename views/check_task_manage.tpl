<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>考核任务管理</title>
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
    <label class="layui-form-label" style="width:100px;">任务名称</label>
    <div class="layui-input-inline" style="width: 100px;">
      <input type="text" id="number" autocomplete="off" class="layui-input">
    </div>
  </div>  
  <div class="layui-inline">
    <label class="layui-form-label">状态</label>
    <div class="layui-input-inline" style="width: 100px;">
      <select name="status" id="status" lay-filter="status_select">
		    <option value="生效" > 生效</option>
			<option value="失效" > 失效</option>
      </select>
    </div>
  </div>
  <div class="layui-inline">
    <label class="layui-form-label">考核人</label>
    <div class="layui-input-inline" style="width: 100px;">
      <input type="text" id="name" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-inline">
    <label class="layui-form-label" style="width:100px;">被考核人</label>
    <div class="layui-input-inline" style="width: 100px;">
      <input type="text" id="name" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-inline">
    <label class="layui-form-label">日期范围</label>
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
    <button class="layui-btn" id="add">新建考核任务</button>
   </div>
  </div>
</form>

<br><br>

	<table id="list" lay-filter="rq"></table>
	<script type="text/html" id="barDemo">
		<a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="check">考核情况</a>	
		<a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit">详情</a>		
		<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
		<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="stop">立即终止</a>	
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
	    ,url: '/v1/perform/checkmanage/getdata'//数据接口
	    //,page: true //开启分页
		,id: 'listReload'
	    ,cols: [[ //表头
		  //{type:'checkbox', fixed: 'left'}	  
	      {field:'Title', title:'考核任务名称', width:120}
		  ,{field:'CheckPeople',  title:'考核人', width:120}
	      ,{field:'CheckedPeople',  title:'被考核人', width:120}
		  ,{field:'CheckIndexs',  title:'考核指标集', width:120}
		  ,{field:'Anonymous',  title:'匿名', width:120}
		  ,{field:'StartTime',  title:'生效日期', width:120}
		  ,{field:'EndTime',  title:'终止日期', width:120}
		  ,{field:'Status',  title:'状态', width:120}
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
			  title: '查看计划',
			  //closeBtn: 0, //不显示关闭按钮
			  shadeClose: true,
			  shade: false,
			  area: ['893px', '600px'],
			 // offset: 'rb', //右下角弹出
			  //time: 2000, //2秒后自动关闭
			  maxmin: true,
			  anim: 2,
			  content: ['/v1/perform/checkmanage/edit?id='+data.Id], //iframe的url，no代表不显示滚动条			  
		});
	    } else if(layEvent === 'del'){
	      layer.confirm('真的删除行么', function(index){
	        var jsData={'id':data.Id}
			$.post('/v1/perform/checkmanage/del', jsData, function (out) {
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
	    }else if(layEvent === 'stop'){
	      layer.confirm('真的立刻终止么', function(index){
	        var jsData={'id':data.Id}
			$.post('/v1/perform/checkmanage/change', jsData, function (out) {
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
	        //向服务端发送删除指令
	      });
	    }else if(layEvent === 'check'){
		      //layer.msg('查看操作');		
			  layer.open({
			  type: 2,
			  title: '查看考核情况',
			  //closeBtn: 0, //不显示关闭按钮
			  shadeClose: true,
			  shade: false,
			  area: ['893px', '600px'],
			 // offset: 'rb', //右下角弹出
			  //time: 2000, //2秒后自动关闭
			  maxmin: true,
			  anim: 2,
			  content: ['/v1/perform/checkmanage/result?id='+data.Id], //iframe的url，no代表不显示滚动条			  
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