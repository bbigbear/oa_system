<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>OA系统</title>
<link rel="stylesheet" href="/static/css/layui.css">
<link rel="stylesheet" href="/static/css/bootstrap.min.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo" style="color:#F0F0F0;font-size:20px;">OA系统</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <!--<ul class="layui-nav layui-layout-left">
      <li class="layui-nav-item"><a href="">个人中心</a></li>
      <li class="layui-nav-item"><a href="">内容管理</a></li>
      <li class="layui-nav-item"><a href="">统计报表</a></li>
	  <li class="layui-nav-item"><a href="">客服管理</a></li>
      <li class="layui-nav-item">
        <a href="javascript:;">系统管理</a>
        <dl class="layui-nav-child">
          <dd><a href="">邮件管理</a></dd>
          <dd><a href="">消息管理</a></dd>
          <dd><a href="">授权管理</a></dd>
        </dl>
      </li>
    </ul>-->
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
        <a href="javascript:;">
          <img src="../static/img/admin.jpg" class="layui-nav-img">
          管理员
        </a>
        <dl class="layui-nav-child">
          <dd><a href="">基本资料</a></dd>
          <dd><a href="">安全设置</a></dd>
        </dl>
      </li>
      <li class="layui-nav-item"><a href="">退出</a></li>
    </ul>
  </div>
  
 <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree"  lay-filter="test">
        <li class="layui-nav-item">
          <a class="" href="javascript:;">快捷菜单</a>
          <dl class="layui-nav-child">
            <dd><a href="javascript:;">列表一</a></dd>
            <dd><a href="javascript:;">列表二</a></dd>
            <dd><a href="javascript:;">列表三</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item">
          <a href="javascript:;">个人事务</a>
          <dl class="layui-nav-child">
            <dd><a href="javascript:;">列表一</a></dd>
            <dd><a href="javascript:;">列表二</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item">
		  <a href="javascript:;">行政办公</a>
		  <dl class="layui-nav-child">
            <dd><a href="javascript:;">公告管理</a></dd>
            <dd><a href="javascript:;">新闻管理</a></dd>
          </dl>
		</li>
        <li class="layui-nav-item">
		  <a href="javascript:;">招聘管理</a>
		  <dl class="layui-nav-child">
            <dd><a href="javascript:;">招聘需求</a></dd>
			<dd><a href="javascript:;">招聘计划</a></dd>
			<dd><a href="javascript:;">人才库</a></dd>
			<dd><a href="javascript:;">招聘筛选</a></dd>
			<dd><a href="javascript:;">招聘录用</a></dd>
          </dl>
		</li>
      </ul>
    </div>
  </div>
  <div class="layui-body">
    <!-- 内容主体区域 -->
    <div style="padding: 15px;">
		<div class="layui-tab" lay-filter="demo" lay-allowclose="true">
		  <ul class="layui-tab-title">
		    <li class="layui-this" lay-id="11">信息中心</li>
		    <li lay-id="22">我的桌面</li>
		  </ul>
		  <div class="layui-tab-content">
		    <div class="layui-tab-item layui-show"><iframe src='/v1/message_center' style="width:100%;height:800px;"></iframe></div>
		    <div class="layui-tab-item"><iframe src='/v1/desk' style="width:100%;height:800px;"></iframe></div>
		  </div>
		</div>
	</div>
  </div> 
  <div class="layui-footer">
    <!-- 底部固定区域 -->
    ©2018 智慧校园. All Rights Reserved
  </div>
</div>
<style>
	.layui-tab-title li:first-child > i {
		display: none;
		disabled:true
	}
</style>

<script src="/static/layui.js"></script>
<!--<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>-->

<script>
	//JavaScript代码区域
	layui.use(['element','layer','jquery','table'], function(){
	  var element = layui.element
		,form=layui.form
		,layer=layui.layer
		,$=layui.jquery
		,table=layui.table;
	  //layer.msg("你好");
	//自动加载
	$(function(){
		if({{.campus}}!=""){
			$("#campus").val({{.campus}});			
			form.render('select');	
		}				
	});
	var dic = {"公告管理": "/v1/office/announcement", "新闻管理": "/v1/office/news"};
	var newarray=new Array()
	var list =[]
	list[0]="信息中心"
	list[1]="我的桌面"	
	
	element.on('nav(test)', function(elem){
	  //alert(dic[elem[0].textContent])
	  console.log(elem); //得到当前点击的DOM对象
	  console.log(elem[0].textContent);
	  console.log(list);
	  //console.log($.inArray(list, elem[0].textContent));
	  ChangeTabs(elem[0].textContent)  	  	  
	});
	
	//切换tabs
	function ChangeTabs(n){
	  var index= $.inArray(n,list)
	  //var data=elem[0].textContent;	  
	  if(index==-1){
		//新增一个Tab项
		  list.push(n)
	      element.tabAdd('demo', {
	        title: n //用于演示
	        ,content: '<iframe src='+dic[n]+' style="width:100%;height:800px;"></iframe>'
	        ,id:list.length-1 //实际使用一般是规定好的id，这里以时间戳模拟下
	      });
		//切换
		  element.tabChange('demo', list.length-1);
	  }else{
		//切换到tab项
		  element.tabChange('demo', index);
	  }
	}
	
	//删除
	element.on('tabDelete(demo)', function(data){
	 // console.log(data); //当前Tab标题所在的原始DOM元素
	  console.log(data.index); //得到当前Tab的所在下标
	 // console.log(data.elem); //得到当前的Tab大容器
	  list.splice(data.index,1);
	});
	//获取下拉列表
	form.on('select(campus_select)',function(data){
		//layer.msg(data)
		console.log(data.value);
		window.location.href="/v1/dining_room?campus="+data.value;
		
	});
	
	//点击新增按钮
	$('#addroom').on('click',function(){
		//layer.msg("点击添加按钮");
		var cp=$("#campus").val();
		//iframe窗
		layer.open({
		  type: 2,
		  title: '新增餐厅',
		  //closeBtn: 0, //不显示关闭按钮
		  shadeClose: true,
		  shade: false,
		  area: ['893px', '600px'],
		 // offset: 'rb', //右下角弹出
		  //time: 2000, //2秒后自动关闭
		  maxmin: true,
		  anim: 2,
		  content: ['/v1/dining_room/add?campus='+cp], //iframe的url，no代表不显示滚动条
		  cancel: function(index, layero){ 
		  if(confirm('确定要关闭么')){ //只有当点击confirm框的确定时，该层才会关闭
		    layer.close(index)
			//window.parent.location.reload();
			//重载表格
			table.reload('listReload', {});
		  }
		  return false; 
		  },
		});
	});
	
	  //table 渲染
	  table.render({
	    elem: '#roomList'
	    ,height: 315
	    ,url: '/v1/dining_room/getdata' //数据接口
	    ,page: true //开启分页
		,id: 'listReload'
	    ,cols: [[ //表头
		  {field: 'RoomPicPath', title: '窗口图片', width:'11%',height:'20%'
			,templet:function(d){
				var list=d.RoomPicPath.split(',')
				//alert(list.length)
				if(list.length!=1){
					for(var i=0;i<list.length-1;i++){
						return '<img src="'+'/'+list[i]+'">'				
					}
				}else{
					return ""	
				}						
			}}
	      ,{field:'Name', title:'窗口名称', width:120}
	      ,{field:'Status',  title:'状态', width:120}
	      ,{field:'Time', title:'供应时段', width:120}
		  ,{fixed: 'right', title:'操作',width:200, align:'center', toolbar: '#barDemo'}
	    ]]
	  });		
		//监听工具条
		table.on('tool(room)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
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
			  content: ['/v1/dining_room/edit?id='+data.Id], //iframe的url，no代表不显示滚动条
			  cancel: function(index, layero){ 
			  if(confirm('确定要关闭么')){ //只有当点击confirm框的确定时，该层才会关闭
			    layer.close(index)
			  }
			  return false; 
			  },
		});
	    } else if(layEvent === 'del'){
	      layer.confirm('真的删除行么', function(index){
	        var jsData={'id':data.Id}
			$.post('/v1/dining_room/del', jsData, function (out) {
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
	      layer.confirm('真的停业么', function(index){
	        var jsData={'id':data.Id}
			$.post('/v1/dining_room/stop', jsData, function (out) {
                if (out.code == 200) {
                    layer.alert('停业成功了', {icon: 1},function(index){
                        layer.close(index);
                        table.reload({});
                    });
                } else {
                    layer.msg(out.message)
                }
            }, "json");
			//obj.del(); //删除对应行（tr）的DOM结构
	        layer.close(index);
	        //向服务端发送删除指令
	      });					  
	    }
	  });	
			
  });

	
	
</script>

</body>
</html>