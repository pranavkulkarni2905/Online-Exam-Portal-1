<%@page import="com.exam.model.Student"%>
<%@page import="com.exam.DAO.studentDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.exam.DAO.RequestDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Enrolled Students</title>
<%
	ServletContext sc1=request.getServletContext();
	Faculty f=(Faculty)sc1.getAttribute("faculty-obj");
	if(f==null){
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
<SCRIPT type="text/javascript">
    window.history.forward();
    function noBack() { window.history.forward(); }
</SCRIPT>
<%

response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);
    if(session.getAttribute("token")==null){
    //response.sendRedirect(request.getContextPath() + "/LogOut.jsp");

}
%>
</head>
<body class="hold-transition sidebar-mini layout-fixed" onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">


	<div class="wrapper">
		<%@ include file="all_component/faculty-navbar.jsp"%>

		<!-- Main content -->
		<!-- Breadcrumb -->
		<nav aria-label="breadcrumb" class="main-breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="FacultyDashboard.jsp">Dashboard</a></li>
				<li class="breadcrumb-item active" aria-current="page">View Enrolled Students</li>
			</ol>
		</nav>
		<div class="text-center" style="color:red;"> List Of All Enrolled Students For Your Courses. ): </div><br>
		<div class="container">
			<table class="table table-hover">
				<thead>
					<tr>
					<th scope="col">#</th>
						<th scope="col">Student ID</th>
						<th scope="col">Profile</th>
						<th scope="col">Student name</th>
						<th scope="col">Gender</th>
						<th scope="col">Email</th>
						<th scope="col">Mobile no</th>
						<th scope="col">Course Name</th>
					</tr>
				</thead>
				<%
				try {
					int i=1;
					RequestDAO rd=new RequestDAO();
					ResultSet rs=rd.getDataByStatusFilter2("Accepted", f.getFacId());
					session.setAttribute("enroll-stud", i);
					while (rs.next()){
						studentDAO sd=new studentDAO();
						Student s=sd.getDataById(rs.getInt(1));
						
				%>
				<tr>
				<td><%=i++ %></td>
					<td><%=s.getStudId()%></td>
					<td><img src="profile_images/<%=s.getPhoto()%>" style="border-radius: 50%; width: 60px; height: 60px;"></td>
					<td><%=s.getfName()%>&nbsp<%=s.getlName()%></td>
					<td><%=s.getGender()%></td>
					<td><%=s.getEmail()%></td>
					<td><%=s.getMobNo()%></td>
					<td><%=rs.getString(2)%></td>
				</tr>

				<%
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
</body>
</html>