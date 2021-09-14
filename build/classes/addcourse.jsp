<!DOCTYPE html>
<html>
<head>
<title>Add Course | ThinkExam</title>
<%
	ServletContext sc1=request.getServletContext();
	Faculty f=(Faculty)sc1.getAttribute("faculty-obj");
	if(f==null){
		session.setAttribute("pls-login", "Please Login Here...");
		response.sendRedirect("Login.jsp");
	}
	%>
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

  <script src="backNoWork.js" type="text/javascript"></script>
<style>
.card{
	margin-right: 300px;
	margin-left: 300px;
	padding-top : 30px;
}
h3{
	font-size: 30px;
	color : blue;
}
</style>
</head>
<body class="hold-transition sidebar-mini layout-fixed">

	<div class="wrapper">
		<%@ include file="all_component/faculty-navbar.jsp"%>
		<%
		try {
			boolean msg1 = (boolean) session.getAttribute("course-add-success");
			if (msg1 == true) {
		%>
		<div id="div1">
			<script type="text/javascript">
				Swal.fire('Done.!!&#9989', 'Course added Successfully&#128077',
						'success')
			</script>
		</div>

		<%
		}
		} catch (Exception e) {
		//e.printStackTrace();
		}
		session.removeAttribute("course-add-success");
		%>
		<%
		try {
			boolean msg2 = (boolean) session.getAttribute("course-add-fail");
			if (msg2 == false) {
		%>
		<div id="div1">
			<script type="text/javascript">
				Swal.fire('Ooops.!!', 'Something went wrog on server.',
						'warning')
			</script>
		</div>

		<%
		}
		} catch (Exception e) {
		//e.printStackTrace();
		}
		session.removeAttribute("course-add-fail");
		%>
		
		<!-- Main content -->
		<!-- Breadcrumb -->
		<nav aria-label="breadcrumb" class="main-breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="FacultyDashboard.jsp">Dashboard</a></li>

				<li class="breadcrumb-item active" aria-current="page">Add
					Courses</li>
			</ol>
		</nav>
		<%
				String msg3 = (String) session.getAttribute("cid-repeat");
				if (msg3 != null) {
				%>
				<div class="alert alert-warning alert-dismissible text-center">
					<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
					<b><h5><%=msg3%>
						</h5></b>
				</div>
				<%
				}
				session.removeAttribute("cid-repeat");
				%>
				<%
				String msg4 = (String) session.getAttribute("cname-repeat");
				if (msg4 != null) {
				%>
				<div class="alert alert-warning alert-dismissible text-center">
					<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
					<b><h5><%=msg4%>
						</h5></b>
				</div>
				<%
				}
				session.removeAttribute("cname-repeat");
				%>
		<!-- /Breadcrumb -->
		<div class="text-center" style="color:red;">Note : Once Your Set Exam for Any Course , Then You Can Not Edit/Delete That Course.</div><br>
		<div class="container" align="center">
			<div class="card">
			<div class="card-header">
				<h3 style="color: blue;">Add Courses</h3>
			</div>
				<div class="card-body">
					<form action="AddCourseServlet" method="post">
						<div class="form-outline mb-4">
							<label class="form-label" for="form1Example1">Course Code : &nbsp&nbsp</label>
							<input type="text" id="form1Example1" name="ccode" pattern="[0-9]{1,15}" title="Must Contain Only Numbers" required />
						</div>

						<!-- Password input -->
						<div class="form-outline mb-4">
							<label class="form-label" for="form1Example2">Course Name : &nbsp&nbsp</label>
							<input type="text" id="form1Example2" name="cname" required />
						</div>
						<!-- Submit button -->
						<button type="submit" class="btn btn-primary">Add</button>
					</form>
				</div>
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