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
<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
  <ul class="layui-tab-title">
    <li class="layui-this">未设置</li>
    <li>已设置</li>
  </ul>
  <div class="layui-tab-content">
	<div class="layui-tab-item layui-show">
		<ul id="sortable">
		  {{range .unset}}
		  <li class="ui-state-default" id={{.Id}}><img src={{.Pic}} /><span>{{.Name}}</span></li>
<!--		  <li class="ui-state-default" id="news"><img src="../static/img/car.png" /><span>新闻管理</span></li>-->
		  {{end}}
		</ul>
	</div>
    <div class="layui-tab-item">
		<ul id="sortable">
		  {{range .desk}}
		  <li class="ui-state-default" id={{.Id}}><img src={{.Path}} /><span>{{.Name}}</span></li>
<!--		  <li class="ui-state-default" id="news"><img src="../static/img/car.png" /><span>新闻管理</span></li>-->
		  {{end}}
		</ul>
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
	    $( "#sortable" ).sortable();
	    $( "#sortable" ).disableSelection();
		//alert(parent.list)
	  });	  	
		  
	  $('#announce').on('click',function(){
		
		//var index = parent.layer.getFrameIndex(window.name);
		//alert(index)
		//top.window.parent.ChangeTabs("公告管理");
	  });
	//未设置
		{{range .unset}}
			$('#'+{{.Id}}).on('click',function(){
				//alert("未设置")
				layer.confirm('确定添加到桌面？', function(index){
			        var data={'name':{{.Name}},'path':{{.Pic}}}
					$.ajax({
						type:"POST",
						contentType:"application/json;charset=utf-8",
						url:"/v1/desk/add",
						data:JSON.stringify(data),
						async:false,
						error:function(request){
							alert("post error")						
						},
						success:function(res){
							if(res.code==200){
								layer.alert('添加成功', {icon: 1},function(index){
		                        	layer.close(index);
									window.location.reload();
		                    	});		
							}else{
								 layer.msg(out.message)
							}						
						}
					  	});
			      });
			});
		{{end}}
		
	//已设置
		{{range .desk}}
			$('#'+{{.Id}}).on('click',function(){
				//alert("已设置")	
				layer.confirm('确定要移除桌面？', function(index){
			        var jsData={'id':{{.Id}}}
					$.post('/v1/desk/del', jsData, function (out) {
		                if (out.code == 200) {
		                    layer.alert('移除成功', {icon: 1},function(index){
		                        layer.close(index);
		                        window.location.reload();
		                    });
		                } else {
		                    layer.msg(out.message)
		                }
		            }, "json");
			      });
			});
		{{end}}
	
	
});
</script>

</body>
</html>