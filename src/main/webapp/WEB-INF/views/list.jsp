<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

 <!--引入jQuery  -->
<script type="text/javascript" src="static/js/jquery-1.12.4.min.js"></script>
 
<!-- 引入bootstrap --> 
<link href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

<title>员工列表</title>
</head>
<body>
	<h4>员工信息表</h4>
	
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
			<table class="table table-hover">
				<tr>
					<th>#id</th>
					<th>empName</th>
					<th>email</th>
					<th>gender</th>
					<th>departmentName</th>
					<th>操作</th>
				</tr>
					<c:forEach items="${page.list}" var="emp">
						<tr>
							<th>${emp.empId}</th>
							<th>${emp.empName}</th>
							<th>${emp.email}</th>
							<th>${emp.gender=='M'?"男":"女"}</th>
							<th>${emp.dept.deptName}</th>
							<th>
								<button class="btn btn-primary btn-sm">编辑</button>
								<button class="btn btn-primary btn-sm">删除</button>
							</th>
						</tr>
					</c:forEach> 
			</table>
		</div>
		<!--页面信息  -->
		<div class="row">
			<!--分页文字信息  -->
			<dir class="col-lg-6">
				当前页数：xxx
			</dir>
			<!--分页条信息  -->
			<dir class="col-lg-6">
				<nav aria-label="Page navigation">
				  <ul class="pagination">
				  	<li>
				  		<a href="#">首页</a>
				  	</li>
				    <li>
				      <a href="#" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
				    <li><a href="#">1</a></li>
				    <li><a href="#">2</a></li>
				    <li><a href="#">3</a></li>
				    <li><a href="#">4</a></li>
				    <li><a href="#">5</a></li>
				    <li>
				      <a href="#" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
				    <li>
				  		<a href="#">末页</a>
				  	</li>
				  </ul>
				</nav>
			</dir>
		</div>
	</div>	
	
</body>
</html>