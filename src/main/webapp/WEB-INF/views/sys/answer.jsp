<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<base href="<%=basePath%>">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>部门管理</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.1/bootstrap-table.min.css">

<link rel="stylesheet" href="<%=basePath%>bower_components/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=basePath%>plugins/bootstrap-table/bootstrap-table.min.css">
<link rel="stylesheet" href="<%=basePath%>plugins/sweetalert/sweetalert.css">
<link rel="stylesheet" href="<%=basePath%>dist/css/AdminLTE.min.css">
<link rel="stylesheet" href="<%=basePath%>layui/css/layui.css" type="text/css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
<script src="<%=basePath%>layui/layui.js"></script>
<script src="<%=basePath%>self/js/jquery-3.2.1.min.js"></script>
<script src="<%=basePath%>bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="<%=basePath%>plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script src="<%=basePath%>plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
<script src="<%=basePath%>plugins/bootstrap-table/bootstrap-table-export.js"></script>
<script src="<%=basePath%>plugins/bootstrap-table/tableExport.js"></script>
<style type="text/css">
.content-wrapper, .main-footer {
	margin-left: 0px;
	position: fixed;
	bottom: 0;
	right: 0;
	width: 100%;
}

body {
	background-color: #ecf0f5;
}
#myModal{
	overflow-y: auto;
}

.ztree li span.button.pIcon01_ico_open {
	margin-right: 2px;
	background: url(<%=basePath%>zTree_v3/css/zTreeStyle/img/diy/1_open.png)
		no-repeat scroll 0 0 transparent;
	vertical-align: top;
	*vertical-align: middle
}

.ztree li span.button.pIcon01_ico_close {
	margin-right: 2px;
	background:
		url(<%=basePath%>zTree_v3/css/zTreeStyle/img/diy/1_close.png)
		no-repeat scroll 0 0 transparent;
	vertical-align: top;
	*vertical-align: middle
}

.ztree li span.button.pIcon02_ico_open, .ztree li span.button.pIcon02_ico_close
	{
	margin-right: 2px;
	background: url(<%=basePath%>zTree_v3/css/zTreeStyle/img/diy/2.png)
		no-repeat scroll 0 0 transparent;
	vertical-align: top;
	*vertical-align: middle
}

.ztree li span.button.icon01_ico_docu {
	margin-right: 2px;
	background: url(<%=basePath%>zTree_v3/css/zTreeStyle/img/diy/3.png)
		no-repeat scroll 0 0 transparent;
	vertical-align: top;
	*vertical-align: middle
}

.ztree li span.button.icon02_ico_docu {
	margin-right: 2px;
	background: url(<%=basePath%>zTree_v3/css/zTreeStyle/img/diy/4.png)
		no-repeat scroll 0 0 transparent;
	vertical-align: top;
	*vertical-align: middle
}

.ztree li span.button.icon03_ico_docu {
	margin-right: 2px;
	background: url(<%=basePath%>zTree_v3/css/zTreeStyle/img/diy/5.png)
		no-repeat scroll 0 0 transparent;
	vertical-align: top;
	*vertical-align: middle
}

.ztree li span.button.icon04_ico_docu {
	margin-right: 2px;
	background: url(<%=basePath%>zTree_v3/css/zTreeStyle/img/diy/6.png)
		no-repeat scroll 0 0 transparent;
	vertical-align: top;
	*vertical-align: middle
}

.ztree li span.button.icon05_ico_docu {
	margin-right: 2px;
	background: url(<%=basePath%>zTree_v3/css/zTreeStyle/img/diy/7.png)
		no-repeat scroll 0 0 transparent;
	vertical-align: top;
	*vertical-align: middle
}

.ztree li span.button.icon06_ico_docu {
	margin-right: 2px;
	background: url(<%=basePath%>zTree_v3/css/zTreeStyle/img/diy/8.png)
		no-repeat scroll 0 0 transparent;
	vertical-align: top;
	*vertical-align: middle
}
::-webkit-scrollbar {/*隐藏滚动条*/
display: none;
}
</style>
<script type="text/javascript">
	$(function () {
	$('#myModal').on('hidden.bs.modal', function (e) {
		 $("#box").html(""); 
	});
    $('#dataTable').on('click-row.bs.table', function (e, row, element) {
    	queryAnswerLine(row);       
    }); 
}) ;
function queryAnswerLine(row){    	  	       
      $.post('answer/temAnswer.action',{template_id:row.template_id},function(data){
    	  $("#basic-addon1").val(row.store_id);
    	  $("#basic-addon2").val(row.docking_man);
    	  $("#basic-addon3").val(row.check_date);
    	  $("#basic-addon5").val(row.start_time);
    	  $("#basic-addon6").val(row.end_time);
    	  $("#basic-addon7").val(row.broker_num);
    	  $("#basic-addon8").val(row.customer_num);
    	  $("#basic-addon9").val(row.store_around);
    	  if(row.template_id=='10'){
    		  $("#basic-addon4").val('模板一');
    		}else if(row.template_id=='11'){
    			$("#basic-addon4").val('模板二');
    		}else if(row.template_id=='12'){
    			$("#basic-addon4").val('模板三');
    		}else if(row.template_id=='10'){
    			$("#basic-addon4").val('模板一');
    		}else{
    			$("#basic-addon4").val('未知模板');
    		}
    	  $.each(data,function(i,item){
    		var str = "<div class='panel panel-primary'>"+
						    "<div class='panel-heading' role='tab' id='"+i+"'>"+
						      "<h4 class='panel-title'>"+
						        "<a class='collapsed' role='button' data-toggle='collapse' data-parent='#accordion' href='#collapse"+i+"' aria-expanded='false' aria-controls='collapse"+i+"'>"+
						          	item.menu_title +
						        "</a>"+
						      "</h4>"+
						    "</div>"+
						    "<div id='collapse"+i+"' class='panel-collapse collapse' role='tabpanel' aria-labelledby='"+i+"'>"+
						      "<div class='panel-body'>"+
						      "<table style='text-align:right;' class=table_  id="+item.id+"></table>"+
						      "</div>"+
						    "</div>"+
						"</div>";		
					
		$("#box").append(str);  
    	 $(".table_").bootstrapTable({   		 
    		url:'answer/title_answer.action?template_id='+item.id+"&store_id="+row.store_id+"&docking_man="+row.docking_man+"&check_date="+row.check_date,
    		showHeader:false,
 			columns: [{
 		        field: 'title',
 		        title: 'title'
 		    }, {
 		        field: 'answerNum',
 		        title: 'answerNum'
 		    }, {
 		        field: 'xq',
 		        title: '详情',
 		       formatter:function (v,r,i){
 		    	   return '<button type="button" class="btn btn-primary">查看详情</button> ';
 		       }
 		    }]
 		    
 		});
    	 });
    	   $('.table_').on('click-row.bs.table', function (e, row, element) {
    	    	showDetails(row);       
    	    }); 
    },'json');     
      
	$('#myModal').modal("show");
}


function template(v){
	if(v=='10'){return '模板一'}
	else if(v=='11'){return '模板二';}
	else if(v=='12'){return '模板三';}
	else {return '未知模板';}
}

function showDetails(r){
	$("#answerDetail").val(r.answer);
	$('#myModaltwo').modal("show");
}

 function answer_num(v){
	if(v=='0'){
		return '否';
	}else if(v=='1'){
		return '是';
	}else{
		return '其他';
	}
} 

</script>
</head>
<body>
<!-- 模态框start -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document" style="width: 80%;">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">详情</h4>
	      </div>
	      <div class="modal-body">
	      <div class="box">
	        <div class="row">
			  <div class="col-md-6">
			  	<div class="panel panel-info">
				  <div class="panel-heading">(￣_,￣ )</div>
				    <div class="input-group">
					  <span class="input-group-addon">门店</span>
					  <input type="text" class="form-control" id="basic-addon1" placeholder="门店" aria-describedby="basic-addon1" readonly>
					</div>
					<div class="input-group">
					  <span class="input-group-addon">对接</span>
					  <input type="text" class="form-control" id="basic-addon2" placeholder="对接人" aria-describedby="basic-addon1" readonly>
					</div>
				  
				</div>
			  </div>
			  <div class="col-md-6">
			  	<div class="panel panel-info">
			  	<div class="panel-heading">(￣_,￣ )</div>				  
				    <div class="input-group">
					  <span class="input-group-addon" >进店时间</span>
					  <input type="text" class="form-control" id="basic-addon3" placeholder="进店时间" aria-describedby="basic-addon1" readonly>
					</div>
					<div class="input-group">
					  <span class="input-group-addon">模板选择</span>
					  <input type="text" class="form-control" id="basic-addon4" placeholder="模板选择" aria-describedby="basic-addon1" readonly>
					</div>				  
				</div>
			  </div>
			</div>
			
			<div class="row">
			  <div class="col-md-6">
			  	<div class="panel panel-info">
				  <div class="panel-heading">(￣_,￣ )</div>
				    <div class="input-group">
					  <span class="input-group-addon" >开始时间</span>
					  <input type="text" class="form-control" id="basic-addon5" placeholder="开始时间" aria-describedby="basic-addon1" readonly>
					</div>
					<div class="input-group">
					  <span class="input-group-addon" >结束时间</span>
					  <input type="text" class="form-control" id="basic-addon6" placeholder="结束时间" aria-describedby="basic-addon1" readonly>
					</div>				  
				</div>
			  </div>
			  <div class="col-md-6">
			  	<div class="panel panel-info">
				  <div class="panel-heading">(￣_,￣ )</div>
				    <div class="input-group">
					  <span class="input-group-addon" >顾问数量</span>
					  <input type="text" class="form-control" id="basic-addon7" placeholder="顾问数量" aria-describedby="basic-addon1" readonly>
					</div>
					<div class="input-group">
					  <span class="input-group-addon">顾客数量</span>
					  <input type="text" class="form-control" id="basic-addon8" placeholder="顾客数量" aria-describedby="basic-addon1" readonly>
					</div>				  
				</div>
			  </div>
			</div>
			<div class="panel panel-info">
				<div class="panel-heading">店铺环境(￣_,￣ )</div>		
					<textarea class="form-control" rows="3" name=textarea id="basic-addon9" readonly></textarea>				
			</div>
			</div>
			
			<div class="box" id="box">				     				   					     								 
			 <!-- <div class="panel panel-primary"><div class="panel-heading" role="tab" id="headingOne"><h4 class="panel-title"><a class="collapsed" role="button" data-toggle="collapse"  href="#collapseOne" aria-expanded="false" aria-controls="collapseOne">店外环境</a></h4></div><div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne"><div class="panel-body"><table id="dataTableTwo" class="table-bordered"  data-pagination="true"  data-toggle="table" data-striped=true data-show-header="false" data-url="answer/temAnswer.action"><thead><tr><th data-field="title"></th><th data-field="answerNum" data-formatter="answer_num"></th><th data-field="" data-formatter="show"></th></tr></thead></table></div></div></div> --> 
			</div>
			
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	      </div>
	    </div>
	    
	  </div>
	</div>
<!-- 模态框end -->
<!-- 详情模态框start -->
	<div class="modal fade" id="myModaltwo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-body">
	      	<div class="panel panel-primary">
		      <div class="panel-heading">说明</div>	        			
				<textarea class="form-control" rows="3" name=textarea id="answerDetail"></textarea>
		    </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	      </div>
	    </div>
	  </div>
	</div>
<!-- 详情模态框end -->	
		<div style="background-color: #ecf0f5;">
			<section class="content-header">
				<h1>
					答案信息 <small>ANSWER_LINE INFORMATION</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> 主页</a></li>
					<li><a href="#">督查管理</a></li>
					<li class="active">答案管理</li>
				</ol>
			</section>
			
		</div>
		<section class="content">
			<div class="box">
				<table id="dataTable" class="table-bordered"  data-pagination="true" data-search="true" data-toggle="table" 
				 data-striped=true data-show-columns="true" data-url="answer/selectAnswer.action">
				    <thead>
				        <tr>
				        	<th data-field="template_id" data-formatter="template">模板</th>
				            <th data-field="store_id">门店</th>
				            <th data-field="check_date">进店日期</th>
				            <th data-field="docking_man">对接人</th>
				            <th data-field="start_time">访问开始时间</th>
				            <th data-field="end_time">访问结束时间</th>
				        </tr>
				    </thead>
				</table>
			</div>
		</section>
		<!-- /.content-wrapper -->
		<footer class="main-footer">
			<div class="pull-right hidden-xs">
				<b>版本</b> 1.0.0
			</div>
			<strong>Copyright &copy; 2017-2022 <a
				href="http://www.jnhouse.com/" target="_blank">中住地产有限公司</a>.
			</strong> 版权所有.
		</footer>
		<div class="control-sidebar-bg"></div>
	
</body>
</html>
