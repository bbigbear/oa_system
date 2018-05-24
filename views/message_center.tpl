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

<style>
body{padding: 10px;}
</style>
</head>
<body>
<div class="layui-container">  
  <div class="layui-row layui-col-space30">
    <div class="layui-col-md6">
      <div class="layui-collapse">
		  <div class="layui-colla-item">
		    <h2 class="layui-colla-title">公告通知</h2>
		    <div class="layui-colla-content layui-show">
				<ul class="site-dir">
				<<<range .maps>>>
				  <li id="a_<<<.Id>>>"><a>【<<<.Style>>>】<<<.Title>>> (<<<.StartTime>>>)</a></li>			 
				<<<end>>>
				</ul>
			</div>
		  </div>
	  </div>
    </div>
    <div class="layui-col-md4">
      <div class="layui-collapse">
		  <div class="layui-colla-item">
		    <h2 class="layui-colla-title">新闻</h2>
		    <div class="layui-colla-content layui-show">
				<ul class="site-dir">
				<<<range .news_maps>>>
				  <li id="n_<<<.Id>>>"><a>【<<<.Style>>>】<<<.Title>>> (<<<.Day>>>)</a></li>			 
				<<<end>>>
				</ul>
			</div>
		  </div>
	  </div>
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

	  $(function() {
	  });
	
	laydate.render({
	    elem: '#date'
	    ,type: 'date'
	  });
	
	 laydate.render({
	    elem: '#date1'
	    ,type: 'date'
	  });
	 
	<<<range .maps>>>
		$('#a_'+<<<.Id>>>).on('click',function(){
			//alert(<<<.Id>>>)
			//iframe窗
			layer.open({
			  type: 2,
			  title: '详情',
			  //closeBtn: 0, //不显示关闭按钮
			  shadeClose: true,
			  shade: false,
			  area: ['893px', '600px'],
			 // offset: 'rb', //右下角弹出
			  //time: 2000, //2秒后自动关闭
			  maxmin: true,
			  anim: 2,
			  content: ['/v1/message_detail?id='+parseInt(<<<.Id>>>)+'&type=announce'], //iframe的url，no代表不显示滚动条
			  cancel: function(index, layero){ 
			  //if(confirm('确定要关闭么')){ //只有当点击confirm框的确定时，该层才会关闭
			    layer.close(index)
				//window.parent.location.reload();
				//重载表格
				//table.reload('listReload', {});
				//window.location.reload();
			  //}
			  return false; 
			  },
			});
		})
	<<<end>>>
	
	<<<range .news_maps>>>
		$('#n_'+<<<.Id>>>).on('click',function(){
			//alert(<<<.Id>>>)
			//iframe窗
			layer.open({
			  type: 2,
			  title: '详情',
			  //closeBtn: 0, //不显示关闭按钮
			  shadeClose: true,
			  shade: false,
			  area: ['893px', '600px'],
			 // offset: 'rb', //右下角弹出
			  //time: 2000, //2秒后自动关闭
			  maxmin: true,
			  anim: 2,
			  content: ['/v1/message_detail?id='+parseInt(<<<.Id>>>)+'&type=news'], //iframe的url，no代表不显示滚动条
			  cancel: function(index, layero){ 
			  //if(confirm('确定要关闭么')){ //只有当点击confirm框的确定时，该层才会关闭
			    layer.close(index)
				//window.parent.location.reload();
				//重载表格
				//table.reload('listReload', {});
				//window.location.reload();
			  //}
			  return false; 
			  },
			});
		})
	<<<end>>>
});
</script>

</body>
</html>