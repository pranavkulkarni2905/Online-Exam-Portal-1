<%@page import="com.exam.DAO.RequestDAO"%>
<%@page import="com.exam.DAO.resultDAO"%>
<%@page import="com.exam.DAO.questionDAO"%>
<%@page import="com.exam.DAO.courseDAO"%>
<%@page import="com.exam.DAO.examDAO"%>
<%@page import="com.exam.DAO.facultyDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.exam.DAO.studentDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Pannel</title>
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

<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'
	crossorigin='anonymous'></script>

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
body {
	padding-top: 20px;
}

.panel-body .btn:not(.btn-block) {
	width: 120px;
	margin-bottom: 10px;
}

.panel {
	background-color: white;
	width: 500px;
	padding: 20px;
	padding-left: 40px;
}

.container {
	margin-left: 500px;
	margin-top: 40px;
}

body {
	background-color: #7ED4E6;
}
</style>
</head>
<body onload="noBack();" 
	onpageshow="if (event.persisted) noBack();" onunload="">

	<!------ Include the above in your HEAD tag ---------->
	<h1
		style="font-size: 100px; text-align: center; font-family: Algerian;">T
		H I N K &nbsp E X A M</h1>
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">
							<span class="glyphicon glyphicon-bookmark"></span> A D M I N
							&nbsp&nbsp&nbsp D A S H B O A R D
						</h3>
						<hr>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-xs-6 col-md-6">
								<button class="btn btn-danger btn-lg" data-toggle="modal"
									data-target=".example1" role="button">
									<i class="fas fa-user-graduate"></i> <br /> Students
								</button>
								<div class="modal fade bd-example-modal-lg example1"
									tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
									aria-hidden="true">
									<div
										class="modal-dialog  modal-dialog-centered modal-dialog-scrollable modal-lg">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">List Of
													Registered All Students</h5>
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
															<th scope="row">StudId</th>
															<th scope="row">Stud Name</th>
															<th scope="row">Email</th>
															<th scope="row">Phone No</th>
															<th scope="row">DoB</th>
															<th scope="row">Gender</th>
															<th scope="row">City</th>
															<th scope="row">State</th>

														</tr>
													</tbody>
													<%
													try {

														int sr1 = 1;
														studentDAO sd1 = new studentDAO();
														ResultSet rs1 = sd1.getAllData();
														while (rs1.next()) {
													%>

													<tbody>
														<tr>
															<td><%=sr1++%></td>
															<td><%=rs1.getInt(1)%></td>
															<td><%=rs1.getString(2)%>&nbsp<%=rs1.getString(3)%></td>
															<td><%=rs1.getString(9)%></td>
															<td><%=rs1.getString(10)%></td>
															<td><%=rs1.getString(7)%></td>
															<td><%=rs1.getString(6)%></td>
															<td><%=rs1.getString(4)%></td>
															<td><%=rs1.getString(5)%></td>

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
												<button type="button" class="btn btn-primary"
													data-dismiss="modal">Close</button>

											</div>
										</div>
									</div>
								</div>


								<button class="btn btn-warning btn-lg" data-toggle="modal"
									data-target=".example2" role="button">
									<i class="fas fa-chalkboard-teacher"> </i> <br /> Faculty
								</button>

								<div class="modal fade bd-example-modal-lg example2"
									tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
									aria-hidden="true">
									<div
										class="modal-dialog  modal-dialog-centered modal-dialog-scrollable modal-lg">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">List Of
													Registered All Faculty</h5>

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
															<th scope="row">FacId</th>
															<th scope="row">Fac Name</th>
															<th scope="row">Email</th>
															<th scope="row">Phone No</th>
															<th scope="row">DoB</th>
															<th scope="row">Gender</th>
															<th scope="row">Education</th>


														</tr>
													</tbody>
													<%
													try {

														int sr1 = 1;
														facultyDAO fd1 = new facultyDAO();
														ResultSet rs1 = fd1.getAllFaculty();
														while (rs1.next()) {
													%>

													<tbody>
														<tr>
															<td><%=sr1++%></td>
															<td><%=rs1.getInt(1)%></td>
															<td><%=rs1.getString(2)%>&nbsp<%=rs1.getString(3)%></td>
															<td><%=rs1.getString(9)%></td>
															<td><%=rs1.getString(10)%></td>
															<td><%=rs1.getString(6)%></td>
															<td><%=rs1.getString(5)%></td>
															<td><%=rs1.getString(4)%></td>


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
												<button type="button" class="btn btn-primary"
													data-dismiss="modal">Close</button>

											</div>
										</div>
									</div>
								</div>

								<button class="btn btn-secondary btn-lg" data-toggle="modal"
									data-target=".example3" role="button">
									<i class="fa fa-university"></i> <br />Exams
								</button>
								<div class="modal fade bd-example-modal-lg example3"
									tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
									aria-hidden="true">
									<div
										class="modal-dialog  modal-dialog-centered modal-dialog-scrollable modal-lg">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">List Of
													All Exams</h5>

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
															<th scope="row">Exam Time</th>
															<th scope="row">Course Id</th>
															<th scope="row">Course Name</th>
															<th scope="row">FacID</th>
															<th scope="row">Fac Name</th>


														</tr>
													</tbody>
													<%
													try {

														int sr1 = 1;
														examDAO ed1 = new examDAO();
														ResultSet rs1 = ed1.getAllData();
														while (rs1.next()) {
													%>

													<tbody>
														<tr>
															<td><%=sr1++%></td>
															<td><%=rs1.getString(1)%></td>
															<td><%=rs1.getString(2)%></td>
															<td><%=rs1.getString(3)%></td>
															<td><%=rs1.getString(4)%></td>
															<td><%=rs1.getInt(7)%></td>
															<td><%=rs1.getString(5)%></td>
															<td><%=rs1.getInt(6)%></td>
															<td><%=rs1.getString(8)%></td>


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
												<button type="button" class="btn btn-primary"
													data-dismiss="modal">Close</button>

											</div>
										</div>
									</div>
								</div>



								<button class="btn btn-danger btn-lg" data-toggle="modal"
									data-target=".example4" role="button">
									<i class="fa fa-certificate"></i> <br />Course
								</button>
								<div class="modal fade bd-example-modal-lg example4"
									tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
									aria-hidden="true">
									<div
										class="modal-dialog  modal-dialog-centered modal-dialog-scrollable modal-lg">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">List Of
													All Courses</h5>

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
															<th scope="row">Course code</th>
															<th scope="row">Course Name</th>
															<th scope="row">Date</th>
															<th scope="row">Faculty Id</th>



														</tr>
													</tbody>
													<%
													try {

														int sr1 = 1;
														courseDAO ed1 = new courseDAO();
														ResultSet rs1 = ed1.getAllData();
														while (rs1.next()) {
													%>

													<tbody>
														<tr>
															<td><%=sr1++%></td>
															<td><%=rs1.getInt(1)%></td>
															<td><%=rs1.getString(2)%></td>
															<td><%=rs1.getString(3)%></td>
															<td><%=rs1.getInt(4)%></td>

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
												<button type="button" class="btn btn-primary"
													data-dismiss="modal">Close</button>

											</div>
										</div>
									</div>
								</div>



							</div>



							<div class="col-xs-6 col-md-6">
								<button class="btn btn-success btn-lg" data-toggle="modal"
									data-target=".example5" role="button">
									<i class="fa fa-question"></i> <br />Questions
								</button>
								<div class="modal fade bd-example-modal-lg example5"
									tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
									aria-hidden="true">
									<div
										class="modal-dialog  modal-dialog-centered modal-dialog-scrollable modal-lg">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">List Of
													All Questions</h5>

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
															<th scope="row">QueId</th>
															<th scope="row">Question</th>
															<th scope="row">Opt1</th>
															<th scope="row">Opt2</th>
															<th scope="row">Opt3</th>
															<th scope="row">Opt4</th>
															<th scope="row">Answer</th>
															<th scope="row">Course Name</th>
															<th scope="row">FacId</th>


														</tr>
													</tbody>
													<%
													try {

														int sr1 = 1;
														questionDAO ed1 = new questionDAO();
														ResultSet rs1 = ed1.getAllData();
														while (rs1.next()) {
													%>

													<tbody>
														<tr>
															<td><%=sr1++%></td>
															<td><%=rs1.getInt(1)%></td>
															<td><%=rs1.getString(2)%></td>
															<td><%=rs1.getString(3)%></td>
															<td><%=rs1.getString(4)%></td>
															<td><%=rs1.getString(5)%></td>
															<td><%=rs1.getString(6)%></td>
															<td><%=rs1.getString(7)%></td>
															<td><%=rs1.getString(9)%></td>
															<td><%=rs1.getString(10)%></td>


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
												<button type="button" class="btn btn-primary"
													data-dismiss="modal">Close</button>

											</div>
										</div>
									</div>
								</div>


								<button class="btn btn-info btn-lg" data-toggle="modal"
									data-target=".example6" role="button">
									<i class="fa fa-list-alt"></i> <br />Results
								</button>
								<div class="modal fade bd-example-modal-lg example6"
									tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
									aria-hidden="true">
									<div
										class="modal-dialog  modal-dialog-centered modal-dialog-scrollable modal-lg">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">List Of
													All Student's Result</h5>

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
															<th scope="row">ResultId</th>
															<th scope="row">StudId</th>
															<th scope="row">StudName</th>
															<th scope="row">Exam Code</th>
															<th scope="row">Exam Date</th>
															<th scope="row">Course Name</th>
															<th scope="row">Obtained Marks</th>
															<th scope="row">Total Marks</th>
															<th scope="row">Percentage</th>
															<th scope="row">Result</th>


														</tr>
													</tbody>
													<%
													try {

														int sr1 = 1;
														resultDAO ed1 = new resultDAO();
														ResultSet rs1 = ed1.getAllResult();
														while (rs1.next()) {
													%>

													<tbody>
														<tr>
															<td><%=sr1++%></td>
															<td><%=rs1.getInt(1)%></td>
															<td><%=rs1.getInt(2)%></td>
															<td><%=rs1.getString(3)%></td>
															<td><%=rs1.getString(4)%></td>
															<td><%=rs1.getString(15)%></td>
															<td><%=rs1.getString(5)%></td>
															<td><%=rs1.getString(7)%></td>
															<td><%=rs1.getString(6)%></td>
															<td><%=rs1.getString(13)%> %</td>
															<td><%=rs1.getString(14)%></td>


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
												<button type="button" class="btn btn-primary"
													data-dismiss="modal">Close</button>

											</div>
										</div>
									</div>
								</div>


								<button class="btn btn-success btn-lg" data-toggle="modal"
									data-target=".example7" role="button">
									<i class="fas fa-bell"></i> <br />Request
								</button>
								<div class="modal fade bd-example-modal-lg example7"
									tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
									aria-hidden="true">
									<div
										class="modal-dialog  modal-dialog-centered modal-dialog-scrollable modal-lg">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">Students's
													Request Status</h5>

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
															<th scope="row">ReqID</th>
															<th scope="row">Exam Code</th>
															<th scope="row">StudID</th>
															<th scope="row">FacId</th>
															<th scope="row">Stud Name</th>
															<th scope="row">Exam Name</th>
															<th scope="row">Course Name</th>
															<th scope="row">Status</th>
														</tr>
													</tbody>
													<%
													try {

														int sr1 = 1;
														RequestDAO ed1 = new RequestDAO();
														ResultSet rs1 = ed1.getAllData();
														while (rs1.next()) {
													%>

													<tbody>
														<tr>
															<td><%=sr1++%></td>
															<td><%=rs1.getInt(1)%></td>
															<td><%=rs1.getString(2)%></td>
															<td><%=rs1.getInt(3)%></td>
															<td><%=rs1.getInt(4)%></td>
															<td><%=rs1.getString(6)%></td>
															<td><%=rs1.getString(9)%></td>
															<td><%=rs1.getString(7)%></td>
															<td><%=rs1.getString(8)%></td>




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
												<button type="button" class="btn btn-primary"
													data-dismiss="modal">Close</button>

											</div>
										</div>
									</div>
								</div>


								<button class="btn btn-warning btn-lg" data-toggle="modal"
									data-target="#logoutModal" role="button">
									<i class="fa fa-sign-out"></i> <br />LogOut
								</button>
								<div class="modal" id="logoutModal" tabindex="-1" role="dialog"
									aria-hidden="true">
									<div class="modal-dialog modal-sm">
										<div class="modal-content">
											<div class="modal-header">
												<h4>
													Log Out <i class="fa fa-lock"></i>
												</h4>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">×</span>
												</button>
											</div>
											<div class="modal-body">
												<p>
													<i class="fa fa-question-circle"></i> Are you sure you want
													to log-off? <br />
												</p>
												<div class="actionsBtns">
													<form action="Index.jsp" method="post">
														<input type="hidden" name="${_csrf.parameterName}"
															value="${_csrf.token}" /> <input type="submit"
															class="btn btn-default btn-primary" 
															value="Logout" />
														<button class="btn btn-default" data-dismiss="modal">Cancel</button>
													</form>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<a href="http://www.jquery2dotnet.com/"
							class="btn btn-success btn-lg btn-block" role="button"><span
							class="glyphicon glyphicon-copy"></span>Copyright 2021-22 </a>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
