<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>新增招聘计划</title>
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
	<div class="layui-inline">
	    <label class="layui-form-label">计划编号</label>
	    <div class="layui-input-block" >
		<input type="text" name="number" id="number" autocomplete="off" class="layui-input">
	    </div>
	</div>
	<div class="layui-inline">
	    <label class="layui-form-label">计划名称</label>
	    <div class="layui-input-block" >
		<input type="text" name="planName" id="planName" autocomplete="off" class="layui-input">
	    </div>
	</div>
  </div>
  <div class="layui-form-item">
	<div class="layui-inline">
	    <label class="layui-form-label">培训渠道</label>
		<div class="layui-input-block" >
		    <select name="trainChannel" id="trainChannel" lay-filter="style_select">
			    <option value="请选择" > 请选择</option>
				<option value="内部培训" > 内部培训</option>
				<option value="渠道培训" > 渠道培训</option>
	      	</select>
		</div>
	</div>
	<div class="layui-inline">
	    <label class="layui-form-label">培训形式</label>
		<div class="layui-input-block" >
		    <select name="trainForm" id="trainForm" lay-filter="style_select">
			    <option value="请选择" > 请选择</option>
				<option value="面授" > 面授</option>
				<option value="函授" > 函授</option>
				<option value="其他" > 其他</option>
	      	</select>
		</div>
	</div>
  </div>
  <div class="layui-form-item">
	<div class="layui-inline">
	    <label class="layui-form-label">主办单位</label>
	    <div class="layui-input-block" >
		<input type="text" name="department" id="department" autocomplete="off" class="layui-input">
	    </div>
	</div>
	<div class="layui-inline">
	    <label class="layui-form-label">负责人</label>
	    <div class="layui-input-block" >
		<input type="text" name="leader" id="leader" autocomplete="off" class="layui-input">
	    </div>
	</div>
  </div>
  <div class="layui-form-item">
	<div class="layui-inline">
	    <label class="layui-form-label">计划参与培训人数</label>
	    <div class="layui-input-block" >
		<input type="text" name="joinNum" id="joinNum" autocomplete="off" class="layui-input" lay-verify="required|number">
	    </div>		
	</div>
	<div class="layui-inline">
	    <label class="layui-form-label">培训地点</label>
	    <div class="layui-input-block" >
		<input type="text" name="trainPlace" id="trainPlace" autocomplete="off" class="layui-input">
	    </div>
	</div>
  </div>
 <div class="layui-form-item">
	<div class="layui-inline">
	    <label class="layui-form-label">培训机构名称</label>
	    <div class="layui-input-block" >
		<input type="text" name="trainName" id="trainName" autocomplete="off" class="layui-input">
	    </div>		
	</div>
	<div class="layui-inline">
	    <label class="layui-form-label">培训机构联系人</label>
	    <div class="layui-input-block" >
		<input type="text" name="trainContract" id="trainTotalTime" autocomplete="off" class="layui-input">
	    </div>
	</div>
  </div>
 <div class="layui-form-item">
	<div class="layui-inline">
	    <label class="layui-form-label">培训课程名称</label>
	    <div class="layui-input-block" >
		<input type="text" name="trainCname" id="trainCname" autocomplete="off" class="layui-input">
	    </div>		
	</div>
	<div class="layui-inline">
	    <label class="layui-form-label">总课时</label>
	    <div class="layui-input-block" >
		<input type="text" name="trainTotalTime" id="totalTime" autocomplete="off" class="layui-input" lay-verify="required|number">
	    </div>
	</div>
  </div>
  <div class="layui-form-item">
    <div class="layui-inline">
	    <label class="layui-form-label">开课时间</label>
	    <div class="layui-input-inline">
	      <input type="text" name="date" id="date1" autocomplete="off" class="layui-input">
	    </div>
	</div>
	<div class="layui-inline">
		<label class="layui-form-label">结课时间</label>
		<div class="layui-input-inline">
	      <input type="text" name="date" id="date2" autocomplete="off" class="layui-input">
	    </div>
 	</div>
  </div>
 <div class="layui-form-item">
	<div class="layui-inline">
	    <label class="layui-form-label">培训预算</label>
	    <div class="layui-input-block" >
		<input type="text" name="budget" id="budget" autocomplete="off" class="layui-input" lay-verify="required|number">
	    </div>		
	</div>
	<div class="layui-inline">
	    <label class="layui-form-label">审批人</label>
	    <div class="layui-input-block" >
		<input type="text" name="approver" id="approver" autocomplete="off" class="layui-input">
	    </div>
	</div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">参与培训部门</label>
    <div class="layui-input-block" style="width: 500px;">
	<input type="text" name="joinDepartment" id="joinDepartment" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">参与培训人员</label>
    <div class="layui-input-block" style="width: 500px;">
	<input type="text" name="joinPeople" id="joinPeople" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">培训机构相关信息</label>
    <div class="layui-input-block">
      <textarea class="layui-textarea" name="trainInfo" id="trainInfo"></textarea>
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">培训机构联系人相关信息</label>
    <div class="layui-input-block">
      <textarea class="layui-textarea" name="trainContractInfo" id="trainContractInfo"></textarea>
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">培训要求</label>
    <div class="layui-input-block">
      <textarea class="layui-textarea" name="trainRequire" id="trainRequire"></textarea>
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">培训说明</label>
    <div class="layui-input-block">
      <textarea class="layui-textarea" name="trainExplain" id="trainExplain"></textarea>
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
    <label class="layui-form-label">培训内容</label>
    <div class="layui-input-block">
      <textarea class="layui-textarea" name="trainDetail" id="trainDetail"></textarea>
    </div>
  </div>
<!--  <div class="layui-upload">
	  <button type="button" class="layui-btn layui-btn-normal" id="testList">选择多文件</button> 
	  <div class="layui-upload-list">
	    <table class="layui-table">
	      <thead>
	        <th>文件名</th>
	        <th>大小</th>
	        <th>状态</th>
	        <th>操作</th>
	      </thead>
	      <tbody id="demoList"></tbody>
	    </table>
	  </div>
	  <button type="button" class="layui-btn" id="testListAction">开始上传</button>
	</div>-->
  <!--<div class="layui-form-item layui-form-text">
    <label class="layui-form-label">岗位要求</label>
    <div class="layui-input-block">
      <textarea class="layui-textarea" name="detail" id="detail"></textarea>
    </div>
  </div>-->
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
		console.log({{.m}})	
		{{range .m}}
			id={{.Id}}
			$("#number").val({{.Number}})
			$("#planName").val({{.PlanName}})			
			$("#trainChannel").val({{.TrainChannel}})	
			$("#trainForm").val({{.TrainForm}})
			$("#date1").val({{.TrainStartTime}})
			$("#date2").val({{.TrainEndTime}})
			$("#department").val({{.Department}})
			$("#leader").val({{.Leader}})
			$("#joinNum").val({{.JoinNum}})
			$("#trainPlace").val({{.TrainPlace}})
			$("#trainName").val({{.TrainName}})
			$("#trainContract").val({{.TrainContract}})
			$("#trainCname").val({{.TrainCname}})
			$("#totalTime").val({{.TrainTotalTime}})
			$("#budgrt").val({{.Budget}})
			$("#approver").val({{.Approver}})
			$("#joinDepartment").val({{.JoinDepartment}})
			$("#joinPeople").val({{.JoinPeople}})
			$("#trainInfo").val({{.TrainInfo}})
			$("#trainContractInfo").val({{.TrainContractInfo}})
			$("#trainRequire").val({{.TrainRequire}})
			$("#trainExplain").val({{.TrainExplain}})
			$("#remark").val({{.Remark}})
			$("#trainDetail").val({{.TrainDetail}})
			list={{.FilePath}}.split(',')			
		{{end}}		
		
		if(list[0]==""){
			list=[]
		}
		//alert(list[0])
		
		for(var i=0;i<list.length-1;i++){
			path=path+list[i]+',';
			var m=list[i].split('/')
			var tr = $(['<tr>'
	          ,'<td>'+ m[2] +'</td>'
	          ,'<td>'
	            ,'<a href="/'+list[i]+'" download="'+m[2]+'">下载 </a>'
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
	    elem: '#day'
		,type: 'datetime'
	  });
	
	 laydate.render({
	    elem: '#date1'
	    //,type: 'date'
		,type: 'datetime'
	  });
	
	 laydate.render({
	    elem: '#date2'
	    ,type: 'datetime'
	  });
	
	//文本域
	var index=layedit.build('detail',{
		hideTool:['image','face']
	});
		
   
	  //多文件列表示例
	  var path=""
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
		var trainChannel=$("#trainChannel").val()
		var trainForm=$("#trainForm").val()
		var data={
			'id':id,
			'number':$("#number").val(),
			'planName':$("#planName").val(),
			'trainChannel':trainChannel,
			'trainForm':trainForm,
			'department':$("#department").val(),
			'leader':$("#leader").val(),
			'joinNum':parseInt($("#joinNum").val()),
			'trainPlace':$("#trainPlace").val(),
			'trainName':$("#trainName").val(),
			'trainContract':$("#trainContract").val(),
			'trainCname':$("#trainCname").val(),
			'trainTotalTime':parseInt($("#totalTime").val()),			
			'budget':parseInt($("#budget").val()),
			'approver':$("#approver").val(),
			'joinDepartment':$("#joinDepartment").val(),
			'joinPeople':$("#joinPeople").val(),
			'trainInfo':$("#trainInfo").val(),
			'trainContractInfo':$("#trainContractInfo").val(),
			'trainRequire':$("#trainRequire").val(),
			'trainExplain':$("#trainExplain").val(),
			'remark':$("#remark").val(),
			'filePath':path,
			'trainDetail':$("#trainDetail").val(),
			'trainStartTime':$("#date1").val(),
			'trainEndTime':$("#date2").val()
			};
			console.log(data)
			if(trainChannel=="请选择"||trainForm=="请选择"){
				alert("请选择培训通道或者培训形式")
			}else{
				//发布
				$.ajax({
					type:"POST",
					contentType:"application/json;charset=utf-8",
					url:"/v1/train/plan/edit_action",
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