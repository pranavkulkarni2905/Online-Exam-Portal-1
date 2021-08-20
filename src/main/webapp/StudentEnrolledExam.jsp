<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
<%@page import="com.exam.DAO.examDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.exam.DAO.RequestDAO"%>
<%@page import="com.exam.model.Student"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%
ServletContext sc2 = request.getServletContext();
Student s2 = (Student) sc2.getAttribute("student-obj");
if (s2 == null) {
	session.setAttribute("pls-login", "Please Login Here...");
	response.sendRedirect("Login.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Enrolled Exam | ThinkExam</title>
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
		<%@ include file="all_component/student-navbar.jsp"%>

		<!-- Main content -->
		<!-- Breadcrumb -->
		<nav aria-label="breadcrumb" class="main-breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="StudentDashboard.jsp">Dashboard</a></li>

				<li class="breadcrumb-item active" aria-current="page">Enrolled Exams
					</li>
					<button class="btn btn-success" style="margin-left:40%;" data-toggle="modal"
							data-target=".example"><i class="fa fa-camera-retro"></i> Current Exams</button>
					<div class="modal fade bd-example-modal-lg example" tabindex="-1" role="dialog"
		aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div
			class="modal-dialog  modal-dialog-centered modal-dialog-scrollable modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Current Exams</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<table class="table table-hover">
						<tbody>
							<tr>
								<th scope="row">#</th>
								<th scope="row">Exam Code</th>
								<th scope="row">Exam Name</th>
								<th scope="row">Exam Date</th>
								<th scope="row">Course</th>
<th scope="row">Action</th>
							</tr>
						</tbody>
						<%
						try {
							
								int sr1 = 1;
								RequestDAO rd1=new RequestDAO();
								ResultSet rs1=rd1.getDataByStudId("Accepted", s2.getStudId());
								 while(rs1.next()){
									 LocalDate now=LocalDate.now();
									 LocalDate date1=LocalDate.parse(rs1.getString(10));
									 if(date1.isEqual(now)){
											
										
						%>

						<tbody>
							<tr>
								<td><%=sr1++%></td>
								<td><%=rs1.getString(2)%></td>
					<td><%=rs1.getString(9)%></td>
					<td><%=rs1.getString(10)%></td>
					<td><%=rs1.getString(7)%></td>
					<td><a href="StartExam?exam_code=<%=rs1.getString(2) %>" class="btn btn-success"><i class="fa fa-unlock"></i> Start Exam</a></td>
							</tr>
						</tbody>


						<%
						}
								 }
						} catch (Exception e) {
						e.printStackTrace();
						}
						%>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>

				</div>
			</div>
		</div>
	</div>
					<button class="btn btn-primary" style="margin-left:5%;" data-toggle="modal"
							data-target=".example2"><i class="fa fa-tasks" aria-hidden="true"></i> Upcoming Exam</button>
					<div class="modal fade bd-example-modal-lg example2" tabindex="-1" role="dialog"
		aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div
			class="modal-dialog  modal-dialog-centered modal-dialog-scrollable modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Upcoming Exams</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<table class="table table-hover">
						<tbody>
							<tr>
								<th scope="row">#</th>
								<th scope="row">Exam Code</th>
								<th scope="row">Exam Name</th>
								<th scope="row">Exam Date</th>
								
								<th scope="row">Course</th>

							</tr>
						</tbody>
						<%
						try {
							int sr2 = 1;
							RequestDAO rd2=new RequestDAO();
							ResultSet rs2=rd2.getDataByStudId("Accepted", s2.getStudId());
							 while(rs2.next()){
								 LocalDate now=LocalDate.now();
								 LocalDate date1=LocalDate.parse(rs2.getString(10));
								 if(date1.isAfter(now)) {
						%>

						<tbody>
							<tr>
								<td><%=sr2++%></td>
								<td><%=rs2.getString(2)%></td>
					<td><%=rs2.getString(9)%></td>
					<td><%=rs2.getString(10)%></td>
					<td><%=rs2.getString(7)%></td>
							</tr>
						</tbody>


						<%
						}
						}
						} catch (Exception e) {
						e.printStackTrace();
						}
						%>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>

				</div>
			</div>
		</div>
	</div>
					<button class="btn btn-warning" style="margin-left:3%;" data-toggle="modal"
							data-target=".example3"><i class="fa fa-times"></i> Expired Exam</button>
					<div class="modal fade bd-example-modal-lg example3" tabindex="-1" role="dialog"
		aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div
			class="modal-dialog  modal-dialog-centered modal-dialog-scrollable modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Expired Exams</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<table class="table table-hover">
						<tbody>
							<tr>
								<th scope="row">#</th>
								<th scope="row">Exam Code</th>
								<th scope="row">Exam Name</th>
								<th scope="row">Exam Date</th>
								
								<th scope="row">Course</th>

							</tr>
						</tbody>
						<%
						try {
							int sr3 = 1;
							RequestDAO rd3=new RequestDAO();
							ResultSet rs3=rd3.getDataByFlag(1, s2.getStudId());
							 while(rs3.next()) {
						%>

						<tbody>
							<tr>
								<td><%=sr3++%></td>
								<td><%=rs3.getString(2)%></td>
					<td><%=rs3.getString(9)%></td>
					<td><%=rs3.getString(10)%></td>
					<td><%=rs3.getString(7)%></td>
							</tr>
						</tbody>


						<%
						}
						
						} catch (Exception e) {
						e.printStackTrace();
						}
						%>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>

				</div>
			</div>
		</div>
	</div>
			</ol>
			
		</nav>
		<div class="text-center" style="color:red;"> List Of Enrolled & Currently Available Exams. ): </div><br>
		<div class="container">
			<table class="table table-hover">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">Exam Code</th>
						<th scope="col">Exam Name</th>
						<th scope="col">Exam Date</th>
						<th scope="col">Course</th>
						<th scope="col">Action</th>
					</tr>
				</thead>


				<%
				try {
						int i = 1;
					
						RequestDAO rd=new RequestDAO();
						ResultSet rs=rd.getDataByStudId2("Accepted", s2.getStudId());
						while(rs.next()){
						
							
				%>
				<tr>
					<th scope="row"><%=i++%></th>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getString(9)%></td>
					<td><%=rs.getString(10)%></td>
					<td><%=rs.getString(7)%></td>
					<td><a href="Instructions.jsp?exam_code=<%=rs.getString(2) %>" class="btn btn-success"><i class="fa fa-unlock"></i> Start Exam</a></td>
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