<%@page import="com.exam.model.Course"%>
<%@page import="com.exam.DAO.courseDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%
	ServletContext sc1=request.getServletContext();
	Faculty f=(Faculty)sc1.getAttribute("faculty-obj");
	if(f==null){
		session.setAttribute("pls-login", "Please Login Here...");
		response.sendRedirect("Login.jsp");
	}
	%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Edit Course</title>
<script src="js/secure.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<script src="sweetalert2.all.min.js"></script>
<script src="sweetalert2.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>
.card {
	margin-right: 300px;
	margin-left: 300px;
	padding-top: 30px;
}

h3 {
	font-size: 30px;
	color: blue;
}
</style>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
%>
	<%
	int courseId = Integer.parseInt(request.getParameter("course_id"));
	courseDAO cd = new courseDAO();
	Course c = cd.getDataById(courseId);
	%>
	<div class="wrapper">
		<%@ include file="all_component/faculty-navbar.jsp"%>
		
		<!-- Main content -->
		<!-- Breadcrumb -->
		<nav aria-label="breadcrumb" class="main-breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="FacultyDashboard.jsp">Dashboard</a></li>
				<li class="breadcrumb-item"><a href="DisplayCourse.jsp">All
						Courses</a></li>
				<li class="breadcrumb-item active" aria-current="page">Edit
					Courses</li>
			</ol>
		</nav>
		<!-- /Breadcrumb -->
		<div class="container" align="center">
			<div class="card">
				<div class="card-header">
					<h3 style="color: blue;">Edit Courses</h3>
				</div>
				<div class="card-body">
					<form action="EditCourseServlet" method="post">
					<input type="hidden" value="<%=courseId %>" name="courseCode">
						<div class="form-outline mb-4">
							<label class="form-label" for="form1Example1">Course Code
								: &nbsp&nbsp</label> <input type="text" id="form1Example1" value="<%=c.getCourseid() %>" name="ccode"
								required />
						</div>

						<!-- Password input -->
						<div class="form-outline mb-4">
							<label class="form-label" for="form1Example2">Course Name
								: &nbsp&nbsp</label> <input type="text" id="form1Example2" name="cname" value="<%=c.getCoursename() %>"
								required />
						</div>
						<!-- Submit button -->
						<button type="submit" class="btn btn-primary">Save
							Changes</button>
					</form>
				</div>
			</div>
		</div>
		<script src="plugins/jquery/jquery.min.js"></script>
		<script src="plugins/jquery-ui/jquery-ui.min.js"></script>
<script src="js/secure.js"></script>
		<script>
			$.widget.bridge('uibutton', $.ui.button)
		</script>
</body>
</html>