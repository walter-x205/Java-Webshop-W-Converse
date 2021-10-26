<!-- taglib SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
			<sf:form action="" modelAttribute="detail">
				<div>
					<h1>Chỉnh sửa thông tin User</h1>
				</div>
				<div class="form-group">
					<label for="formGroupExampleInput">ID User</label>
					<sf:input type="text" readonly="true" class="form-control" id="id"
						placeholder="0" path="id"></sf:input>
				</div>
				<div class="form-group">
					<label for="formGroupExampleInput">Tên User</label>
					<sf:input type="text" required="true" class="form-control" id="name"
						placeholder="VD: Nguyễn Văn A" path="name"></sf:input>
				</div>
				<div class="form-group">
					<label for="formGroupExampleInput2">Username</label>
					<sf:input type="text" readonly="true" class="form-control" id="username"
						placeholder="VD: abc" path="username"></sf:input>
				</div>
				<div class="form-group">
					<label for="formGroupExampleInput2">Password</label>
					<sf:input type="text" required="true" class="form-control" id="password"
						placeholder="VD: Không gồm kí tự đặc biệt" path="password"></sf:input>
				</div>
				<div class="form-group">
					<label for="formGroupExampleInput2">Email</label>
					<sf:input type="email" required="true" class="form-control"
						id="email" placeholder="VD: abc@gmail.com" path="email"></sf:input>
				</div>
				<div class="form-group">
					<label for="formGroupExampleInput2">Số điện thoại</label>
					<sf:input type="text" class="form-control" id="phone"
						placeholder="VD: 0123456789" path="phone"></sf:input>
				</div>
				<button type="button" class="btn btn-primary" onClick="editUser('${base}');">Edit</button>
			</sf:form>
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
<script type="text/javascript" src="${base}/js/account.js"></script>
</html>
