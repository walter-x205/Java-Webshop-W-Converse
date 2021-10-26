<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>W-shop Admin</title>
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/admin/layout/add-css.jsp"></jsp:include>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

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
			<c:if test="${sessionScope.admin == null }">
				<div class="row justify-content-center">
					<div class="col-md-6 col-lg-4">
						<div class="login-wrap py-5">
							<div class="img d-flex align-items-center justify-content-center"
								style="background-image: url(../images/w.jpg);"></div>
							<h3 class="text-center mb-0">Welcome Administrator</h3>
							<p class="text-center">Please Sign-in</p>
							<p class="text-danger">${mess }</p>
							<sf:form action="${base}/ad-login" class="login-form"
								modelAttribute="admin-login">
								<div class="form-group">
									<div
										class="icon d-flex align-items-center justify-content-center">
										<span class="fa fa-user" style="margin-bottom: 10px;"></span>
									</div>
									<sf:input type="text" class="form-control"
										placeholder="Username" id="username" path="username"
										required="true"></sf:input>
								</div>
								<div class="form-group">
									<div
										class="icon d-flex align-items-center justify-content-center">
										<span class="fa fa-lock" style="margin-bottom: 10px;"></span>
									</div>
									<sf:input type="password" class="form-control" id="password"
										path="password" placeholder="Password" required="true"></sf:input>
								</div>
								<div class="form-group d-md-flex">
									<div class="w-100 text-md-right">
										
									</div>
								</div>
								<div class="form-group">
									<button type="submit"
										class="btn form-control btn-primary rounded submit px-3">Sign-in</button>
								</div>
							</sf:form>
							
						</div>
					</div>
				</div>
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
