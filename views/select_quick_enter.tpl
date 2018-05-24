<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>双边栏选择框</title>

    <!-- 需要引用的CSS -->
	<link rel="stylesheet" href="/static/css/layui.css">
	<link rel="stylesheet" type="text/css" href="../static/css/bootstrap.css" />
	<link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
	<link rel="stylesheet" type="text/css" href="../static/css/doublebox-bootstrap.css" />
	<style>
  .ue-container {
	   width: 60%;
	   margin: 0 auto;
	   margin-top: 3%;
	   padding: 20px 40px;
	   border: 1px solid #ddd;
	   background: #fff;
   }
	</style>
	
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
	<!-- 页面结构 -->
	<div class="ue-container">
	    <select multiple="multiple" size="10" name="doublebox" class="demo">
        </select>			
	</div>
	<div style="text-align:center;margin-top:10px;">
		<button class="layui-btn" id="save" style="text-align:center;">保存</button>
	</div>	
    <!-- 需要引用的JS -->
	<script src="/static/layui.js"></script>
   <script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="../static/js/bootstrap.js"></script>
    <script type="text/javascript" src="../static/js/doublebox-bootstrap.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
		  var demo2 = $('.demo').doublebox({
          nonSelectedListLabel: '备选菜单项',
          selectedListLabel: '菜单快捷组项目',
          preserveSelectionOnMove: 'moved',
          moveOnSelect: false,
          nonSelectedList:[
			<<<range .menu>>>
			{"roleName":<<<.>>>},
			<<<end>>>			
			],
          selectedList:[
			<<<range .quickmenu>>>
			{"roleName":<<<.>>>},
			<<<end>>>
			],
          optionValue:"roleName",
          optionText:"roleName",
          doubleMove:true,
        });
        })
		
		$('#save').on('click',function(){
			//alert("保存")
			var roles = [];
			var n =""
			$("#bootstrap-duallistbox-selected-list_doublebox option").each(function(){
			    //遍历所有option
			    var role ={roleId:$(this).val(),roleName:$(this).text()};
			    roles.push(role);
			});
			for(var i=0;i<roles.length;i++){
				n=n+roles[i].roleName+','
			}
			console.log(n)
			//post
			$.ajax({
					type:"POST",
					url:"/v1/quick_enter/add",
					data:{
						name:n
					},
					async:false,
					error:function(request){ 
						alert("post error")						
					},
					success:function(res){
						if(res.code==200){
							alert("保存成功")
							window.location.reload();		
						}else{
							alert("保存失败")
						}						
					}
			  	});
		}); 
		 
    </script>
  </body>
</html>