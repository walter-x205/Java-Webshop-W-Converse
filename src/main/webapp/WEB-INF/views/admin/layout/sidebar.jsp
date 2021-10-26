<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- Main Sidebar Container -->
	<aside class="main-sidebar sidebar-dark-primary elevation-4">
		<!-- Brand Logo -->
		<a href="/ad-index" class="brand-link"> <img src="dist/img/w.jpg"
			alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
			style="opacity: .8"> <span class="brand-text font-weight-light">W
				Shop</span>
		</a>

		<!-- Sidebar -->
		<div class="sidebar">
			<!-- Sidebar user panel (optional) -->
			<div class="user-panel mt-3 pb-3 mb-3 d-flex">
				<div class="image">
					<img src="dist/img/${sessionScope.admin.avatar}" class="img-circle elevation-2"
						alt="">
				</div>
				<div class="info">
					<a href="#" class="d-block">${sessionScope.admin.name }</a>
				</div>
			</div>

			<!-- SidebarSearch Form -->
			<div class="form-inline">
				<div class="input-group" data-widget="sidebar-search">
					<input class="form-control form-control-sidebar" type="search"
						placeholder="Search" aria-label="Search">
					<div class="input-group-append">
						<button class="btn btn-sidebar">
							<i class="fas fa-search fa-fw"></i>
						</button>
					</div>
				</div>
			</div>

			<!-- Sidebar Menu -->
			<c:if test="${sessionScope.admin != null }">
				<nav class="mt-2">
					<ul class="nav nav-pills nav-sidebar flex-column"
						data-widget="treeview" role="menu" data-accordion="false">
						<!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="nav-icon fas fa-chart-pie"></i>
								<p>
									Số liệu thống kê <i class="right fas fa-angle-left"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="${base }/counting"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Doanh số</p>
								</a></li>
								<li class="nav-item"><a href="pages/charts/flot.html"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Số lượng hàng</p>
								</a></li>
							</ul></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="nav-icon fas fa-users-cog"> </i>
								<p>
									Quản lí tài khoản <i class="fas fa-angle-left right"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="${base }/list-admin"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Admin</p>
								</a></li>
								<li class="nav-item"><a href="${base }/list-user"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>User</p>
								</a></li>
							</ul></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="nav-icon fas fa-archive"> </i>
								<p>
									Quản lí hàng hóa <i class="fas fa-angle-left right"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="${base }/list-item"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Danh sách hàng hóa</p>
								</a></li>
								<li class="nav-item"><a href="${base}/add-item"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Thêm mặt hàng</p>
								</a></li>
							</ul></li>
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="nav-icon fas fa-file-invoice-dollar"></i>
								<p>
									Quản lí đơn hàng <i class="fas fa-angle-left right"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="${base }/shipping" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>Đơn hàng đang giao</p>
								</a></li>
								<li class="nav-item"><a href="${base }/shipped" class="nav-link"> <i
										class="far fa-circle nav-icon"></i>
										<p>Đơn hàng đã giao</p>
								</a></li>
							</ul></li>

					</ul>
				</nav>
			</c:if>

			<!-- /.sidebar-menu -->
		</div>
		<!-- /.sidebar -->
	</aside>
	
</body>
</html>