<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
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
			<p>Sản phẩm</p>
		</div>
		<div class="page">
			<div class="navi hr-col">
				<hr>
			</div>

			<div class="navi hr-col">
				<hr>
			</div>
		</div>
		<div class="item">
			<div class="item-name">
				<h1>${detail.name }</h1>
			</div>
			<div class="info-box">
				<div class="info-left">
					<h4>
						SKU: <span id="SKU">${detail.sku }</span>
					</h4>
					<p>Chất liệu: ${detail.material }</p>
					<p>Loại mặt hàng: ${detail.category }</p>
				</div>
				<div class="info-right">
					<p>
						VND <span>${detail.currencyFormat(detail.price)}</span>
					</p>
					<button class="btn btn-outline-dark" onClick="addToCart(${detail.id});">Thêm vào giỏ <i class="fas fa-cart-plus"></i></button>
				</div>
			</div>
			<div class="img-slider">
				<div id="carouselExampleControls" class="carousel slide"
					data-ride="carousel">
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img class="d-block w-100" src="../images/${detail.imgIcon }"
								alt="First slide">
						</div>
						<!-- <div class="carousel-item">
                        <img class="d-block w-100" src="../images/pd-pic-2.jpg" alt="Second slide">
                      </div>
                      <div class="carousel-item">
                        <img class="d-block w-100" src="../images/pd-pic-3.jpg" alt="Third slide">
                      </div>
                      <div class="carousel-item">
                        <img class="d-block w-100" src="../images/pd-pic-4.jpg" alt="Fourth slide">
                      </div>
                      <div class="carousel-item">
                        <img class="d-block w-100" src="../images/pd-pic-5.jpg" alt="Fifth slide">
                      </div>
                      <div class="carousel-item">
                        <img class="d-block w-100" src="../images/pd-pic-6.jpg" alt="Sixth slide">
                      </div>
                      <div class="carousel-item">
                        <img class="d-block w-100" src="../images/pd-pic-7.jpg" alt="Seventh slide">
                      </div>
                      <div class="carousel-item">
                        <img class="d-block w-100" src="../images/pd-pic-8.jpg" alt="Eighth slide">
                      </div> -->
					</div>
					<a class="carousel-control-prev" href="#carouselExampleControls"
						role="button" data-slide="prev"> <span
						class="carousel-control-prev-icon" aria-hidden="true"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="carousel-control-next" href="#carouselExampleControls"
						role="button" data-slide="next"> <span
						class="carousel-control-next-icon" aria-hidden="true"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>
			</div>
			<div class="description">
				<div class="pd-logo">
					<img src="../images/bage-icon.png" alt="">
				</div>
				<div class="pd-des">
					<!-- <p>Color: Black / White</p> -->
					<p>Size: 3.5US-10US</p>
				</div>
				<div class="size">
					<p>Size</p>
					<img src="../images/offical-size.png" alt="">
				</div>
			</div>
		</div>
		<div class="other">
			<div class="like">
				<hr>
				<p>You might like</p>
				<hr>
			</div>
			<div class="suggest">
				<c:if test="${detail.category == 'Men-Sneaker'}">
					<c:forEach items="${rmsList }" var="r">
						<div class="item-s">
							<a href="${base }/item-detail?id=${r.id}"> <img
								src="../images/${r.imgIcon }" alt="">
								<h3>${r.name }</h3>
								<h4># ${r.sku }</h4> <span>VND ${r.currencyFormat(r.price) }</span>
							</a>
						</div>
					</c:forEach>
				</c:if>
				<c:if test="${detail.category == 'Women-Sneaker'}">
					<c:forEach items="${rwsList }" var="r">
						<div class="item-s">
							<a href="${base }/item-detail?id=${r.id}"> <img
								src="../images/${r.imgIcon }" alt="">
								<h3>${r.name }</h3>
								<h4># ${r.sku }</h4> <span>VND ${r.currencyFormat(r.price) }</span>
							</a>
						</div>
					</c:forEach>
				</c:if>
				<c:if test="${detail.category == 'Kid-Sneaker'}">
					<c:forEach items="${rksList }" var="r">
						<div class="item-s">
							<a href="${base }/item-detail?id=${r.id}"> <img
								src="../images/${r.imgIcon }" alt="">
								<h3>${r.name }</h3>
								<h4># ${r.sku }</h4> <span>VND ${r.currencyFormat(r.price) }</span>
							</a>
						</div>
					</c:forEach>
				</c:if>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/customer/layout/chat.jsp"></jsp:include>
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