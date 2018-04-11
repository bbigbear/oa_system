<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>个人桌面</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="apple-mobile-web-app-status-bar-style" content="black"> 
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="format-detection" content="telephone=no">

  <link rel="stylesheet" href="/static/css/layui.css">
<!--  <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">-->
  <script src="//code.jquery.com/jquery-1.9.1.js"></script>
  <script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<!--  <link rel="stylesheet" href="http://jqueryui.com/resources/demos/style.css">-->

<style>
body{padding: 10px;}
#sortable { list-style-type: none; margin: 0; padding: 0; width: auto; }
#sortable li { margin: 5px 10px 10px 0; padding: 1px; float: left; width: 100px; height: 90px;text-align: center; }
ul li img { width: 80px; height: 80px; text-align: center; }
ul li span {display:block; text-align: center; }
</style>
</head>
<body>
<ul id="sortable">
  <li class="ui-state-default"><img src="../static/img/admin.jpg" /><span>公告管理</span></li>
  <li class="ui-state-default"><img src="../static/img/car.png" /><span>新闻管理</span></li>
  <li class="ui-state-default"><img src="../static/img/fill.png" /><span>我是文字</span></li>
  <li class="ui-state-default"><img src="../static/img/car.png" /><span>我是文字</span></li>
  <li class="ui-state-default"><img src="../static/img/car.png" /><span>新闻管理</span></li>
  <li class="ui-state-default"><img src="../static/img/admin.jpg" /><span>公告管理</span></li>
  <li class="ui-state-default"><img src="../static/img/fill.png" /><span>我是文字</span></li>
  <li class="ui-state-default"><img src="../static/img/car.png" /><span>新闻管理</span></li>
  <li class="ui-state-default"><img src="../static/img/car.png" /><span>新闻管理</span></li>
  <li class="ui-state-default"><img src="../static/img/car.png" /><span>新闻管理</span></li>
</ul>
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

	  $(function() {
	    $( "#sortable" ).sortable();
	    $( "#sortable" ).disableSelection();
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
	    ,url: '/v1/restaurant_dish/getdata?id={{.id}}'//数据接口
	    ,page: true //开启分页
		,id: 'listReload'
	    ,cols: [[ //表头
		  {type:'checkbox', fixed: 'left'}		  
	      ,{field:'Name', title:'发布人', width:120}
		  ,{field:'Price',  title:'类型', width:120}
	      ,{field:'Detail',  title:'发布范围', width:120}
		  ,{field:'DishType',  title:'标题', width:120}
		  ,{field:'DishType',  title:'发布时间', width:120}
		  ,{field:'DishType',  title:'生效时间', width:120}
		  ,{field:'DishType',  title:'终止日期', width:120}
		  ,{field:'DishType',  title:'发布状态', width:120}
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
			  title: '查看菜品',
			  //closeBtn: 0, //不显示关闭按钮
			  shadeClose: true,
			  shade: false,
			  area: ['893px', '600px'],
			 // offset: 'rb', //右下角弹出
			  //time: 2000, //2秒后自动关闭
			  maxmin: true,
			  anim: 2,
			  content: ['/v1/restaurant_dish/edit?id='+data.Id+"&rid={{.id}}"], //iframe的url，no代表不显示滚动条
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
			$.post('/v1/restaurant_dish/del', jsData, function (out) {
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
		var data={
			'campusName':{{.campus_name}},
			'name':$("#name").val()
			};
		console.log(data)
		$.ajax({
			type:"POST",
			contentType:"application/json;charset=utf-8",
			url:"/v1/canteen/add_action",
			data:JSON.stringify(data),
			async:false,
			error:function(request){
				alert("post error")						
			},
			success:function(res){
				if(res.code==200){
					alert("新增成功")
					window.location.reload();					
				}else{
					alert("新增失败")
				}						
			}
		});
		return false;
	});
});
</script>

</body>
</html>