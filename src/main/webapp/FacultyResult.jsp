<%@page import="com.exam.DAO.examDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.exam.DAO.resultDAO"%>
<%@page import="com.exam.model.Faculty"%>
<%@page import="com.exam.DAO.questionDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
	ServletContext sc2=request.getServletContext();
	Faculty f2=(Faculty)sc2.getAttribute("faculty-obj");
	if(f2==null){
		session.setAttribute("pls-login", "Please Login Here...");
		response.sendRedirect("Login.jsp");
	}
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Result | ThinkExam</title>
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
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">
		<%@ include file="all_component/faculty-navbar.jsp"%>

		<!-- Main content -->
		<!-- Breadcrumb -->
		<nav aria-label="breadcrumb" class="main-breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="FacultyDashboard.jsp">Dashboard</a></li>

				<li class="breadcrumb-item active" aria-current="page">View
					Result</li>
			</ol>
		</nav>
		<div class="text-center" style="color:red;">List of Students Result who Enrolled for Your Courses</div><br>
		<div class="container">
			<table class="table table-hover">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">ResultId</th>
						<th scope="col">Stud Id</th>
						<th scope="col">Stud Name</th>
						<th scope="col">Exam Code</th>
						<th scope="col">Course</th>
						<th scope="col">Obt Marks</th>
						<th scope="col">Total Marks</th>
						<th scope="col">Percentage</th>
						<th scope="col">Result</th>
					</tr>
				</thead>


				<%
				try {
					ServletContext sc1 = request.getServletContext();
					Faculty s = (Faculty) sc1.getAttribute("faculty-obj");
					if (s != null) {
						int i = 1;
						examDAO ed=new examDAO();
						ResultSet rs1=ed.getDataForResult(s.getFacId());
						while(rs1.next()){
							String code=rs1.getString(1);
						resultDAO cd = new resultDAO();
						ResultSet rs=cd.getDataByExamCode(code);
							while(rs.next()){
						
							
				%>


				<tr>
					<th scope="row"><%=i++%></th>
					<td><%=rs.getInt(1) %></td>
					<td><%=rs.getInt(2) %></td>
					<td><%=rs.getString(3) %></td>
					<td><%=rs.getString(4) %></td>
					<td><%=rs.getString(5) %></td>
					<td><%=rs.getInt(7) %></td>
					<td><%=rs.getInt(6) %></td>
					<td><%=rs.getInt(13) %>%</td>
					<td><%=rs.getString(14) %></td>
					

					
				</tr>

				<%
				//System.out.print(rs.getInt(1));
				}
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

</body>
</html>