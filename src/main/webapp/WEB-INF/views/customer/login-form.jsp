<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!doctype html>
<html lang="en">
<head>
<title>W-Shop Sign-in</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="css/style.css">

</head>
<body>
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 col-lg-4">
					<div class="login-wrap py-5">
						<div class="img d-flex align-items-center justify-content-center"
							style="background-image: url(../images/w.jpg);"></div>
						<h3 class="text-center mb-0">Welcome to W-Shop</h3>
						<p class="text-center">Điền thông tin đăng nhập vào bên dưới nhé</p>
						<p class="text-danger">${mess }</p>
						<sf:form action="${base}/login" class="login-form" modelAttribute="login">
							<div class="form-group">
								<div
									class="icon d-flex align-items-center justify-content-center">
									<span class="fa fa-user"></span>
								</div>
								<sf:input type="text" class="form-control" placeholder="Username" id="username" path="username"
									required="true"></sf:input>
							</div>
							<div class="form-group">
								<div
									class="icon d-flex align-items-center justify-content-center">
									<span class="fa fa-lock"></span>
								</div>
								<sf:input type="password" class="form-control" id="password" path="password"
									placeholder="Password" required="true"></sf:input>
							</div>
							<div class="form-group d-md-flex">
								<div class="w-100 text-md-right">
									<a href="#">Quên mật khẩu</a>
								</div>
							</div>
							<div class="form-group">
								<button type="submit"
									class="btn form-control btn-primary rounded submit px-3">Đăng nhập</button>
							</div>
						</sf:form>
						<div class="w-100 text-center mt-4 text">
							<p class="mb-0">Bạn chưa có tài khoản?</p>
							<a href="${base }/sign-up-form">Đăng kí ngay</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<script type="text/javascript" src="${base}/lib/jquery.min.js"></script>
	<script type="text/javascript"
		src="${base}/lib/bootstrap4/popper.min.js"></script>
	<script type="text/javascript"
		src="${base}/lib/bootstrap4/bootstrap.min.js"></script>
	<script src="js/main.js"></script>

</body>
</html>

