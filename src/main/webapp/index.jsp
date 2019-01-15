<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <!--引入jQuery  -->
<script type="text/javascript" src="static/js/jquery-1.12.4.min.js"></script>

<!-- 引入bootstrap --> 
<link href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 新增员工模态框  -->
	<div class="modal fade" id="emp_add_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <!-- 标题信息 -->
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">新增员工</h4>
	      </div>
	      
	      <!-- 主题信息 -->
	      <div class="modal-body">
	      
	      	<!-- 表单 -->
	        <form class="form-horizontal">
	          <!-- 员工名字 -->
			  <div class="form-group">
			    <label class="col-sm-2 control-label">empName</label>
			    <div class="col-sm-10">
			      <!-- name为bean中的元素名字，传入参数时候名字为name中的名 -->
			      <input type="text" name="empName" class="form-control" id="input_emp_name" placeholder="empName">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  
			  <!-- 员工邮箱 -->
			  <div class="form-group">
			    <label class="col-sm-2 control-label">email</label>
			    <div class="col-sm-10">
			      <input type="text" name="email" class="form-control" id="input_email" placeholder="email">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  
			  <!-- 员工性别 -->
			  <div class="form-group">
			    <!-- radio 单选框 -->
			    <label class="col-sm-2 control-label">gender</label>
			    <div class="col-sm-10">
			      <label class="radio-inline">
					  <input type="radio" name="gender" id="gender1_add_input" value="M" checked="checked"> Male
				  </label>
				  <label class="radio-inline">
					  <input type="radio" name="gender" id="gender2_add_input" value="F"> Female
				  </label>
			    </div>
			  </div>
			  
			  <!-- 下拉框选择部门名字，提交部门id -->
			  <div class="form-group">
			    <label class="col-sm-2 control-label">deptName</label>
			    <div class="col-sm-4">
			    	<!-- 部门提交部门id即可 -->
			      <select class="form-control" name="dId" id="dept_id_select"></select>
			    </div>
			  </div>
			</form>
	      
	      </div>
	      
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button id="btn_add_emp_request" type="button" class="btn btn-primary">保存</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- 修改员工模态框  -->
	<div class="modal fade" id="emp_update_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <!-- 标题信息 -->
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">修改员工</h4>
	      </div>
	      
	      <!-- 主题信息 -->
	      <div class="modal-body">
	      
	      	<!-- 表单 -->
	        <form class="form-horizontal">
	          <!-- 员工名字 -->
			  <div class="form-group">
			    <label class="col-sm-2 control-label">empName</label>
			    <div class="col-sm-10">
			    	<!-- bootstrap表单中的静态控件 -->
			      <p class="form-control-static" id="emp_update_static"></p>
			    </div>
			  </div>
			  
			  <!-- 员工邮箱 -->
			  <div class="form-group">
			    <label class="col-sm-2 control-label">email</label>
			    <div class="col-sm-10">
			      <input type="text" name="email" class="form-control" id="input_update_email" placeholder="email">
			      <span class="help-block"></span>
			    </div>
			  </div>
			  
			  <!-- 员工性别 -->
			  <div class="form-group">
			    <!-- radio 单选框 -->
			    <label class="col-sm-2 control-label">gender</label>
			    <div class="col-sm-10">
			      <label class="radio-inline">
					  <input type="radio" name="gender" id="gender1_update_input" value="M" checked="checked"> Male
				  </label>
				  <label class="radio-inline">
					  <input type="radio" name="gender" id="gender2_update_input" value="F"> Female
				  </label>
			    </div>
			  </div>
			  
			  <!-- 下拉框选择部门名字，提交部门id -->
			  <div class="form-group">
			    <label class="col-sm-2 control-label">deptName</label>
			    <div class="col-sm-4">
			    	<!-- 部门提交部门id即可 -->
			      <select class="form-control" name="dId" id="dept_id_select_update"></select>
			    </div>
			  </div>
			</form>
	      
	      </div>
	      
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button id="btn_update_emp_request" type="button" class="btn btn-primary">更新</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<div class="container">
		<!--标题  -->
		<div class="row">
			<div class="col-lg-12">Employee_CRUD</div>
		</div>
		<!--按钮  -->
		<div class="row">
			<div class="col-lg-4 col-lg-offset-8">
				<button id="emp_add_button" class="btn btn-primary">新增</button>
				<button class="btn btn-danger">删除</button>
			</div>
		</div>
		<!--员工数据  -->
		<div class="row">
			<table id="emps_table" class="table table-hover">
				<thead>
					<tr>
						<th>#id</th>
						<th>empName</th>
						<th>email</th>
						<th>gender</th>
						<th>departmentName</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					
				</tbody>					
			</table>
		</div>
		<!--页面信息  -->
		<div class="row">
			<!--分页文字信息  -->
			<dir class="col-lg-6" id="pageinfo">
			</dir>
			<!--分页条信息  -->
			<dir class="col-lg-6" id="pagenav">
			</dir>
		</div>
	</div>	
	
	<script type="text/javascript">
		$(function(){
			to_page(1);
		});
		
		//清空表单
		function reset_form(ele)
		{
			//DOM函数清空表单数据
			$(ele)[0].reset();
			//清空表单样式
			$(ele).find("*").removeClass("has-error has-success");
			$(ele).find(".help-block").text("");
		}
		
		$("#emp_add_button").click(function(){
			//ajax没有reset函数，所以要用dom的reset方法
			//$("#emp_add_modal form")[0].reset();
			reset_form("#emp_add_modal form");
			$("#emp_add_modal").modal();
			getDepts("#dept_id_select");
		})
		
		$("#btn_add_emp_request").click(function(){
			if(false == validate_emp_info())
			{
				return false;
			}
			
			if($("#btn_add_emp_request").attr("emp_name_va") == "error")
			{
				console.log("emp_name_va error");
				return false;
			}
			else
			{
				console.log("emp_name_va success");
				//return false;
			}
			
			var empName = $("#input_emp_name").val();
			console.log(empName);
			
			var email = $("#input_email").val();
			console.log(email);
			
			if($("#gender1_add_input").attr("checked") == "checked")
			{
				var gender = "M";
			}
			else
			{
				var gender = "F";
			}
			console.log(gender);
			
			var dept_id = $("#dept_id_select").val();
			console.log(dept_id);
			
			var new_emp = $("#emp_add_modal form").serialize();
			console.log(new_emp);
			
			$.ajax({
				url:"emps",
				type:"POST",
				data:$("#emp_add_modal form").serialize(),
				success:function(result)
				{
					console.log(result.code);
					console.log("emp_add POST");
				}
			})
			
			$("#emp_add_modal").modal('hide');
		})
		
		$(document).on("click", ".edit_btn", function(){
			//alert("click edit btn");
			getDepts("#dept_id_select_update");
			getEmp($(this).attr("edit_id"));
			$("#emp_update_modal").modal();
		})
		
		function getEmp(id){
			$.ajax({
				url:"emp/"+id,
				type:"GET",
				success:function(result){
					//console.log(result);
					$("#emp_update_static").text(result.map.emp.empName);
					$("#input_update_email").val(result.map.emp.email);
					$("#emp_update_modal input[name=gender]").val([result.map.emp.gender]);
					$("#emp_update_modal select").val([result.map.emp.dId]);
				}
			});
		}
		
		/* change事件 */
		$("#input_emp_name").change(function(){
			var empName = this.value;
			$.ajax({
				url:"checkEmpName",
				data:"empName="+empName,
				type:"GET",
				success:function(result)
				{
					$("#input_emp_name").parent().removeClass("has-error has-success");
					$("#input_emp_name").next().text("");
					if(result.code == 100)
					{
						$("#input_emp_name").parent().addClass("has-success");
						$("#input_emp_name").next().text("用户名可用");
						$("#btn_add_emp_request").attr("emp_name_va", "success");
					}
					else
					{
						$("#input_emp_name").parent().addClass("has-error");
						$("#input_emp_name").next().text(result.message);
						$("#btn_add_emp_request").attr("emp_name_va", "error");
					}
				}
			})
		});
		
		function validate_emp_info()
		{
			var return_value = true;
			var name = $("#input_emp_name").val();
			//a-z A-Z 0-9和_- 6~16位 或者是 2~5位中文字符
			var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5}$)/;
			$("#input_emp_name").parent().removeClass("has-error has-success");
			$("#input_emp_name").next().text("");
			if(regName.test(name) == false)
			{
				$("#input_emp_name").parent().addClass("has-error");
				$("#input_emp_name").next().text("用户名格式错误：必须是6~16位的数字和英文或者2~5位的中文字符");		
				return_value = false;
			}
			else
			{
				$("#input_emp_name").parent().addClass("has-success");
			}
			
			var email = $("#input_email").val();
			var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			$("#input_email").parent().removeClass("has-error has-success");
			$("#input_email").next().text("");
			if(regEmail.test(email) == false)
			{
				$("#input_email").parent().addClass("has-error");
				$("#input_email").next().text("邮箱格式错误");			
				return_value = false;
			}
			else
			{
				$("#input_email").parent().addClass("has-success");
			}
			
			return return_value;
		}
		
		function getDepts(ele)
		{
			$(ele).empty();
			$.ajax({
				url:"depts",
				type:"GET",
				success:function(result)
				{
					//console.log(result);
					var depts = result.map.depts;
					$.each(depts,function(){
						//console.log(this);
						var optionEle = $("<option></option>").append(this.deptName).attr("value", this.deptId);
						$(ele).append(optionEle);
					})
				}
			})
		}
		
		function to_page(pn)
		{
			$.ajax({
				url:"emps",
				data:"pageNum="+pn,
				type:"GET",
				success:function(result){
					console.log(result);
					build_emps_table(result);
					build_page_info(result);
					buitd_page_nav(result);
				}
			});	
		}
		
		function buitd_page_nav(result)
		{
			$("#pagenav").empty();
			var ul = $("<ul></ul>").addClass("pagination");
			if(result.map.page.isFirstPage != true)
			{
				var firstPage = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
				firstPage.click(function(){
					to_page(1);
				});
				ul.append(firstPage);
			}
			
			if(result.map.page.hasPreviousPage == true)
			{
				var prevPge = $("<li></li>").append($("<a></a>").append("&laquo;").attr("href", "#"));
				prevPge.click(function(){
					to_page(result.map.page.pageNum - 1);
				});
				ul.append(prevPge);
			}
			
			$.each(result.map.page.navigatepageNums, function(index, item){
				var pageli = $("<li></li>").append($("<a></a>").append(item).attr("href", "#"));
				if(item == result.map.page.pageNum)
				{
					pageli.addClass("active");
				}
				pageli.click(function(){
					to_page(item);
				});
				ul.append(pageli);
			})
			if(result.map.page.hasNextPage == true)
			{
				var nextPge = $("<li></li>").append($("<a></a>").append("&raquo;").attr("href", "#"));
				nextPge.click(function(){
					to_page(result.map.page.pageNum + 1);
				});
				ul.append(nextPge);
			}
			
			if(result.map.page.isLastPage != true)
			{
				var lastPage = $("<li></li>").append($("<a></a>").append("末页").attr("href", "#"));
				lastPage.click(function(){
					to_page(result.map.page.pages);
				});
				ul.append(lastPage); 
			}
			
			ul.appendTo("#pagenav"); 
		}
		
		function build_page_info(result)
		{
			$("#pageinfo").empty();
			$("#pageinfo").append("当前第 " + result.map.page.pageNum +
					" 页  总共 " + result.map.page.pages +
					" 页 总共 " + result.map.page.total + " 条记录");
		}
		
		function build_emps_table(result)
		{
			$("#emps_table tbody").empty();
			//console.log("build_emps_table");
			var emps = result.map.page.list;
			$.each(emps, function(index, item)
			{
				var empIdTd = $("<td></td>").append(item.empId);
				//console.log(item.empId);
				var empNameTd = $("<td></td>").append(item.empName);
				//console.log(item.empName);
				var emailTd = $("<td></td>").append(item.email);
				//console.log(item.email);
				var gender = item.gender=="M"?"男":"女";
				var genderTd = $("<td></td>").append(gender);
				//console.log(gender);
				var departmentNameTd = $("<td></td>").append(item.dept.deptName);
				//console.log(item.dept.deptName);
				
				var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn").append("编辑");
				editBtn.attr("edit_id", item.empId);
				var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm").append("删除");
				
				var BtnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
				$("<tr></tr>").append(empIdTd)
				.append(empNameTd)
				.append(emailTd)
				.append(genderTd)
				.append(departmentNameTd)
				.append(BtnTd)
				.appendTo("#emps_table tbody");
			})
		}
		
	</script>
</body>
</html>


