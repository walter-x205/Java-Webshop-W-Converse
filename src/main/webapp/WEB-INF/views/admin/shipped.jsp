<!-- taglib SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
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
			<table class="table">
				<thead class="thead-dark">
					<tr>
						<th scope="col">Payment ID</th>
						<th scope="col">Customer ID</th>
						<th scope="col">Created Date</th>
						<th scope="col" style="width: 250px">Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${showAll }" var="sa">
						<c:if test="${sa.status == 1 }">
							<tr>
								<th scope="row">${sa.id }</th>
								<td>${sa.customerId }</td>
								<td>${sa.createdDate }</td>
								<td>
									<!-- Button trigger modal -->
									<button type="button" class="btn btn-primary"
										data-toggle="modal" data-target="#exampleModal-${sa.id }">
										Detail</button> <!-- Modal -->
									<div class="modal fade" id="exampleModal-${sa.id }"
										tabindex="-1" role="dialog"
										aria-labelledby="exampleModalLabel" aria-hidden="true">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLabel">Chi
														tiết đơn hàng</h5>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">
													<table>
														<tr>
															<td style="width: 180px">Mã đơn hàng:</td>
															<td>${sa.id}</td>
														</tr>
														<tr>
															<td>Mã khách hàng:</td>
															<td>${sa.customerId}</td>
														</tr>
														<tr>
															<td>Hình thức thanh toán:</td>
															<td>${sa.payment}</td>
														</tr>
														<tr>
															<td>Người nhận:</td>
															<td>${sa.paymentName}</td>
														</tr>
														<tr>
															<td>Số điện thoại nhận hàng:</td>
															<td>${sa.paymentPhone}</td>
														</tr>
														<tr>
															<td>Địa chỉ nhận hàng:</td>
															<td>${sa.paymentAddress}</td>
														</tr>

														<tr>
															<td>Thông tin đơn hàng:</td>
															<td><c:forEach items="${sa.showOrders}" var="s">${s} <br>
																</c:forEach></td>
														</tr>


														<tr>
															<td>Tổng hóa đơn:</td>
															<td>${sa.currency(sa.amount)}VND</td>
														</tr>
														<tr>
															<td>Trạng thái:</td>
															<td>Đã giao hàng</td>
														</tr>
													</table>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-dismiss="modal">Close</button>
												</div>
											</div>
										</div>
									</div>
								</td>
							</tr>
						</c:if>

					</c:forEach>

				</tbody>
			</table>
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
