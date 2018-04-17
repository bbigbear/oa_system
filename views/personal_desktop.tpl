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
body{padding: 40px;}
#sortable { list-style-type: none; margin: 0; padding: 0; width: auto; }
#sortable li { margin: 5px 20px 20px 0; padding: 1px; float: left; width: 100px; height: 90px;text-align: center; }
ul li img { width: 60px; height: 60px; text-align: center; }
ul li span {display:block; text-align: center; }
</style>
</head>
<body>
<ul id="sortable">
  <li class="ui-state-default" id="announce"><img src="../static/img/admin.jpg" /><span>公告管理</span></li>
  <li class="ui-state-default" id="news"><img src="../static/img/car.png" /><span>新闻管理</span></li>
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
		//alert(parent.list)
	  });
	  
	  $('#announce').on('click',function(){
		alert("公告管理")
		window.parent.ChangeTabs("公告管理");
	  });
	
	
});
</script>

</body>
</html>