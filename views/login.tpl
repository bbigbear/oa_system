<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="/static/css/bootstrap.min.css">
	</head>
	<body>
		<div class="container" style="width:300px;padding-top:150px">
			<form class="form-signin">
		        <h2 class="form-signin-heading">OA系统</h2>
		        <label for="inputAccount" class="sr-only">帐号</label>
		        <input id="inputAccount" class="form-control" placeholder="帐号" required autofocus name="inputAccount">
		        <label for="inputPassword" class="sr-only">密码</label>
		        <input type="password" id="inputPassword" class="form-control" placeholder="密码" required name="inputPassword">
		        <div class="checkbox">
		          <label>
		            <input type="checkbox" value="remember-me">记住密码
		          </label>
		        </div>
		        <button class="btn btn-lg btn-primary btn-block" id="login">登陆</button>
	      	</form>
		</div>
		<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
		<script>
			$('#login').on('click',function(){	
				$.ajax({
					type:"POST",
					url:"/v1/login_action",
					data:{
						inputAccount:$("#inputAccount").val(),
						inputPassword:$("#inputPassword").val()
					},
					async:false,
					error:function(request){
						alert("post error")						
					},
					success:function(res){
						if(res.code==200){
							alert("登录成功")
							window.location.href="/v1/main"																			
						}else{
							alert("账户密码错误")
						}						
					}					
				});	
				return false;						
		  	});
		</script>
	</body>
</html>
