<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>考核情况</title>
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
    <div class="layui-upload">
	<div class="layui-inline">	
      <div class="layui-input-inline" style="width:auto;">
		  <div class="layui-upload-list">
		    <table class="layui-table">
		      <thead>
		        <th>考核人员</th>		        
		        <th>已考核</th>
				<th>未考核成员</th>
		      </thead>
		      <tbody id="demoListed">
			  	<tr>
				{{range .maps}}
					<td style="width:200px;">{{.CheckPeople}}</td>
					<td style="width:200px;"></td>
					<td style="width:200px;">{{.CheckedPeople}}</td>
<!--					<td><i class="layui-icon">&#xe654;</i><a id="add">添加</a></td>-->
				{{end}}
				</tr>
			  </tbody>
		    </table>
		  </div>     
	  </div>
    </div>	
	</div>
  </div>
</form>

<br><br><br>


<script src="/static/layui.js"></script>
<!-- <script src="../build/lay/dest/layui.all.js"></script> -->

<script>
layui.use(['form','laydate','upload','jquery','layedit','element'], function(){
  var form = layui.form
  ,laydate=layui.laydate
  ,upload = layui.upload
  , $ = layui.jquery
  ,layedit=layui.layedit
  ,element=layui.element;

	
	
	 laydate.render({
	    elem: '#date1'
	    ,type: 'date'
	  });
	
	
	//文本域
	var index=layedit.build('detail',{
		hideTool:['image','face']
	});
		
   
	 		
	//数据上传
	function uploadData(){
		var data={
			'cid':parseInt({{.cid}}),
			'project':$("#project").val(),
			'range1':parseInt($("#range1").val()),
			'range2':parseInt($("#range2").val()),
			'info':$("#info").val()
			};
			console.log(data)		
				//发布
				$.ajax({
					type:"POST",
					contentType:"application/json;charset=utf-8",
					url:"/v1/perform/checkset/detail/add",
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
							alert("保存失败")
						}						
					}
			  	});			
	}
	
	//保存
	$('#add').on('click',function(){
		//console.log($("#demoList tr").length)
		if($('#project').val()==""){
			alert("不能为空")
		}else{
			uploadData()
		}	
		//alert("添加")
		//
		return false;
	});
});
</script>

</body>
</html>