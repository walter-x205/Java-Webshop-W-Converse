<!-- taglib SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>W-shop Admin</title>
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/admin/layout/add-css.jsp"></jsp:include>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">

		<!-- Navbar -->
		<jsp:include page="/WEB-INF/views/admin/layout/navbar.jsp"></jsp:include>
		<!-- /.navbar -->

		<!-- Main Sidebar Container -->
		<jsp:include page="/WEB-INF/views/admin/layout/sidebar.jsp"></jsp:include>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
		<c:if test="${sessionScope.admin != null }">
			<table class="table table-striped">
				<thead class="thead-dark">
					<tr>
						<th scope="col">ID</th>
						<th scope="col">Name</th>
						<th scope="col">Username</th>
						<th scope="col">Email</th>
						<th scope="col">Phone</th>
						<th scope="col">Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${aList}" var="o">
						<tr>
							<th scope="row">${o.id }</th>
							<td>${o.name }</td>
							<td>${o.username }</td>
							<td>${o.email }</td>
							<td>${o.phone }</td>
							<td><c:if test="${sessionScope.admin.owner == 1 }">
									<a href=""> <i class="fas fa-edit"></i></a>
									<a href="" style="color: red"> <i class="fas fa-trash-alt"></i></a>
								</c:if></td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
			<c:if test="${sessionScope.admin.owner == 1 }"><a href="${base }/add-admin" class="btn btn-primary btn-lg">Thêm admin</a></c:if>
		</c:if>
		</div>

		<!-- /.content-wrapper -->

		<!-- .footer -->
		<jsp:include page="/WEB-INF/views/admin/layout/footer.jsp"></jsp:include>
		<!-- /.footer -->

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Control sidebar content goes here -->
		</aside>
		<!-- /.control-sidebar -->
	</div>
	<!-- ./wrapper -->
	<jsp:include page="/WEB-INF/views/admin/layout/add-script.jsp"></jsp:include>
</body>
</html>
