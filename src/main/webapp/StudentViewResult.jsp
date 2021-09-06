<%@page import="java.sql.ResultSet"%>
<%@page import="com.exam.DAO.resultDAO"%>
<%@page import="com.exam.model.Student"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%
	ServletContext sc2=request.getServletContext();
	Student s2=(Student)sc2.getAttribute("student-obj");
	if(s2==null){
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


<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
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
		<%@ include file="all_component/student-navbar.jsp"%>

		<!-- Main content -->
		<!-- Breadcrumb -->
		<nav aria-label="breadcrumb" class="main-breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="FacultyDashboard.jsp">Dashboard</a></li>

				<li class="breadcrumb-item active" aria-current="page">View
					Results</li>
			</ol>
		</nav>
		<div class="container">
			<table class="table table-hover">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">Exam Code</th>
						<th scope="col">Exam Date</th>
						<th scope="col">Course Name</th>
						<th scope="col">Obtained Marks</th>
						<th scope="col">Total Marks</th>
						<th scope="col">Result</th>
						<th scope="col">Details</th>
						<th scope="col">Certification</th>
					</tr>
				</thead>


				<%
				try {
					//ServletContext sc=request.getServletContext();
	                //Student stud=(Student)sc.getAttribute("student-obj");
	                //String exam_code=(String)sc.getAttribute("exam-code");
	               // String date=(String)sc.getAttribute("exam-date");
	                //int resId=(int)sc.getAttribute("result-id");
	                int i=1;
	                resultDAO rd=new resultDAO();
	                ResultSet rs=rd.getResultByStudId(s2.getStudId());
	                while(rs.next()){
				%>


				<tr>
					<th scope="row"><%=i++%></th>
					<td><%=rs.getString(4)%></td>
					<td><%=rs.getString(15)%></td>
					<td><%=rs.getString(5)%></td>
					<td><%=rs.getString(7)%></td>
					<td><%=rs.getString(6)%></td>
					<td><%=rs.getString(14)%></td>
					
					<td><a href="ViewResultDetails.jsp?res_id=<%=rs.getInt(1)%>&stud_id=<%=rs.getInt(2)%>"><button
								class="btn btn-primary" > <i class="fa fa-eye"></i> View More</button> </a></td>
								&nbsp&nbsp&nbsp
								<td><a href="Certificate.jsp?res_id=<%=rs.getInt(1)%>&stud_id=<%=rs.getInt(2)%>"><button
								class="btn btn-warning" > <i class="fa fa-certificate"></i> View Certificate</button> </a></td>
					
				</tr>



				<%
				//System.out.print(rs.getInt(1));
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