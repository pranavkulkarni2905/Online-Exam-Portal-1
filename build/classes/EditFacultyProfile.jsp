<%@page import="com.exam.model.Faculty"%>
<%@page import="com.exam.DAO.facultyDAO"%>
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
<title>Edit Profile</title>
<script src="js/secure.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/profile.css">
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
%>
<%
	int facId = Integer.parseInt(request.getParameter("fac_id"));
	facultyDAO sd = new facultyDAO();
	Faculty f = sd.getDataById(facId);
	%>

	<div class="wrapper">

		<%@ include file="all_component/faculty-navbar.jsp"%>

		<div class="container">
			<div class="main-body">

				<!-- Breadcrumb -->
				<nav aria-label="breadcrumb" class="main-breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="FacultyDashboard.jsp">Dashboard</a></li>
						<li class="breadcrumb-item"><a href="FacultyProfile.jsp">My Profile</a></li>

						<li class="breadcrumb-item active" aria-current="page">Edit
							Profile</li>
					</ol>
				</nav>
				<!-- /Breadcrumb -->

				<div class="row gutters-sm">
					<div class="col-md-4 mb-3">
						<div class="card">
							<div class="card-body">
								<div class="d-flex flex-column align-items-center text-center">
									<img src="profile_images/<%=f.getPhoto() %>"
										alt="Admin" class="rounded-circle" width="150">
									<div class="mt-3">
										<h4><%=f.getFname()%>&nbsp<%=f.getLname()%></h4>
										<button class="btn btn-outline-primary">
											Id :
											<%=f.getFacId()%></button>
									</div>
								</div>
							</div>
						</div>

					</div>

					<input type="hidden" value="<%=facId%>" name="facid">
					<div class="col-md-12">

						<div class="card mb-3">
							<form action="EditFacultyProfileServlet" method="post">
								<div class="card-body">

									<div class="row">
										<div class="col-sm-4">
											<h6 class="mb-0">Faculty Id</h6>
										</div>
										<div class="col-sm-8 ">
											<input type="text" class="form-control"
												value="<%=f.getFacId()%>" name="fid" readonly="readonly">
										</div>
									</div>
									<hr>
									<div class="row">
										<div class="col-sm-4">
											<h6 class="mb-0">Full Name</h6>
										</div>
										<div class="col-sm-8 text-secondary">
											<input type="text" class="form-control"
												value="<%=f.getFname()%> <%=f.getLname()%>"
												readonly="readonly">
										</div>
									</div>
									<hr>
									<div class="row">
										<div class="col-sm-4">
											<h6 class="mb-0">Email</h6>
										</div>
										<div class="col-sm-8 text-secondary">
											<input type="text" class="form-control"
												value="<%=f.getEmail()%>" name="email" required="required">
										</div>
									</div>
									<hr>
									<div class="row">
										<div class="col-sm-4">
											<h6 class="mb-0">Mobile</h6>
										</div>
										<div class="col-sm-8 text-secondary">
											<input type="text" class="form-control"
												value="<%=f.getMobno()%>" name="mob" required="required">
										</div>
									</div>
									<hr>
									<div class="row">
										<div class="col-sm-4">
											<h6 class="mb-0">Date Of Birth</h6>
										</div>
										<div class="col-sm-8 text-secondary">
											<input type="date" class="form-control"
												value="<%=f.getDob()%>" name="dob" required="required">
										</div>
									</div>
									<hr>
									<div class="row">
										<div class="col-sm-4">
											<h6 class="mb-0">Gender</h6>
										</div>
										<div class="col-sm-8 text-secondary">
											<input type="text" class="form-control"
												value="<%=f.getGender()%>" name="gender" readonly="readonly">
										</div>
									</div>
									<hr>
									<div class="row">
										<div class="col-sm-4">
											<h6 class="mb-0">Education</h6>
										</div>
										<div class="col-sm-8 text-secondary">
											<input type="text" class="form-control"
												value="<%=f.getEducation()%>" name="education" required="required">
										</div>
									</div>
									<hr>
									
									<div class="row">
										<div class="col-sm-12">
											<button class="btn btn-success" >Save
												Changes</button>
										</div>
									</div>
								</div>

							</form>
						</div>

					</div>
				</div>



			</div>
		</div>

	</div>


	<script src="plugins/jquery/jquery.min.js"></script>
	<script src="plugins/jquery-ui/jquery-ui.min.js"></script>

	<script>
		$.widget.bridge('uibutton', $.ui.button)
	</script>
	<script src="js/secure.js"></script>
</body>
</html>