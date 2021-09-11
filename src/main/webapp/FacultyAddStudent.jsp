<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Student | ThinkExam</title>
<%
	ServletContext sc1=request.getServletContext();
	Faculty f=(Faculty)sc1.getAttribute("faculty-obj");
	if(f==null){
		session.setAttribute("pls-login", "Please Login Here...");
		response.sendRedirect("Login.jsp");
	}
	%>
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

  <script src="backNoWork.js" type="text/javascript"></script>
  <style>

.card-registration .select-input.form-control[readonly]:not([disabled])
	{
	font-size: 1rem;
	line-height: 2.15;
	padding-left: .75em;
	padding-right: .75em;
}

.card-registration .select-arrow {
	top: 13px;
}
</style>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">
		<%@ include file="all_component/faculty-navbar.jsp"%>
		<nav aria-label="breadcrumb" class="main-breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="FacultyDashboard.jsp">Dashboard</a></li>

				<li class="breadcrumb-item active" aria-current="page">Add
					Student</li>
			</ol>
		</nav>
		<section class="h-100">
		<div class="container py-5 h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col">
					<div class="card card-registration my-4">
						<div class="row g-0">
							<div class="col-xl-6 d-none d-xl-block">
								<img src="images/1.jpg" alt="Sample photo" class="img-fluid"
									style="border-top-left-radius: .25rem; border-bottom-left-radius: .25rem; height: 600px;" />
							</div>
							<div class="col-xl-6">
								<div class="card-body p-md-5 text-black">
									<h3 class="mb-5 text-uppercase">Add New Student</h3>
									<%
			String msg = (String) session.getAttribute("stud-reg-success");
			if (msg != null) {
			%><script>
			Swal.fire({
		    		  title: "Done..!!",
		    		  text: "Student Added Successfully..Login Credentials Mail Sent On Registered Email-Id.",
		    		  icon: 'success',
		    		  confirmButtonColor: '#d33',
		    		  //confirmButtonClass: "btn-danger",
		    		  confirmButtonText: 'Okay!',
		    		  closeOnConfirm: true
		    		}
		    	)
		    	</script>
			<%
			}
			session.removeAttribute("stud-reg-success");
			%>
			<%
			String msg1 = (String) session.getAttribute("stud-reg-fail");
			if (msg1 != null) {
			%>

			<div class="alert alert-danger alert-dismissible text-center">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<b><h5><%=msg1%></h5></b>
			</div>
			<%
			}
			session.removeAttribute("stud-reg-fail");
			%>
			<%
			String msg3 = (String) session.getAttribute("stud-email-fail");
			if (msg3 != null) {
			%>
			<div class="alert alert-danger alert-dismissible text-center">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<b><h5><%=msg3%></h5></b>
			</div>
			<%
			}
			session.removeAttribute("stud-email-fail");
			%>
			<%
			String msg4 = (String) session.getAttribute("stud-mob-inValid");
			if (msg4 != null) {
			%>

			<div class="alert alert-danger alert-dismissible text-center">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<b><h5><%=msg4%></h5></b>
			</div>
			<%
			}
			session.removeAttribute("stud-mob-inValid");
			%>
			<%
			String msg5 = (String) session.getAttribute("stud-email-inValid");
			if (msg5 != null) {
			%>

			<div class="alert alert-danger alert-dismissible text-center">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<b><h5><%=msg5%></h5></b>
			</div>
			<%
			}
			session.removeAttribute("stud-email-inValid");
			%>
			<%
			String msg6 = (String) session.getAttribute("password-notMatch");
			if (msg6 != null) {
			%>

			<div class="alert alert-danger alert-dismissible text-center">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<b><h5><%=msg6%></h5></b>
			</div>
			<%
			}
			session.removeAttribute("password-notMatch");
			%>
									
									<form action="FacultyAddStudentServlet" method="post" enctype="multipart/form-data">
										<div class="row">
											<div class="col-md-6 mb-4">
												<div class="form-outline">
													<input type="text" id="form3Example1m"
														class="form-control form-control-lg" name="fname"
														required="required" id="fname" pattern="[A-Za-z]{1,20}"
														title="First Name should only contain letters. e.g. john" />
													<label class="form-label" for="form3Example1m">First
														name</label>
												</div>
											</div>
											<div class="col-md-6 mb-4">
												<div class="form-outline">
													<input type="text" id="form3Example1n"
														class="form-control form-control-lg" name="lname"
														required="required" id="lname" pattern="[A-Za-z]{1,20}"
														title="Last Name should only contain letters. e.g. john" />
													<label class="form-label" for="form3Example1n">Last
														name</label>
												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-md-6 mb-4">
												<div class="form-outline">
													<input type="text" id="form3Example1m1"
														class="form-control form-control-lg" name="city"
														required="required" /> <label class="form-label"
														for="form3Example1m1">City</label>
												</div>
											</div>
											<div class="col-md-6 mb-4">
												<div class="form-outline">
													<input type="text" id="form3Example1n1"
														class="form-control form-control-lg" name="state"
														required="required" /> <label class="form-label"
														for="form3Example1n1">State</label>
												</div>
											</div>
										</div>

										<div class="form-outline mb-4">
											<input type="number" id="form3Example8"
												class="form-control form-control-lg" name="mob"
												maxlength="10" min="10" required="required" /> <label
												class="form-label" for="form3Example8">Mobile No</label>
										</div>

										<div
											class="d-md-flex justify-content-start align-items-center mb-4 py-2">

											<h6 class="mb-0 me-4">Gender:</h6>

											<div class="form-check form-check-inline mb-0 me-4">
												<input class="form-check-input" type="radio" name="gender"
													id="femaleGender" value="Female" /> <label
													class="form-check-label" for="femaleGender">Female</label>
											</div>

											<div class="form-check form-check-inline mb-0 me-4">
												<input class="form-check-input" type="radio" name="gender"
													id="maleGender" value="Male" /> <label
													class="form-check-label" for="maleGender">Male</label>
											</div>

											<div class="form-check form-check-inline mb-0">
												<input class="form-check-input" type="radio" name="gender"
													id="otherGender" value="Other" /> <label
													class="form-check-label" for="otherGender">Other</label>
											</div>

										</div>



										<div class="row">
											<div class="col-sm-6 form-group">
												<label>Date Of Birth</label> <input type="date"
													placeholder="." class="form-control" name="dob"
													required="required">
											</div>
											<div class="col-sm-6 form-group">
												<label>Profile Photo</label> <input type="file"
													class="form-control" name="photo" accept="image/*"
													required="required" />
											</div>
										</div>
										<br>

										<div class="form-outline mb-4">
											<input type="email" id="form3Example97"
												class="form-control form-control-lg" name="email"
												required="required" /> <label class="form-label"
												for="form3Example97">Email ID</label>
										</div>
										

										<div class="d-flex justify-content-end pt-3">
											
											<button type="submit" class="btn btn-warning btn-lg ms-2">Add Student
												</button>
										</div>
									</form>
								</div>

							</div>

						</div>

					</div>
				</div>
			</div>
		</div>
	</section>
		
		</div>

</body>
</html>