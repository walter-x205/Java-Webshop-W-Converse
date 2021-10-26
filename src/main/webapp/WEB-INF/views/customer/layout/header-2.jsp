<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
			<div class="user">
				<c:if test="${sessionScope.account == null }">
					<a href="${base }/login-form" class="btn btn-dark"
						style="background-color: black;"><i class="fas fa-user"> </i>
						Đăng nhập</a>
				</c:if>
				<c:if test="${sessionScope.account != null }">
					<button class="btn btn-dark dropdown-toggle" type="button"
						id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false" style="background-color: black;">
						<img id="u-avatar" alt="user-avatar" src="../images/banner.jpg"
							style="object-fit: cover; border-radius: 50%; width: 25px; height: 25px; margin-right: 5px; border: 1px solid white;">
						<b> ${sessionScope.account.name } </b>
					</button>
					<div class="dropdown-menu" aria-labelledby="dropdownMenu2">
						<a class="dropdown-item" href="${base }/logout"
							style="color: black;">Thông tin tài khoản</a> <a
							class="dropdown-item" href="${base }/logout"
							style="color: black;">Đăng xuất</a>
					</div>
				</c:if>
				<div class="cart">
					<a href="${base }/cart" class="btn btn-dark"> <i
						class="fas fa-shopping-cart"></i> <span id="itemInCart" class="badge badge-light">
							<c:if test="${sessionScope.cart == null}"> 0</c:if> <c:if
								test="${sessionScope.cart != null}">${cart.tic }</c:if>
					</span>
					</a>
				</div>
			</div>
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
		<div class="banner">
            <img width="100%" src="../images/renew-banner.jpg" alt="W Shop">
        </div>
	</div>
</body>
</html>