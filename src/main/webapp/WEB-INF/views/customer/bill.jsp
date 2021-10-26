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
	<div class="header">
		<div class="logo">
			<p>
				<a href="${base }/homepage">W Shop <i
					class="fas fa-star-and-crescent"></i></a>
			</p>
		</div>
		<div class="menu" id="myMenu">
			<ul>
				<li><a href="${base }/menu-detail?cate=men" id="men">Men</a>
					<div class="sub-block">
						<ul>
							<li><a href=""> <img src="../images/me-sne.png" alt="">
									<span>Sneakers</span>
							</a></li>
							<li><a href=""> <img src="../images/me-app.png" alt="">
									<span>Apparel</span>
							</a></li>
							<li><a href=""> <img src="../images/me-acc.png" alt="">
									<span>Accesories</span>
							</a></li>
							<li><a href=""> <img src="../images/nav-thumb-04.png"
									alt=""><br> <span>New</span>
							</a></li>
							<li><a href=""> <img src="../images/nav-thumb-05.png"
									alt=""><br> <span>Sale</span>
							</a></li>
						</ul>
					</div></li>
				<li><a href="${base }/menu-detail?cate=women" id="women">Women</a>
					<div class="sub-block">
						<ul>
							<li><a href=""> <img src="../images/wo-sne.png" alt="">
									<span>Sneakers</span>
							</a></li>
							<li><a href=""> <img src="../images/wo-app.png" alt="">
									<span>Apparel</span>
							</a></li>
							<li><a href=""> <img src="../images/wo-acc.png" alt="">
									<span>Accesories</span>
							</a></li>
							<li><a href=""> <img src="../images/nav-thumb-04.png"
									alt=""><br> <span>New</span>
							</a></li>
							<li><a href=""> <img src="../images/nav-thumb-05.png"
									alt=""><br> <span>Sale</span>
							</a></li>
						</ul>
					</div></li>
				<li><a href="${base }/menu-detail?cate=kid" id="kid">Kid</a>
					<div class="sub-block">
						<ul>
							<li><a href=""> <img src="../images/kids-sneak.png"
									alt=""> <span>Sneakers</span>
							</a></li>
							<li><a href=""> <img src="../images/kids-app.png" alt="">
									<span>Apparel</span>
							</a></li>
							<li><a href=""> <img src="../images/kids-acc.png" alt="">
									<span>Accesories</span>
							</a></li>
							<li><a href=""> <img src="../images/nav-thumb-04.png"
									alt=""><br> <span>New</span>
							</a></li>
							<li><a href=""> <img src="../images/nav-thumb-05.png"
									alt=""><br> <span>Sale</span>
							</a></li>
						</ul>
					</div></li>
				<li><a href="">Stores</a></li>
			</ul>
			<div class="search-bar">
				<form class="form-inline my-2 my-lg-0" action="${base }/search">
					<input name="search" class="form-control mr-sm-2" type="search"
						placeholder="Search" aria-label="Search">
					<button class="btn" type="submit">
						<i class="fas fa-search"></i>
					</button>
				</form>
			</div>
			<c:if test="${sessionScope.account == null }">
				<div class="user">
					<a href="${base }/login-form" class="btn btn-dark"
						style="background-color: black;"><i class="fas fa-user"> </i>
						Đăng nhập</a>
				</div>
			</c:if>
			<c:if test="${sessionScope.account != null }">
				<div class="user">
					<!-- <div class="log"> -->
					<button class="btn btn-dark dropdown-toggle" type="button"
						id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false" style="background-color: black;">
						<img id="u-avatar" alt="user-avatar" src="../images/banner.jpg"
							style="object-fit: cover; border-radius: 50%; width: 25px; height: 25px; margin-right: 5px; border: 1px solid white;">
						<b> ${sessionScope.account.name } </b>
					</button>
					<div class="dropdown-menu" aria-labelledby="dropdownMenu2">
						<a class="dropdown-item">Thông tin tài khoản</a> <a
							class="dropdown-item" href="${base }/logout">Đăng xuất</a>
					</div>
					<!-- </div> -->
					<div class="cart">
						<a href="${base }/cart" class="btn btn-dark"> <i
							class="fas fa-shopping-cart"></i> <span class="badge badge-light">
								<c:if test="${sessionScope.cart == null}"> 0</c:if> <c:if
									test="${sessionScope.cart != null}">${sessionScope.cart.item.size() }</c:if>
						</span>
						</a>
					</div>
				</div>
			</c:if>
		</div>
		<div class="alt-menu">
			<div class="logo-hide">
				<p>
					W Shop <i class="fas fa-star-and-crescent"></i>
				</p>
			</div>
			<div class="user-hide">
				<div class="log-hide">
					<a href=""><i class="fas fa-user"></i></a>
				</div>
				<div class="cart-hide">
					<a href=""><i class="fas fa-shopping-cart"></i></a>
				</div>
			</div>
			<div class="menu-hide">
				<div class="btn-group">
					<button type="button" class="btn btn-secondary"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<i class="fas fa-bars"></i>
					</button>
					<div class="dropdown-menu dropdown-menu-right">
						<div class="alt-search">
							<form class="form-search">
								<input class="form-control" type="search" placeholder="Search"
									aria-label="Search">
								<button class="btn" type="submit">
									<i class="fas fa-search"></i>
								</button>
							</form>
						</div>
						<div class="list-group">
							<button type="button"
								class="list-group-item list-group-item-action">
								<a href="">Men</a>
							</button>
							<button type="button"
								class="list-group-item list-group-item-action">
								<a href="">Women</a>
							</button>
							<button type="button"
								class="list-group-item list-group-item-action">
								<a href="">Kids</a>
							</button>
							<button type="button"
								class="list-group-item list-group-item-action">
								<a href="">Stores</a>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="content">
		<div class="gender">
			<p>Đơn hàng</p>
		</div>
		<div class="page">
			<div class="navi hr-col">
				<hr>
			</div>

			<div class="navi hr-col">
				<hr>
			</div>
		</div>
		<div style="padding: 50px 400px;">
			<table class="table">
				<tr>
					<td style="width: 180px">Mã đơn hàng:</td>
					<td>${show.id}</td>
				</tr>
				<tr>
					<td>Mã khách hàng:</td>
					<td>${show.customerId}</td>
				</tr>
				<tr>
					<td>Hình thức thanh toán:</td>
					<td>${show.payment}</td>
				</tr>
				<tr>
					<td>Người nhận:</td>
					<td>${show.paymentName}</td>
				</tr>
				<tr>
					<td>Số điện thoại nhận hàng:</td>
					<td>${show.paymentPhone}</td>
				</tr>
				<tr>
					<td>Địa chỉ nhận hàng:</td>
					<td>${show.paymentAddress}</td>
				</tr>

				<tr>
					<td>Thông tin đơn hàng:</td>
					<td><c:forEach items="${show.showOrders}" var="s">${s} <br>
						</c:forEach></td>
				</tr>


				<tr>
					<td>Tổng hóa đơn:</td>
					<td>${show.currency(show.amount)}VND</td>
				</tr>
				<tr>
					<td>Trạng thái:</td>
					<td><c:if test="${show.status == 0 }">Đang giao hàng</c:if> <c:if
							test="${show.status == 1 }">Đã giao hàng</c:if></td>
				</tr>
			</table>
			
		</div>
		<div style="text-align: center;">
			<a href="${base }/homepage" class="btn btn-success">Về trang chủ</a>
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
</html>