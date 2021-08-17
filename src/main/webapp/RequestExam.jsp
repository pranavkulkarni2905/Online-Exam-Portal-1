<%@page import="com.exam.model.Request"%>
<%@page import="com.exam.DAO.RequestDAO"%>
<%@page import="com.exam.model.Student"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.exam.model.Exam"%>
<%@page import="com.exam.DAO.examDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Exam | ThinkExam</title>
<%
ServletContext sc2 = request.getServletContext();
Student s2 = (Student) sc2.getAttribute("student-obj");
if (s2 == null) {
	session.setAttribute("pls-login", "Please Login Here...");
	response.sendRedirect("Login.jsp");
}
%>
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

</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<%@ include file="all_component/student-navbar.jsp"%>
	<%
	try {
		boolean msg1 = (boolean) session.getAttribute("request-success");
		if (msg1 == true) {
	%>
	<div id="div1">
		<script type="text/javascript">
			Swal.fire('Done.!!&#9989', 'Request sent Successfully&#128077',
					'success')
		</script>
	</div>
	<%
	}
	} catch (Exception e) {
	//e.printStackTrace();
	}
	session.removeAttribute("request-success");
	%>

	<%
	try {
		boolean msg2 = (boolean) session.getAttribute("request-fail");
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
	session.removeAttribute("request-fail");
	%>
	<%
	try {
		boolean msg3 = (boolean) session.getAttribute("request-already-sent");
		if (msg3 == true) {
	%>
	<div id="div1">
		<script type="text/javascript">
			Swal.fire('Ooops.!!', 'Request Already Sent By You.', 'warning')
		</script>
	</div>
	<%
	}
	} catch (Exception e) {
	//e.printStackTrace();
	}
	session.removeAttribute("request-already-sent");
	%>
	<!-- Main content -->
	<!-- Breadcrumb -->
	<div class="wrapper">
		<nav aria-label="breadcrumb" class="main-breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="StudentDashboard.jsp">Dashboard</a></li>

				<li class="breadcrumb-item active" aria-current="page">View
					Exams</li>
			</ol>
		</nav>
		<div class="modal-body">
			<table class="table table-hover">
				<tbody>
					<tr>
						<th scope="row">#</th>
						<th scope="row">Exam Code</th>
						<th scope="row">Exam Name</th>
						<th scope="row">Exam Date</th>
						<th scope="row">Exam Time</th>
						<th scope="row">Course</th>
						<th scope="row">Faculty</th>
						<th scope="row">Status</th>

					</tr>
				</tbody>
				<%
				try {
					int sr = 1;
					ServletContext sc1 = request.getServletContext();
					examDAO ed = new examDAO();
					ResultSet rs = ed.getAllData();
					while (rs.next()) {
				%>
				<tbody>
					<tr>

						<td scope="row"><%=sr++%></td>
						<td><%=rs.getString(1)%></td>
						<td><%=rs.getString(2)%></td>
						<td><%=rs.getString(3)%></td>
						<td><%=rs.getString(4)%>Min</td>
						<td><%=rs.getString(5)%></td>
						<td><%=rs.getString(8)%></td>
						<td>
						
					 <a href="RequestExamServlet?e_code=<%=rs.getString(1)%>"
											
															class="btn btn-primary"><i class="fa fa-paper-plane"></i> Request / Enroll</a>
								 </td>
					</tr>
                </tbody>
					<%
					}
					int facid = rs.getInt(6);
					sc1.setAttribute("facid", facid);
					} catch (Exception e) {
					e.printStackTrace();
					}
					%>
				
			</table>



		</div>
	</div>
</body>
</html>