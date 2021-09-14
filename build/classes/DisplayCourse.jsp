<%@page import="java.sql.ResultSet"%>
<%@page import="com.exam.model.Course"%>
<%@page import="java.util.List"%>
<%@page import="com.exam.DAO.courseDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Course | ThinkExam</title>
<%
	ServletContext sc2=request.getServletContext();
	Faculty f2=(Faculty)sc2.getAttribute("faculty-obj");
	if(f2==null){
		session.setAttribute("pls-login", "Please Login Here...");
		response.sendRedirect("Login.jsp");
	}
	%>
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


<link
	href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css"
	rel="stylesheet">
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
<style>

</style>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
%>
	<%
	try {
		boolean msg1 = (boolean) session.getAttribute("edit-course-success");
		if (msg1 == true) {
	%>
	<div id="div1">
		<script type="text/javascript">
			Swal.fire('Done.!!&#9989',
					'Course Details Updated Successfully&#128077', 'success')
		</script>
	</div>


	<%
	}
	} catch (Exception e) {
	//e.printStackTrace();
	}
	session.removeAttribute("edit-course-success");
	%>

	<%
	try {
		boolean msg2 = (boolean) session.getAttribute("edit-course-fail");
		if (msg2 == false) {
	%>
	<div id="div1">
		<script type="text/javascript">
			Swal.fire('Ooops.!!', 'Something went wrog on server.', 'warning')
		</script>
	</div>


	<%
	}
	} catch (Exception e) {
	//e.printStackTrace();
	}
	session.removeAttribute("edit-course-fail");
	%>

	<%
	try {
		boolean msg3 = (boolean) session.getAttribute("delete-course-success");
		if (msg3 == true) {
	%>
	<div id="div1">
		<script type="text/javascript">
			Swal.fire('Done.!!&#9989', 'Course Successfully Deleted.',
					'success')
		</script>
	</div>

	<%
	}
	} catch (Exception e) {
	//e.printStackTrace();
	}
	session.removeAttribute("delete-course-success");
	%>

	<%
	try {
		boolean msg4 = (boolean) session.getAttribute("delete-course-fail");
		if (msg4 == false) {
	%>
	<div id="div1">
		<script type="text/javascript">
			Swal.fire('Ooops.!!', 'Something went wrog on server.', 'warning')
		</script>
	</div>


	<%
	}
	} catch (Exception e) {
	//e.printStackTrace();
	}
	session.removeAttribute("delete-course-fail");
	%>
	<div class="wrapper">
		<%@ include file="all_component/faculty-navbar.jsp"%>

		<!-- Main content -->
		<!-- Breadcrumb -->
		<nav aria-label="breadcrumb" class="main-breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="FacultyDashboard.jsp">Dashboard</a></li>

				<li class="breadcrumb-item active" aria-current="page">View
					Courses</li>
			</ol>
		</nav>
		<div class="text-center" style="color:red;">Note : If You have Set Exam For Any Course,Then You Can't Edit/Delete that Course.</div><br>
		<div class="container">
			<table class="table table-hover">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">Course Code</th>
						<th scope="col">Course Name</th>
						<th scope="col">Date</th>
						<th scope="col">Edit</th>
						<th scope="col">Delete</th>
					</tr>
				</thead>


				<%
				try {
					ServletContext sc1 = request.getServletContext();
					Faculty s = (Faculty) sc1.getAttribute("faculty-obj");
					if (s != null) {
						int i = 1;
						courseDAO cd = new courseDAO();
						List<Course> lst= cd.getAllDataById(s.getFacId());
							for(Course c:lst) {
				%>


				<tr>
					<th scope="row"><%=i++%></th>
					<td><%=c.getCourseid()%></td>
					<td><%=c.getCoursename()%></td>
					<td><%=c.getDate()%></td>
					<td><a href="EditCourse.jsp?course_id=<%=c.getCourseid()%>"><button
								type="button" class="btn btn-success"><i class="fa fa-pencil"></i> Edit</button></a></td>
					<td><a href="DeleteCourseServlet?course_id=<%=c.getCourseid() %>"><button class="btn btn-danger"
						data-toggle="modal"><i class="fa fa-trash"></i> Delete</button> </a> <!-- Modal HTML -->

					</td>
				</tr>

				<%
				//System.out.print(rs.getInt(1));
				}
				
				}
					
				} catch (Exception e) {

				}
				%>
			</table>


		</div>
		<script src="plugins/jquery/jquery.min.js"></script>
		<script src="plugins/jquery-ui/jquery-ui.min.js"></script>

		<script>
			$.widget.bridge('uibutton', $.ui.button)
		</script>
		<script src="js/secure.js"></script>
</body>
</html>