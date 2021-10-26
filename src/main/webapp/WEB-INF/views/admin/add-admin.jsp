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
			<sf:form action="${base }/add-admin" modelAttribute="adminModel">
				<div>
					<h1>Thêm Admin</h1>
				</div>
				<div>
					<p>${dataSubmit}</p>
				</div>
				<div class="form-group">
					<label for="formGroupExampleInput">Avatar</label>
					<div>
						<input type='file' id="imgInp" /> <img id="blah" src="#"
							alt="your image" width="100px" />
					</div>

				</div>
				<div class="form-group">
					<label for="formGroupExampleInput">Tên admin</label>
					<sf:input type="text" class="form-control" id="name"
						placeholder="Name" path="name"></sf:input>
				</div>
				<div class="form-group">
					<label for="formGroupExampleInput2">Username</label>
					<sf:input type="text" class="form-control" id="username"
						placeholder="Username" path="username"></sf:input>
				</div>
				<div class="form-group">
					<label for="formGroupExampleInput2">Password</label>
					<sf:input type="text" class="form-control" id="password"
						placeholder="Password" path="password"></sf:input>
				</div>
				<div class="form-group">
					<label for="inputState">Tài khoản chủ</label> <select id="owner"
						class="form-control">
						<option selected>0</option>
						<option>1</option>
					</select>
				</div>

				<div class="form-group">
					<label for="formGroupExampleInput2">Email</label>
					<sf:input type="text" class="form-control" id="email"
						placeholder="Email" path="email"></sf:input>
				</div>
				<div class="form-group">
					<label for="formGroupExampleInput2">Phone</label>
					<sf:input type="text" class="form-control" id="phone"
						placeholder="Phone" path="phone"></sf:input>
				</div>
				<button type="button" class="btn btn-primary"
					onClick="addAdmin('${base}');">Thêm</button>
				<button type="button" class="btn btn-light"
					onClick="window.location.reload();">Hủy</button>
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
