<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>W Shop Converse</title>
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/lib/bootstrap4/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/item-detail.css">
</head>
<body>
	<div class="header">
		<div class="logo">
			<p>
				<a href="${base }/homepage">W Shop <i class="fas fa-star-and-crescent"></i></a>
			</p>
		</div>
		<div class="menu" id="myMenu">
			<ul>
				<li><a href="${base }/menu-detail?cate=men" id="men">Men</a>
					<div class="sub-block">
						<ul>
							<li><a href=""> <img src="../images/me-sne.png" alt=""> <span>Sneakers</span>
							</a></li>
							<li><a href=""> <img src="../images/me-app.png" alt=""> <span>Apparel</span>
							</a></li>
							<li><a href=""> <img src="../images/me-acc.png" alt=""> <span>Accesories</span>
							</a></li>
							<li><a href=""> <img src="../images/nav-thumb-04.png" alt=""><br> <span>New</span>
							</a></li>
							<li><a href=""> <img src="../images/nav-thumb-05.png" alt=""><br> <span>Sale</span>
							</a></li>
						</ul>
					</div></li>
				<li><a href="${base }/menu-detail?cate=women" id="women">Women</a>
					<div class="sub-block">
						<ul>
							<li><a href=""> <img src="../images/wo-sne.png" alt=""> <span>Sneakers</span>
							</a></li>
							<li><a href=""> <img src="../images/wo-app.png" alt=""> <span>Apparel</span>
							</a></li>
							<li><a href=""> <img src="../images/wo-acc.png" alt=""> <span>Accesories</span>
							</a></li>
							<li><a href=""> <img src="../images/nav-thumb-04.png" alt=""><br> <span>New</span>
							</a></li>
							<li><a href=""> <img src="../images/nav-thumb-05.png" alt=""><br> <span>Sale</span>
							</a></li>
						</ul>
					</div></li>
				<li><a href="${base }/menu-detail?cate=kid" id="kid">Kid</a>
					<div class="sub-block">
						<ul>
							<li><a href=""> <img src="../images/kids-sneak.png" alt=""> <span>Sneakers</span>
							</a></li>
							<li><a href=""> <img src="../images/kids-app.png" alt=""> <span>Apparel</span>
							</a></li>
							<li><a href=""> <img src="../images/kids-acc.png" alt=""> <span>Accesories</span>
							</a></li>
							<li><a href=""> <img src="../images/nav-thumb-04.png" alt=""><br> <span>New</span>
							</a></li>
							<li><a href=""> <img src="../images/nav-thumb-05.png" alt=""><br> <span>Sale</span>
							</a></li>
						</ul>
					</div></li>
				<li><a href="">Stores</a></li>
			</ul>
			<div class="search-bar">
				<form class="form-inline my-2 my-lg-0" action="${base }/search">
					<input name="search" class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
					<button class="btn" type="submit">
						<i class="fas fa-search"></i>
					</button>
				</form>
			</div>
			<c:if test="${sessionScope.account == null }">
				<div class="user">
					<a href="${base }/login-form" class="btn btn-dark" style="background-color: black;"><i class="fas fa-user"> </i> Đăng nhập</a>
				</div>
			</c:if>
			<c:if test="${sessionScope.account != null }">
				<div class="user">
					<!-- <div class="log"> -->
					<button class="btn btn-dark dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
						style="background-color: black;">
						<img id="u-avatar" alt="user-avatar" src="../images/banner.jpg"
							style="object-fit: cover; border-radius: 50%; width: 25px; height: 25px; margin-right: 5px; border: 1px solid white;"> <b>
							${sessionScope.account.name } </b>
					</button>
					<div class="dropdown-menu" aria-labelledby="dropdownMenu2">
						<a class="dropdown-item">Thông tin tài khoản</a> <a class="dropdown-item" href="${base }/logout">Đăng xuất</a>
					</div>
					<!-- </div> -->
					<div class="cart">
						<a href="${base }/cart"><i class="fas fa-shopping-cart"></i></a>
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
					<button type="button" class="btn btn-secondary" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<i class="fas fa-bars"></i>
					</button>
					<div class="dropdown-menu dropdown-menu-right">
						<div class="alt-search">
							<form class="form-search">
								<input class="form-control" type="search" placeholder="Search" aria-label="Search">
								<button class="btn" type="submit">
									<i class="fas fa-search"></i>
								</button>
							</form>
						</div>
						<div class="list-group">
							<button type="button" class="list-group-item list-group-item-action">
								<a href="">Men</a>
							</button>
							<button type="button" class="list-group-item list-group-item-action">
								<a href="">Women</a>
							</button>
							<button type="button" class="list-group-item list-group-item-action">
								<a href="">Kids</a>
							</button>
							<button type="button" class="list-group-item list-group-item-action">
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
			<p>Thanh toán</p>
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
			<form action="${base }/COD">
				<div class="form-group">
					<label for="formGroupExampleInput"><b>Khách hàng</b></label> <input type="text" class="form-control" placeholder="" readonly="true"
						value="${sessionScope.account.name }"></input>
				</div>
				<div class="form-group">
					<label for="formGroupExampleInput"><b>Tổng thanh toán</b></label> <input type="text" class="form-control" name="price" placeholder=""
						readonly="true" value="${cart.currency(cart.total)}"></input>
				</div>
				<div class="form-group">
					<label for="inputState">Hình thức thanh toán</label>
					<!-- <select
						name="pay-type" class="form-control">
						<option selected>Thanh toán khi nhận hàng</option>
						<option>Thanh toán online</option>
					</select> -->
					<div class="form-check">
						<input class="form-check-input" type="radio" name="pay-type" id="exampleRadios1" value="Thanh toán khi nhận hàng" checked> <label
							class="form-check-label" for="exampleRadios1"> Thanh toán khi nhận hàng </label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="radio" name="pay-type" id="exampleRadios2" value="Thanh toán online"> <label
							class="form-check-label" for="exampleRadios2"> Thanh toán qua ví <img alt="" src="${base }/images/logo-zalopay.svg">
						</label>
					</div>
				</div>
				<div class="form-group">
					<label for="formGroupExampleInput"><b>Tên người nhận hàng (*)</b> </label> <input name="receiver-name" type="text" class="form-control"
						placeholder="" required="true"></input>
				</div>
				<div class="form-group">
					<label for="formGroupExampleInput"><b>Số điện thoại nhận hàng (*)</b> </label> <input name="receiver-phone" type="text" class="form-control"
						placeholder="" required="true"></input>
				</div>
				<div class="form-group">
					<label for="formGroupExampleInput"><b>Địa chỉ nhận hàng (*)</b></label> <input name="receiver-address" type="text" class="form-control"
						placeholder="" required="true"></input>
				</div>
				<div style="text-align: center;">
					<button class="btn btn-info" type="submit">Thanh toán</button>
				</div>

			</form>
		</div>

	</div>
	<jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>
</body>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/lib/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/lib/bootstrap4/popper.min.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/lib/bootstrap4/bootstrap.min.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/menu-detail.js"></script>
</html>