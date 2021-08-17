
<%@page import="com.exam.model.Student"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Student navbar</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Tempusdominus Bootstrap 4 -->
<link rel="stylesheet"
	href="plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
<!-- iCheck -->
<link rel="stylesheet"
	href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<!-- JQVMap -->
<link rel="stylesheet" href="plugins/jqvmap/jqvmap.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="dist/css/adminlte.min.css">
<link
	href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css"
	rel="stylesheet">
<!-- overlayScrollbars -->
<link rel="stylesheet"
	href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
<!-- Daterange picker -->
<link rel="stylesheet"
	href="plugins/daterangepicker/daterangepicker.css">
<!-- summernote -->
<link rel="stylesheet" href="plugins/summernote/summernote-bs4.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">


		<!-- Navbar -->
		<nav
			class="main-header navbar navbar-expand navbar-white navbar-light">


			<!-- Right navbar links -->
			<ul class="navbar-nav ml-auto">
				<!-- Navbar Search -->


				<li class="nav-item">
					<button type="button" data-toggle="modal"
						data-target="#exampleModal">
						<i class="fa fa-user-circle" style="color: red; font-size: 30px;"></i>
					</button>


				</li> &nbsp&nbsp&nbsp&nbsp

				<li class="nav-item"><a href="LogoutServlet2"><button
							class="btn btn-danger" data-toggle="modal"
							data-target=".bs-example-modal-sm">
							<i class="fa fa-power-off"></i> Logout
						</button></a></li>
			</ul>
		</nav>
		<!-- Button trigger modal -->


		<!-- Modal -->

		<aside class="main-sidebar sidebar-dark-primary elevation-4">
			<!-- Brand Logo -->
			<a href="index3.html" class="brand-link"> <img
				src="images/logo.png" alt="AdminLTE Logo"
				class="brand-image img-circle elevation-3" style="opacity:"> <span
				class="brand-text font-weight-light">ThinkExam</span>
			</a>

			<!-- Sidebar -->
			<div class="sidebar">
				<!-- Sidebar user panel (optional) -->
				<div class="image">
					<img src="https://bootdey.com/img/Content/avatar/avatar7.png"
						style="border-radius: 50%; width: 100px; height: 100px; margin-left: 30px;"
						alt="User Image">
					<%
					ServletContext sc = request.getServletContext();
					Student stud = (Student) sc.getAttribute("student-obj");
					if (stud != null) {
					%>



					<h3 style="color: white;"><%=stud.getfName()%>&nbsp<%=stud.getlName()%></h3>

					<%
					}
					%>

				</div>
				<hr>




				<!-- Sidebar Menu -->
				<nav class="mt-2">
					<ul class="nav nav-pills nav-sidebar flex-column"
						data-widget="treeview" role="menu" data-accordion="false">
						<!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
						<li class="nav-item menu-open"><a href="StudentDashboard.jsp"
							class="nav-link active"> <i
								class="nav-icon fas fa-tachometer-alt"></i>
								<p>
									Student Dashboard <i class="right fas fa-angle-left"></i>
								</p>
						</a>

							<ul class="nav nav-treeview"><hr>
								<li class="nav-item"><a href="StudentProfile.jsp"
									class="nav-link "> <i class="fa fa-user"></i>
										<p>My Profile</p>
								</a></li><hr>
								<li class="nav-item"><a href="RequestExam.jsp"
									class="nav-link "> <i class="fa fa-sign-out"></i>
										<p>View All Exams</p>
								</a></li>
								<li class="nav-item"><a href="Addcourses.jsp"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Start Exam</p>
								</a></li>
								<hr>
								<li class="nav-item"><a href="Viewcourses.jsp"
									class="nav-link"> <i class="fa fa-sign-out"></i>
										<p>View Result</p>
								</a></li>
								<br>
								<br>

							</ul></li>
		</aside>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1 class="m-0">Student Dashboard</h1>
						</div>
						<!-- /.col -->
						<div class="col-sm-6"></div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</div>

			<!-- /.content-header -->

			<!-- Main content -->

			<script src="plugins/jquery/jquery.min.js"></script>
			<script src="plugins/jquery-ui/jquery-ui.min.js"></script>

			<script>
				$.widget.bridge('uibutton', $.ui.button)
			</script>
			<!-- Bootstrap 4 -->
			<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
			<!-- ChartJS -->
			<script src="plugins/chart.js/Chart.min.js"></script>
			<!-- Sparkline -->
			<script src="plugins/sparklines/sparkline.js"></script>
			<!-- JQVMap -->
			<script src="plugins/jqvmap/jquery.vmap.min.js"></script>
			<script src="plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
			<!-- jQuery Knob Chart -->
			<script src="plugins/jquery-knob/jquery.knob.min.js"></script>
			<!-- daterangepicker -->
			<script src="plugins/moment/moment.min.js"></script>
			<script src="plugins/daterangepicker/daterangepicker.js"></script>
			<!-- Tempusdominus Bootstrap 4 -->
			<script
				src="plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
			<!-- Summernote -->
			<script src="plugins/summernote/summernote-bs4.min.js"></script>
			<!-- overlayScrollbars -->
			<script
				src="plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
			<!-- AdminLTE App -->
			<script src="dist/js/adminlte.js"></script>
			<!-- AdminLTE for demo purposes -->
			<script src="dist/js/demo.js"></script>
			<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
			<script src="dist/js/pages/dashboard.js"></script>
</body>
</html>
