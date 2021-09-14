<%@page import="java.util.List"%>
<%@page import="com.exam.model.Course"%>
<%@page import="com.exam.DAO.courseDAO"%>
<%@page import="com.exam.model.Exam"%>
<%@page import="com.exam.DAO.examDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
ServletContext sc2 = request.getServletContext();
Faculty f2 = (Faculty) sc2.getAttribute("faculty-obj");
if (f2 == null) {
	session.setAttribute("pls-login", "Please Login Here...");
	response.sendRedirect("Login.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Exam | ThinkExam</title>
<script src="js/secure.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>
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

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<style>
.class {
	margin-left: 100px;
}

.form-group {
	width: 500px;
}

.label {
	display: block;
	font: 1rem 'Fira Sans', sans-serif;
}

.card {
	height: 560px;
	width: 700px;
	margin-left: 200px;
}

.form-group row {
	margin-top: 100px;
	padding-top: 10px;
	spacing: 10px;
}

input, label {
	margin: .4rem 0;
}
</style>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<%@ include file="all_component/faculty-navbar.jsp"%>
	<nav aria-label="breadcrumb" class="main-breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="FacultyDashboard.jsp">Dashboard</a></li>
				<li class="breadcrumb-item"><a href="SetExam.jsp">View
						Exams</a></li>
				<li class="breadcrumb-item active" aria-current="page">Edit
					Exam</li>
			</ol>
		</nav>
		<!-- /Breadcrumb -->
		<%
			String e_code = request.getParameter("exam_code");
			examDAO ed = new examDAO();
			Exam e = ed.getDataByCode(e_code);
		%>
	<div class="card">
		<div class="class">
			<form action="EditExamServlet" method="post">
				<h2 class="text-center" style="color: blue;">
					<b>Edit Exam</b>
				</h2>
				<div class="form-group row">
					<label for="inputEmail3" class="col-sm-2 col-form-label"
						style="margin-top: 30px;">Exam Code</label>
					<div class="col-sm-10">
						
						<input type="text" class=" form-control-plaintext" name="examcode"
							style="margin-top: 50px;" readonly="readonly"
							value="<%=e_code%>">
						
					</div>
				</div>
				<div class="form-group row">
					<label for="inputPassword3" class="col-sm-2 col-form-label">Exam
						Name</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="examname"
							id="inputPassword3" value="<%=e.getExamName()%>">
					</div>
				</div>
				<div class="form-group row">
					<label for="inputEmail3" class="col-sm-2 col-form-label">Course
						Name</label>
					<div class="col-sm-10">
					<input type="text" class="form-control" name="coursename"
							id="inputPassword3" value="<%=e.getcName()%>" readonly="readonly">
					</div>
				</div>
				<div>
					<label for="start" class="Label">Exam date:
						&nbsp&nbsp&nbsp&nbsp</label> <input type="date" id="start" name="date"
						value="<%=e.getExamDate()%>" min="2021-08-01" max="2022-12-31">
				</div>
				<br>

				<div class="row">
					<h6>
						<b>Exam time</b>
					</h6>

					<br>
					<div class="container">
						<div class="col-sm-8">
							<label class="radio-inline"> <input type="radio"
								name="optradio" value="60" checked>60 Min
							</label>&nbsp&nbsp&nbsp <label class="radio-inline"> <input
								type="radio" value="40" name="optradio">40 Min
							</label>&nbsp&nbsp&nbsp <label class="radio-inline"> <input
								type="radio" value="30" name="optradio">30 Min
							</label>&nbsp&nbsp&nbsp <label class="radio-inline"> <input
								type="radio" value="20" name="optradio">20 Min
							</label>&nbsp&nbsp&nbsp <label class="radio-inline"> <input
								type="radio" value="5" name="optradio">5 Min
							</label> <br>
						</div>
					</div>
				</div>
				<hr>
				<br>
				<div class="form-group row">
					<div class="col-sm-10">
						<button type="submit" class="btn btn-success">Save changes</button>
				</div>
				</div>
				</form>
				<script src="js/secure.js"></script>

</body>
</html>