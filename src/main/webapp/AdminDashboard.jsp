<%@page import="java.sql.ResultSet"%>
<%@page import="com.exam.DAO.studentDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Pannel</title>


<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>


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
.panel{
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
<body>

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
						</h3><hr>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-xs-6 col-md-6">
								<button class="btn btn-danger btn-lg" data-toggle="modal"
									data-target=".example1" role="button">
									<i class="fa fa-graduation-cap"></i> <br />
									Students
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


								<button class="btn btn-warning btn-lg" role="button">
									<span class="glyphicon glyphicon-bookmark"></span> <br />
									Faculty
								</button>
								<button class="btn btn-primary btn-lg" role="button">
									<span class="glyphicon glyphicon-signal"></span> <br />Exam
								</button>
								<button class="btn btn-primary btn-lg" role="button">
									<span class="glyphicon glyphicon-comment"></span> <br />Course
								</button>
							</div>
							<div class="col-xs-6 col-md-6">
								<button class="btn btn-success btn-lg" role="button">
									<span class="glyphicon glyphicon-user"></span> <br />Questions
								</button>
								<button class="btn btn-info btn-lg" role="button">
									<span class="glyphicon glyphicon-file"></span> <br />Results
								</button>
								<button class="btn btn-primary btn-lg" role="button">
									<span class="glyphicon glyphicon-picture"></span> <br />Photos
								</button>
								<button class="btn btn-primary btn-lg" role="button">
									<span class="glyphicon glyphicon-tag"></span> <br />Tags
								</button>
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
