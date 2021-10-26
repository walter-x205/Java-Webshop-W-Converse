<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>W-shop Admin</title>
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/admin/layout/add-css.jsp"></jsp:include>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="../calendar/css/rome.css">

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
			<div class="row">
				<div class="col-lg-4 col-6">
					<!-- small box -->
					<div class="small-box bg-info">
						<div class="inner">
							<h3>${num }</h3>

							<p>Đơn đặt hàng hôm nay</p>
						</div>
						<div class="icon">
							<i class="ion ion-bag"></i>
						</div>
						<button style="width: 100%;" class="small-box-footer btn btn-info"
							data-toggle="modal" data-target="#thisDay">
							More info <i class="fas fa-arrow-circle-right"></i>
						</button>
					</div>
				</div>
				<!-- ./col -->
				<div class="col-lg-4 col-6">
					<!-- small box -->
					<div class="small-box bg-success">
						<div class="inner">
							<h3>
								${currency.currency(totalMonth)}
							</h3>

							<p>Doanh thu tháng</p>
						</div>
						<div class="icon">
							<i class="ion ion-stats-bars"></i>
						</div>
						<button style="width: 100%;"
							class="small-box-footer btn btn-success" data-toggle="modal" data-target="#thisMonth">
							More info <i class="fas fa-arrow-circle-right"></i>
						</button>
					</div>
				</div>
				<!-- ./col -->
				<div class="col-lg-4 col-6">
					<!-- small box -->
					<div class="small-box bg-warning">
						<div class="inner">
							<h3>44</h3>

							<p>User đã đăng kí</p>
						</div>
						<div class="icon">
							<i class="ion ion-person-add"></i>
						</div>
						<button style="width: 100%;"
							class="small-box-footer btn btn-warning">
							More info <i class="fas fa-arrow-circle-right"></i>
						</button>
					</div>
				</div>
				<!-- ./col -->
				<div class="container text-left" style="margin-top: 40px;">
					<div class="row justify-content-center">
						<div class="col-lg-10">
							<h2 class="mb-5 text-center">Doanh thu theo khoảng thời gian</h2>
							<form action="${base }/countTime" class="row">
								<div class="col-md-5">
									<div class="form-group">
										<label for="input_from">Từ ngày</label> <input type="text" name="Start-date"
											class="form-control" id="input_from"
											placeholder="Ngày bắt đầu" value="${keepStart }">
									</div>
								</div>
								<div class="col-md-5">
									<div class="form-group">
										<label for="input_from">Đến ngày</label> <input type="text" name="End-date"
											class="form-control" id="input_to"
											placeholder="Ngày kết thúc" value="${keepEnd }">
									</div>
								</div>
								<div class="col-md-2">
									<div class="form-group">
										<label for="input_from">Duyệt </label> <br>
										<button type="submit" class="btn btn-primary">Tìm</button>
									</div>
								</div>
								
							</form>
						</div>
					</div>

				</div>
				<table class="table table-striped">
					<thead class="thead-dark">
						<tr>
							<th scope="col">Mã đơn hàng</th>
							<th scope="col">Ngày tạo đơn</th>
							<th scope="col">Tổng đơn</th>
							<th scope="col">Doanh thu</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${pByTime }" var="o">
							<tr>
								<th scope="row">${o.id }</th>
								<td>${o.createdDate }</td>
								<td>${currency.currency(o.amount) }</td>
								<td>${currency.currency(o.amount) }</td>
							</tr>
						</c:forEach>

					</tbody>
					<thead class="thead-dark">
						<tr>
							<th scope="col" colspan="3">Tổng doanh thu:</th>
							<th scope="col">${currency.currency(totalTime) }</th>
						</tr>
					</thead>
				</table>
			</div>
			<!-- Modal -->
			<div class="modal fade" id="thisDay" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Chi tiết hôm
								nay</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<table class="table">
								<tbody>
									<tr>
										<th scope="row">Đơn đang giao</th>
										<td>${shipping }</td>
										<td><c:forEach items="${showAll }" var="sa">
												<c:if test="${sa.status == 0 }">${sa.id} <br>
												</c:if>
											</c:forEach></td>

									</tr>
									<tr>
										<th scope="row">Đơn đã giao</th>
										<td>${shipped }</td>
										<td><c:forEach items="${showAll }" var="sa">
												<c:if test="${sa.status == 1 }">${sa.id} <br>
												</c:if>
											</c:forEach></td>
									</tr>
									<tr>
										<th scope="row">Tổng doanh thu</th>
										<td>${currency.currency(total) }</td>
										<td></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>
			
			<!-- Modal -->
			<div class="modal fade" id="thisMonth" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Chi tiết tháng này</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<table class="table">
								<tbody>
									<tr>
										<th scope="row">Đơn đang giao</th>
										<td><c:forEach items="${showAllMonth }" var="sa">
												<c:if test="${sa.status == 0 }">${sa.createdDate} <br>
												</c:if>
											</c:forEach></td>
										<td><c:forEach items="${showAllMonth }" var="sa">
												<c:if test="${sa.status == 0 }">${sa.id} <br>
												</c:if>
											</c:forEach></td>

									</tr>
									<tr>
										<th scope="row">Đơn đã giao</th>
										<td><c:forEach items="${showAllMonth }" var="sa">
												<c:if test="${sa.status == 1 }">${sa.createdDate} <br>
												</c:if>
											</c:forEach></td>
										<td><c:forEach items="${showAllMonth }" var="sa">
												<c:if test="${sa.status == 1 }">${sa.id} <br>
												</c:if>
											</c:forEach></td>
									</tr>
									<tr>
										<th scope="row">Tổng doanh thu</th>
										<td>${currency.currency(totalMonth) }</td>
										<td></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>
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
<script src="js/jquery-3.3.1.min.js"></script>
<script src="../calendar/js/popper.min.js"></script>
<script src="../calendar/js/bootstrap.min.js"></script>
<script src="../calendar/js/rome.js"></script>

<script src="../calendar/js/main.js"></script>
</html>
