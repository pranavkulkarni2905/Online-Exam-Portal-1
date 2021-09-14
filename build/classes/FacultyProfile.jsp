<%@page import="com.exam.DAO.facultyDAO"%>
<%@page import="com.exam.model.Faculty"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
	ServletContext sc2=request.getServletContext();
	Faculty f=(Faculty)sc2.getAttribute("faculty-obj");
	if(f==null){
		session.setAttribute("pls-login", "Please Login Here...");
		response.sendRedirect("Login.jsp");
	}
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Faculty Profile</title>
<script src="js/secure.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/profile.css">
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
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
%>
	<div class="wrapper">
	<%@ include file="all_component/faculty-navbar.jsp"%>
		
		<div class="container">
			<div class="main-body">
				<%
				String msg1 = (String) session.getAttribute("profile-update-success");
				if (msg1 != null) {
				%>
				<div class="alert alert-success alert-dismissible text-center">
					<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
					<b><h5><%=msg1%>
						</h5></b>
				</div>
				<%
				}
				session.removeAttribute("profile-update-success");
				%>
				<%
				String msg2 = (String) session.getAttribute("profile-update-fail");
				if (msg2 != null) {
				%>
				<div class="alert alert-success alert-dismissible text-center">
					<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
					<b><h5><%=msg2%>
						</h5></b>
				</div>
				<%
				}
				session.removeAttribute("profile-update-fail");
				%>
				<!-- Breadcrumb -->
				<nav aria-label="breadcrumb" class="main-breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="FacultyDashboard.jsp">Dashboard</a></li>

						<li class="breadcrumb-item active" aria-current="page">User
							Profile</li>
					</ol>
				</nav>
				<!-- /Breadcrumb -->
				<%try{
				ServletContext sc1 = request.getServletContext();
				Faculty s = (Faculty) sc1.getAttribute("faculty-obj");
			facultyDAO sd = new facultyDAO();
				Faculty fac1 = sd.getDataById(s.getFacId());
				if (fac1 != null) {
					//https://bootdey.com/img/Content/avatar/avatar7.png
				%>
				<div class="row gutters-sm">
					<div class="col-md-4 mb-3">
						<div class="card">
							<div class="card-body">
								<div class="d-flex flex-column align-items-center text-center">
									<img src="profile_images/<%=fac1.getPhoto() %>"
										alt="Admin" class="rounded-circle" width="150">
									<div class="mt-3">
										<h4><%=fac1.getFname()%>&nbsp<%=fac1.getLname()%></h4>
										<button class="btn btn-outline-primary">
											Id :
											<%=fac1.getFacId()%></button>
									</div>
								</div>
							</div>
						</div>

					</div>
					<div class="col-md-8">
						<div class="card mb-3">
							<div class="card-body">
								<div class="row">
									<div class="col-sm-3">
										<h6 class="mb-0">Faculty Id</h6>
									</div>
									<div class="col-sm-9 text-secondary"><%=fac1.getFacId()%></div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<h6 class="mb-0">Full Name</h6>
									</div>
									<div class="col-sm-9 text-secondary"><%=fac1.getFname()%>&nbsp<%=fac1.getLname()%></div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<h6 class="mb-0">Email</h6>
									</div>
									<div class="col-sm-9 text-secondary"><%=fac1.getEmail()%></div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<h6 class="mb-0">Mobile</h6>
									</div>
									<div class="col-sm-9 text-secondary"><%=fac1.getMobno()%></div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<h6 class="mb-0">Date Of Birth</h6>
									</div>
									<div class="col-sm-9 text-secondary"><%=fac1.getDob()%></div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<h6 class="mb-0">Gender</h6>
									</div>
									<div class="col-sm-9 text-secondary"><%=fac1.getGender()%></div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<h6 class="mb-0">Education</h6>
									</div>
									<div class="col-sm-9 text-secondary"><%=fac1.getEducation()%></div>
								</div>
								
								<hr>
								<div class="row">
									<div class="col-sm-12">
										<a class="btn btn-info"
											href="EditFacultyProfile.jsp?fac_id=<%=fac1.getFacId()%>"><i class="fa fa-pencil"></i> Edit</a>
									</div>
								</div>
							</div>
						</div>


					</div>
				</div>


				<%
				}
				}catch(Exception e){
					e.printStackTrace();
				}
				%>



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