<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>新增公告通知</title>
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
    <label class="layui-form-label">计划编号</label>
    <div class="layui-input-block" style="width: 500px;">
	<input type="text" name="number" id="number" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">计划名称</label>
    <div class="layui-input-block" style="width: 500px;">
	<input type="text" name="name" id="name" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">招聘渠道</label>
    <div class="layui-input-inline" style="width: 150px;">
      <select name="channel" id="channel" lay-filter="style_select">
		    <option value="请选择" > 请选择</option>
			<option value="网络招聘" > 网络招聘</option>
			<option value="招聘会招聘" > 招聘会招聘</option>
			<option value="人才猎头推荐" > 人才猎头推荐</option>
      </select>
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">预算费用</label>
    <div class="layui-input-block" style="width: 500px;">
	<input type="text" name="cost" id="cost" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-inline">
    <label class="layui-form-label">日期</label>
    <div class="layui-input-inline" style="width: 120px;">
      <input type="text" name="date" id="date1" autocomplete="off" class="layui-input">
    </div>
	<div class="layui-input-inline" style="width: 120px;">
      <input type="text" name="date" id="date2" autocomplete="off" class="layui-input">
    </div>
  </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">招聘人数</label>
    <div class="layui-input-block" style="width: 500px;">
	<input type="text" name="people" id="people" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">审批人</label>
    <div class="layui-input-block" style="width: 500px;">
	<input type="text" name="approver" id="approver" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">招聘说明</label>
    <div class="layui-input-block">
      <textarea class="layui-textarea" name="explain" id="explain"></textarea>
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">备注</label>
    <div class="layui-input-block">
      <textarea class="layui-textarea" name="remark" id="remark"></textarea>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-upload">
	<div class="layui-inline">	
    <label class="layui-form-label">已存在附件</label>
      <div class="layui-input-inline" style="width:auto;">
		  <div class="layui-upload-list">
		    <table class="layui-table" lay-size="sm">
		      <thead>
		        <th>文件名</th>		        
		        <th>操作</th>
		      </thead>
		      <tbody id="demoListed"></tbody>
		    </table>
		  </div>     
	  </div>
    </div>	
	</div>
  </div>
  <div class="layui-form-item">
    <div class="layui-upload">
	<div class="layui-inline">	
    <label class="layui-form-label">附件</label>
      <div class="layui-input-inline">
		  <div style="margin-top:10px;">	    
	        <i class="layui-icon">&#xe61d;</i><a id="testList">添加附件</a>	
		  </div>     
	  </div>
    </div>	
	</div>
  </div>
 <div class="layui-form-item">
	<div class="layui-input-block">	
       <div class="layui-upload-list">
	    <table class="layui-table" lay-size="sm">
	      <thead>
	        <th>文件名</th>
	        <th>大小</th>
	        <th>状态</th>
	        <th>操作</th>
	      </thead>
	      <tbody id="demoList"></tbody>
	    </table>
	  </div>
    </div>	
  </div>
  <div class="layui-form-item">
    <div class="layui-input-block">
<!--      <button class="layui-btn" id="add">发布</button>-->
<!--	  <input type="hidden" id="pic_path">-->
      <button class="layui-btn layui-btn-primary" id="save">保存</button>
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

	//自动加载
	var id
	var list=[]
	var path=""
	$(function(){
		//获取
		//console.log({{.m}})	
		{{range .m}}
			id={{.Id}}
			$("#number").val({{.Number}})
			$("#name").val({{.Name}})			
			$("#channel").val({{.Channel}})	
			$("#cost").val({{.Cost}})
			$("#date1").val({{.StartDay}})
			$("#date2").val({{.EndDay}})
			$("#people").val({{.People}})
			$("#approver").val({{.Approver}})
			$("#explain").val({{.Explain}})
			$("#remark").val({{.Remark}})
			list={{.Path}}.split(',')
		{{end}}		
		
		if(list[0]==""){
			list=[]
		}
		//alert(list[0])
		for(var i=0;i<list.length-1;i++){
			path=path+list[i]+',';
			var tr = $(['<tr>'
	          ,'<td>'+ list[i] +'</td>'
	          ,'<td>'
	            ,'<a href="/'+list[i]+'" download="file">下载 </a>'
				//,'<a id="'+i+'"> 删除</a>'
	          ,'</td>'
	        ,'</tr>'].join(''));
			//$('#demo1').append('<img src="'+"/"+list[i]+'" id="'+i+'" style="width:80px;height:80px;padding-left:10px;">')
			$("#"+i).bind('click',function(){             
                alert("删除")
				$(this).remove();
				console.log("this",$(this)[0].id);
				console.log("i",i);				
				delete list[$(this)[0].id]
            });
		}
		$('#demoListed').append(tr);
		form.render();		
	});
	
	 laydate.render({
	    elem: '#date1'
	    ,type: 'date'
	  });
	
	
	//文本域
	var index=layedit.build('detail',{
		hideTool:['image','face']
	});
		
   
	  //多文件列表示例
	 
	  var demoListView = $('#demoList')
	  ,uploadListIns = upload.render({
	    elem: '#testList'
	    ,url: '/v1/put_file'
	    ,accept: 'file'
	    ,multiple: true
	    ,auto: false
	    ,bindAction: '#save'
	    ,choose: function(obj){   
	      var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
	      //读取本地文件
	      obj.preview(function(index, file, result){
	        var tr = $(['<tr id="upload-'+ index +'">'
	          ,'<td>'+ file.name +'</td>'
	          ,'<td>'+ (file.size/1014).toFixed(1) +'kb</td>'
	          ,'<td>等待上传</td>'
	          ,'<td>'
	            ,'<button class="layui-btn layui-btn-xs demo-reload layui-hide">重传</button>'
	            ,'<button class="layui-btn layui-btn-xs layui-btn-danger demo-delete">删除</button>'
	          ,'</td>'
	        ,'</tr>'].join(''));
	        
	        //单个重传
	        tr.find('.demo-reload').on('click', function(){
	          obj.upload(index, file);
	        });
	        
	        //删除
	        tr.find('.demo-delete').on('click', function(){
	          delete files[index]; //删除对应的文件
	          tr.remove();
	          uploadListIns.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选
	        });
	        
	        demoListView.append(tr);
	      });
	    }
	    ,done: function(res, index, upload){
	      if(res.code == 200){ //上传成功
			path=path+res.data.src+','
	        var tr = demoListView.find('tr#upload-'+ index)
	        ,tds = tr.children();
	        tds.eq(2).html('<span style="color: #5FB878;">上传成功</span>');
	        tds.eq(3).html(''); //清空操作
	        return delete this.files[index]; //删除文件队列已经上传成功的文件
	      }
	      this.error(index, upload);
	    }
	    ,error: function(index, upload){
	      var tr = demoListView.find('tr#upload-'+ index)
	      ,tds = tr.children();
	      tds.eq(2).html('<span style="color: #FF5722;">上传失败</span>');
	      tds.eq(3).find('.demo-reload').removeClass('layui-hide'); //显示重传
	    }
		,allDone: function(obj){
	      	//alert(path_src)
			console.log(obj)
			//post json
			uploadData();						
	    }
	  });
		
	//数据上传
	function uploadData(){
		var channel=$("#channel").val()
		var data={
			'id':id,
			'number':$("#number").val(),
			'name':$("#name").val(),
			'channel':channel,
			'cost':$("#cost").val(),
			'startDay':$("#date1").val(),
			'endDay':$("#date2").val(),
			'people':$("#people").val(),
			'approver':$("#approver").val(),
			'explain':$("#explain").val(),
			'remark':$("#remark").val(),
			'path':path
			};
			console.log(data)
			if(channel=="请选择"){
				alert("请选择招聘渠道")
			}else{
				//发布
				$.ajax({
					type:"POST",
					contentType:"application/json;charset=utf-8",
					url:"/v1/recruit/require/edit_action",
					data:JSON.stringify(data),
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
			}			
	}
	
	//保存
	$('#save').on('click',function(){
		//console.log($("#demoList tr").length)			
		var len = $("#demoList tr").length
		if (len==0){
			uploadData()
		}
		return false;
	});
});
</script>

</body>
</html>