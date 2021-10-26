<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>W Shop Converse</title>
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.servletContext.contextPath}/lib/bootstrap4/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.servletContext.contextPath}/css/item-detail.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/customer/layout/header-2.jsp"></jsp:include>
	<div class="content">
		<div class="gender">
			<p>Giỏ hàng</p>
			<p style="font-size: 30px;" class="text-danger">${mess }</p>
		</div>
		<div class="page">
			<div class="navi hr-col">
				<hr>
			</div>

			<div class="navi hr-col">
				<hr>
			</div>
		</div>
		<div style="padding: 50px 100px;">

			<table class="table table-striped">
				<thead class="thead-dark">
					<tr>
						<th></th>
						<th scope="col" style="text-align: center;">Sản phẩm</th>
						<th scope="col" style="width: 200px; text-align: center;">Đơn
							giá</th>
						<th scope="col" style="width: 150px; text-align: center;">Số
							lượng</th>
						<th scope="col" style="width: 200px; text-align: center;">Thành
							tiền</th>
						<th scope="col" style="width: 200px;"></th>

					</tr>
				</thead>
				<tbody>
					<c:forEach items="${cart.item }" var="o" varStatus="loop">
						<tr style="text-align: center;">
							<td><img alt="pd" src="../images/${o.product.imgIcon }"
								width="100px"></td>
							<td>${o.product.name}</td>
							<td>${o.product.currencyFormat(o.price) }</td>
							<td><div class="input-group input-group-sm mb-3">
									<div class="input-group-prepend">
										<button type="button" class="btn btn-info btn-sm"
											onClick="increase(${o.product.id});">
											<i class="fas fa-plus"></i>
										</button>
									</div>
									<input type="text" class="form-control quantityOfItem" aria-label="Small"
										aria-describedby="inputGroup-sizing-sm" value="${o.quantity }"
										style="text-align: center;">
									<div class="input-group-append">

										<button type="button" class="btn btn-info btn-sm"
											<c:if test="${o.quantity < 2}">disabled</c:if>
											onClick="decrease(${o.product.id});">
											<i class="fas fa-minus"></i>
										</button>

									</div>
								</div></td>
							<td>${o.product.currencyFormat(o.price*o.quantity) }</td>
							<td><button onClick="deleteCart(${o.product.id});"
									class="btn btn-outline-danger btn-sm">
									<i class="fas fa-times"></i>
								</button></td>
						</tr>
					</c:forEach>
				<thead class="thead-dark">
					<th colspan="4" style="text-align: right;">Tổng tiền:</th>
					<th style="text-align: center;">${cart.currency(cart.total)}</th>
					<th style="text-align: center;"><c:if
							test="${sessionScope.account != null }">
							<a href="${base }/payment" class="btn btn btn-success">Thanh
								toán</a>
						</c:if> <c:if test="${sessionScope.account == null }">
							<button data-toggle="modal" data-target="#fastLogin"
								class="btn btn btn-success">Thanh toán</button>
						</c:if></th>
				</thead>
				</tbody>
			</table>
		</div>
		<!-- Modal -->
		<div class="modal fade" id="fastLogin" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLongTitle">Đăng nhập
							nhanh</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<p class="text-center">Bạn cần đăng nhập trước khi thanh toán</p>
						<sf:form action="${base }/fast-login" class="login-form" modelAttribute="fast-login">
							<div class="form-group">
								<div
									class="icon d-flex align-items-center justify-content-center">
									<span class="fa fa-user" style="margin-bottom: 10px;"></span>
								</div>
								<sf:input type="text" class="form-control" placeholder="Username" path="username"
									id="username" required="true"></sf:input>
							</div>
							<div class="form-group">
								<div
									class="icon d-flex align-items-center justify-content-center">
									<span class="fa fa-lock" style="margin-bottom: 10px;"></span>
								</div>
								<sf:input type="password" class="form-control" id="password" path="password"
									placeholder="Password" required="true"></sf:input>
							</div>
							<div class="form-group d-md-flex">
								<div class="w-100 text-md-right"></div>
							</div>
							<div class="form-group">
								<button type="submit"
									class="btn form-control btn-primary rounded submit px-3">Đăng
									nhập</button>
							</div>
						</sf:form>
						<div class="w-100 text-center mt-4 text">
							<p class="mb-0">Bạn chưa có tài khoản?</p>
							<a href="${base }/sign-up-form">Đăng kí</a>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>
</body>
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath}/lib/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath}/lib/bootstrap4/popper.min.js"></script>
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath}/lib/bootstrap4/bootstrap.min.js"></script>
<script type="text/javascript"
	src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript"
	src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath}/js/menu-detail.js"></script>
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath}/js/cart.js"></script>
</html>