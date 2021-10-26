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
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/lib/bootstrap4/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/menu-detail.css">
</head>
<body>
    <jsp:include page="/WEB-INF/views/customer/layout/header-2.jsp"></jsp:include>
    <div class="content">
        <div class="gender">
            <p style="text-transform: capitalize;">${cate} </p>
        </div>
        <div class="page">
            <div class="navi hr-col">
                <hr>
            </div>
            <div class="navi" id="men-types">
                <nav aria-label="...">
                    <ul class="pagination">
                      <li class="page-item  disabled">
                        <a class="page-link" href="#" tabindex="-1">Sneakers</a>
                      </li>
                      <li class="page-item">
                          <a class="page-link" href="#">Apparel</a>
                        </li>
                      <li class="page-item">
                          <a class="page-link" href="#">Accessories</a>
                        </li>
                    </ul>
                  </nav>
            </div>
            <div class="navi hr-col">
                <hr>
            </div>
        </div>
        <div class="item-list">
        	<c:forEach items="${mList }" begin="0" end="11" var="m">
				<div class="item">
					<a href="${base }/item-detail?id=${m.id}"> <img src="../images/${m.imgIcon }" alt="">
						<h3>${m.name }</h3>
						<h4># ${m.sku }</h4> <span>VND ${m.currencyFormat(m.price) }</span>
					</a>
				</div>
			</c:forEach>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/customer/layout/footer.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/customer/layout/chat.jsp"></jsp:include>
</body>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/lib/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/lib/bootstrap4/popper.min.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/lib/bootstrap4/bootstrap.min.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/menu-detail.js"></script>
</html>