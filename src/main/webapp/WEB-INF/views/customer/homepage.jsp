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
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/customer/layout/css.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/WEB-INF/views/customer/layout/header.jsp"></jsp:include>
	<div class="content">
		<div class="most">
			<hr>
			<p>Newest</p>
			<hr>
		</div>
		<div class="nav-bar">
			<ul>
				<li class="types">
					<div class="img-box">
						<p>Men</p>
						<img width="100%" src="../images/men-fa.png" alt="">
					</div>
					<div class="arrow">
						<i class="fas fa-chevron-down"></i>
					</div>
					<div class="item-bar item-bar-1">
						<c:forEach items="${msList}" begin="0" end="11" var="o">
							<div class="item">
								<a href="${base }/item-detail?id=${o.id}"> <img src="../images/${o.imgIcon }" alt="">
									<h3>${o.name }</h3>
									<h4># ${o.sku }</h4> <span>VND ${o.currencyFormat(o.price) }</span>
								</a>
							</div>
						</c:forEach>

					</div>
				</li>
				<li class="types">
					<div class="img-box">
						<p>Women</p>
						<img width="100%" src="../images/wmen-fa.png" alt="">
					</div>
					<div class="arrow">
						<i class="fas fa-chevron-down"></i>
					</div>
					<div class="item-bar item-bar-2">
						<c:forEach items="${wsList}" begin="0" end="11" var="o">
							<div class="item">
								<a href="${base }/item-detail?id=${o.id}"> <img src="../images/${o.imgIcon }" alt="">
									<h3>${o.name }</h3>
									<h4># ${o.sku }</h4> <span>VND ${o.currencyFormat(o.price) }</span>
								</a>
							</div>
						</c:forEach>
					</div>
				</li>
				<li class="types">
					<div class="img-box">
						<p>Kids</p>
						<img width="100%" src="../images/kids-fa.png" alt="">
					</div>
					<div class="arrow">
						<i class="fas fa-chevron-down"></i>
					</div>
					<div class="item-bar item-bar-3">
						<c:forEach items="${ksList}" begin="0" end="11" var="o">
							<div class="item">
								<a href="${base }/item-detail?id=${o.id}"> <img src="../images/${o.imgIcon }" alt="">
									<h3>${o.name }</h3>
									<h4># ${o.sku }</h4> <span>VND ${o.currencyFormat(o.price) }</span>
								</a>
							</div>
						</c:forEach>
					</div>
				</li>
			</ul>
		</div>
		<div class="static-bar">
			<c:forEach items="${msList}" begin="0" end="11" var="o">
				<div class="item">
					<a href="${base }/item-detail?id=${o.id}"> <img src="../images/${o.imgIcon }" alt="">
						<h3>${o.name }</h3>
						<h4># ${o.sku }</h4> <span>VND ${o.currencyFormat(o.price) }</span>
					</a>
				</div>
			</c:forEach>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/customer/layout/chat.jsp"></jsp:include>
</body>
<jsp:include page="/WEB-INF/views/customer/layout/script.jsp"></jsp:include>
</html>