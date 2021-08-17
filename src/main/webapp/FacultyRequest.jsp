<%@page import="java.sql.ResultSet"%>
<%@page import="com.exam.DAO.RequestDAO"%>
<%@page import="com.exam.model.Faculty"%>
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
<title>Request | ThinkExam</title>
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
	href="path/to/font-awesome/css/font-awesome.min.css">


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
.class {
	margin-left: 200px;
	margin-top:100px;
}

.card {
	height: 300px;
	width: 700px;
	margin-left: 250px;
}


</style>
</head>
<body >

	<div class="wrapper">
		<%@ include file="all_component/faculty-navbar.jsp"%>

		<!-- Main content -->
		<!-- Breadcrumb -->
		<nav aria-label="breadcrumb" class="main-breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="FacultyDashboard.jsp">Dashboard</a></li>

				<li class="breadcrumb-item active" aria-current="page">All Requests
					</li>
			</ol>
		</nav>
		<%
			String msg1 = (String) session.getAttribute("req-accept");
			if (msg1 != null) {
			%>

			<div class="alert alert-success alert-dismissible text-center">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<b><h5><%=msg1%></h5></b>
			</div>
			<%
			}
			session.removeAttribute("req-accept");
			%>
			<%
			String msg2 = (String) session.getAttribute("req-decline");
			if (msg2 != null) {
			%>

			<div class="alert alert-danger alert-dismissible text-center">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<b><h5><%=msg2%></h5></b>
			</div>
			<%
			}
			session.removeAttribute("req-decline");
			%>
		<div class="card"><br>
			<b><h1 class="text-center" style="color:red;">Get Filter Data</h1></b>
		<div class="class">
				<div class="form-group row">
					<div class="col-sm-10">
						<button type="submit" class="btn btn-success" data-toggle="modal" data-target=".example" ><i class="fa fa-check"></i> Accepted Requests</button>
						&nbsp&nbsp&nbsp&nbsp
							<div class="modal fade bd-example-modal-lg example" id="#example" tabindex="-1" role="dialog"
		aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div
			class="modal-dialog  modal-dialog-centered modal-dialog-scrollable modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">All Accepted Request</h5>
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
								<th scope="row">Stud Id</th>
								<th scope="row">Stud Name</th>
								<th scope="row">Course Name</th>
								<th scope="row">Status</th>

							</tr>
						</tbody>
						<%
						try{
							ServletContext sc4 = request.getServletContext();
							Faculty s1 = (Faculty) sc4.getAttribute("faculty-obj");
							if (s1 != null) {
								int sr = 1;
								RequestDAO rd = new RequestDAO();
								ResultSet rs = rd.getDataByStatusFilter("Accepted",s1.getFacId());
								while(rs.next()) {
						%>

						<tbody>
							<tr>
								<td><%=sr++%></td>
								<td><%=rs.getString(2)%></td>
								<td><%=rs.getInt(3)%></td>
								<td><%=rs.getString(6)%></td>
								<td><%=rs.getString(7)%></td>
								<td class="bg-success"><i class="fa fa-check"></i><%=rs.getString(8)%></td>
							</tr>
						


						<%
						}
						}
						} catch (Exception e) {
						e.printStackTrace();
						}
						%>
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						data-dismiss="modal">Close</button>

				</div>
			</div>
		</div>
	</div>
						<button type="button" class="btn btn-warning" data-toggle="modal"
							data-target=".example2"><i class="fa fa-close"></i> Declined Requests</button>
					</div>
				</div>
			
		</div>
	</div>
	
	<div class="modal fade bd-example-modal-lg example2" tabindex="-1" role="dialog"
		aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div
			class="modal-dialog  modal-dialog-centered modal-dialog-scrollable modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">All Declined Request</h5>
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
								<th scope="row">Stud Id</th>
								<th scope="row">Stud Name</th>
								<th scope="row">Course Name</th>
								<th scope="row">Status</th>

							</tr>
						</tbody>
						<%
						try{
							ServletContext sc1 = request.getServletContext();
							Faculty s = (Faculty) sc1.getAttribute("faculty-obj");
							if (s != null) {
								int sr = 1;
								RequestDAO rd = new RequestDAO();
								System.out.print(s.getFacId());
								ResultSet rs = rd.getDataByStatusFilter("Declined",s.getFacId());
								while(rs.next()) {
						%>

						<tbody>
							<tr>
								<td><%=sr++%></td>
								<td><%=rs.getString(2)%></td>
								<td><%=rs.getInt(3)%></td>
								<td><%=rs.getString(6)%></td>
								<td><%=rs.getString(7)%></td>
								<td class="bg-warning"><i class="fa fa-close"></i><%=rs.getString(8)%></td>
							</tr>
						

						<%
						}
						}
						} catch (Exception e) {
						e.printStackTrace();
						}
						%>
						</tbody>
						
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						data-dismiss="modal">Close</button>

				</div>
			</div>
		</div>
	</div>
	

		<script src="plugins/jquery/jquery.min.js"></script>
		<script src="plugins/jquery-ui/jquery-ui.min.js"></script>

		<script>
			$.widget.bridge('uibutton', $.ui.button)
		</script>
</body>

</html>