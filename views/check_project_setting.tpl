<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>考核项目设定</title>
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
    <li class="layui-this">新建考核指标</li>
    <li>考核指标管理</li>
  </ul>
  <div class="layui-tab-content" style="height:auto;">
    <div class="layui-tab-item layui-show">
		<div>
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
		</div>
	</div>
    <div class="layui-tab-item">
		<table id="list" lay-filter="rq"></table>
		<script type="text/html" id="barDemo">
			<a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="detail">指标集明细</a>
			<a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit">详情</a>		
			<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
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
	    elem: '#list'
	    ,height: 315
	    ,url: '/v1/perform/checkset/getdata'//数据接口
	    ,page: true //开启分页
		,id: 'listReload'
	    ,cols: [[ //表头
		  {type:'checkbox', fixed: 'left'}		  
	      ,{field:'Name', title:'考核指标集名称', width:200}
		  ,{field:'Detail',  title:'考核指标集描述', width:200}
		  ,{fixed: 'right', title:'操作',width:200, align:'center', toolbar: '#barDemo'}
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
			  title: '查看考核指标',
			  //closeBtn: 0, //不显示关闭按钮
			  shadeClose: true,
			  shade: false,
			  area: ['893px', '600px'],
			 // offset: 'rb', //右下角弹出
			  //time: 2000, //2秒后自动关闭
			  maxmin: true,
			  anim: 2,
			  content: ['/v1/perform/checkset/edit?id='+data.Id], //iframe的url，no代表不显示滚动条			  
		});
	    } else if (layEvent === 'detail'){			
		      //layer.msg('查看操作');		
			  layer.open({
			  type: 2,
			  title: '查看考核指标集明细',
			  //closeBtn: 0, //不显示关闭按钮
			  shadeClose: true,
			  shade: false,
			  area: ['893px', '600px'],
			 // offset: 'rb', //右下角弹出
			  //time: 2000, //2秒后自动关闭
			  maxmin: true,
			  anim: 2,
			  content: ['/v1/perform/checkset/detail?id='+data.Id], //iframe的url，no代表不显示滚动条
			});
		}else if(layEvent === 'del'){
	      layer.confirm('真的删除行么', function(index){
	        var jsData={'id':data.Id}
			$.post('/v1/perform/checkset/del', jsData, function (out) {
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
	    }
	  });
  
	$('#add').on('click',function(){
		//alert("添加")
		var module=$("#module").val()
		var data={
			'name':$("#name").val(),
			'detail':$("#detail").val(),
			'module':module,
			'department':$("#department").val(),
			'people':$("#people").val(),
			'role':$("#role").val(),
			};
			console.log(data)
			if(module=="请选择"){
				alert("请选择考核指标集模块")
			}else{
				//发布
				$.ajax({
					type:"POST",
					contentType:"application/json;charset=utf-8",
					url:"/v1/perform/checkset/add",
					data:JSON.stringify(data),
					async:false,
					error:function(request){ 
						alert("post error")						
					},
					success:function(res){
						if(res.code==200){
							alert("新建成功")
							window.location.reload();		
						}else{
							alert("新建失败")
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