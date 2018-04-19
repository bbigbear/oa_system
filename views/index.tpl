<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="apple-mobile-web-app-status-bar-style" content="black"> 
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="format-detection" content="telephone=no">
<title>OA系统</title>
<link rel="stylesheet" href="/static/css/layui.css">
<link rel="stylesheet" href="/static/css/bootstrap.min.css">
  <script src="//code.jquery.com/jquery-1.9.1.js"></script>
  <script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
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
<!--		    <div class="layui-tab-item"><iframe src='/v1/desk' style="width:100%;height:800px;"></iframe></div>-->
			<div class="layui-tab-item" style="padding: 40px;">
				<ul id="sortable">
				  <li class="ui-state-default" id="announce"><img src="../static/img/admin.jpg" /><span>公告管理</span></li>
				  <li class="ui-state-default" id="news"><img src="../static/img/car.png" /><span>新闻管理</span></li>
				  <li class="ui-state-default" id="recruit_require"><img src="../static/img/car.png" /><span>招聘需求</span></li>
				</ul>
			</div>
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
	#sortable { list-style-type: none; margin: 0; padding: 0; width: auto; }
	#sortable li { margin: 5px 20px 20px 0; padding: 1px; float: left; width: 100px; height: 90px;text-align: center; }
	ul li img { width: 60px; height: 60px; text-align: center; }
	ul li span {display:block; text-align: center; }
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
		$( "#sortable" ).sortable();
	    $( "#sortable" ).disableSelection();			
	});
	var dic = {"公告管理": "/v1/office/announcement", "新闻管理": "/v1/office/news","招聘需求":"/v1/recruit/require"};
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
	
	$('#announce').on('click',function(){
		ChangeTabs("公告管理")
	  });
	
	$('#news').on('click',function(){
		ChangeTabs("新闻管理")
	  });
	$('#recruit_require').on('click',function(){
		ChangeTabs("招聘需求")
	  });	
			
  });

	
	
</script>

</body>
</html>