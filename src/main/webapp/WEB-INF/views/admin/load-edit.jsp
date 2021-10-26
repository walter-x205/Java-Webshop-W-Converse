<!-- taglib SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>W-shop Admin</title>
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/admin/layout/add-css.jsp"></jsp:include>
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
		<c:if test="${sessionScope.admin != null }">
			<sf:form action="" modelAttribute="editItem">
				<div>
					<h1>Sửa sản phẩm</h1>
				</div>
				<div class="form-group">
					<label for="formGroupExampleInput">Ảnh sản phẩm</label>
					<div>
						<input type='file' id="imgInp" /> <img id="blah" src="../images/${detail.imgIcon }"
							alt="your image" width="100px" />
					</div>
				</div>
				<div class="form-group">
					<label for="formGroupExampleInput">ID sản phẩm</label>
					<sf:input value="${detail.id}" readonly="true" type="text" class="form-control" id="id"
						placeholder="0" path="id" ></sf:input>
				</div>
				<div class="form-group">
					<label for="formGroupExampleInput">Tên sản phẩm</label>
					<sf:input value="${detail.name}" type="text" class="form-control" id="name"
						placeholder="VD: Chuck Taylor X" path="name"></sf:input>
				</div>
				<div class="form-group">
					<label for="formGroupExampleInput2">Mã sản phẩm</label>
					<sf:input value="${detail.sku}" type="text" class="form-control" id="sku"
						placeholder="VD: 000000C" path="sku"></sf:input>
				</div>
				<div class="form-group">
					<label for="formGroupExampleInput2">Chất liệu</label>
					<sf:input value="${detail.material}" type="text" class="form-control" id="material"
						placeholder="VD: Canvas" path="material"></sf:input>
				</div>
				<div class="form-group">
					<label for="inputState">Danh mục</label> <select id="category"
						class="form-control">
						<option value="${detail.category }" selected>${detail.category }</option>
						<option>Men-Sneaker</option>
						<option>Women-Sneaker</option>
						<option>Kid-Sneaker</option>
						<option>Men-Apparel</option>
						<option>Women-Apparel</option>
						<option>Kid-Apparel</option>
						<option>Men-Accessories</option>
						<option>Women-Accessories</option>
						<option>Kid-Accessories</option>
					</select>
				</div>

				<div class="form-group">
					<label for="formGroupExampleInput2">Giá sản phẩm</label>
					<sf:input value="${detail.price}" type="text" class="form-control" id="price"
						placeholder="VD: 5,000,000" path="price"></sf:input>
				</div>
				<div class="form-group">
					<label for="formGroupExampleInput2">Số lượng</label>
					<sf:input value="${detail.number}" type="text" class="form-control" id="number"
						placeholder="VD: 100" path="number"></sf:input>
				</div>
				<button type="button" class="btn btn-primary"
					onClick="editItem('${base}');">Sửa</button>
			</sf:form>
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
