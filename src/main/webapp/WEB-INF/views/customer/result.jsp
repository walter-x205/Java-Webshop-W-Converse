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
	href="${pageContext.servletContext.contextPath}/css/menu-detail.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/customer/layout/header-2.jsp"></jsp:include>
	<div class="content">
		<div class="gender">
			<p>Kết quả tìm kiếm</p>
		</div>
		<div class="page">
			<div class="navi hr-col">
				<hr>
			</div>

			<div class="navi hr-col">
				<hr>
			</div>
		</div>
		<div>
			<div class="item-list" style="justify-content: center;">
				<c:forEach items="${sList }" var="s">
					<div class="item">
						<a href="${base }/item-detail?id=${s.id}"> <img
							src="../images/${s.imgIcon }" alt="">
							<h3>${s.name }</h3>
							<h4># ${s.sku }</h4> <span>VND ${s.currencyFormat(s.price) }</span>
						</a>
					</div>
				</c:forEach>
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
</html>