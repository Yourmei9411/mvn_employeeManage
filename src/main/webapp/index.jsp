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

	<div class="container">
		<!--标题  -->
		<div class="row">
			<div class="col-lg-12">Employee_CRUD</div>
		</div>
		<!--按钮  -->
		<div class="row">
			<div class="col-lg-4 col-lg-offset-8">
				<button class="btn btn-primary">新增</button>
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
				
				var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm").append("编辑");
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


