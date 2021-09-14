<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Register | ThinkExam</title>


<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="js/secure.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<script src="sweetalert2.all.min.js"></script>
<script src="sweetalert2.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script src="sweetalert2.all.min.js"></script>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
	crossorigin="anonymous"></script>
<style>
body {
	background: background: rgb(2,0,36);
background: linear-gradient(90deg, rgba(2,0,36,1) 0%, rgba(14,42,175,0.9727241238292192) 35%, rgba(0,212,255,1) 100%);;
}
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
<body>
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
									<h3 class="mb-5 text-uppercase">Student registration form</h3>
									<%
			String msg = (String) session.getAttribute("stud-reg-success");
			if (msg != null) {
			%><script>
			Swal.fire({
		    		  title: "Done..!!",
		    		  text: "Registration Successfully..We Have Sent a Mail To Verify Your Account.Please Verify Before Login, without verification you can't Login.",
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
									
									<form action="RegisterStudentServlet" method="post" enctype="multipart/form-data">
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
													class="form-control" name="image" accept="image/*" 
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
										<div class="form-outline mb-4">
											<input type="password" id="form3Example99"
												class="form-control form-control-lg" name="pass"
												pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$"
												title="Password must contain: Minimum 8 characters atleast 1 Alphabet and 1 Number"
												required="required" /> <label class="form-label"
												for="form3Example99">Password</label>
										</div>
										<div class="form-outline mb-4">
											<input type="password" id="form3Example99"
												class="form-control form-control-lg" name="cnf_pass"
												required="required" /> <label class="form-label"
												for="form3Example99">Confirm Password</label>
										</div>


										<div class="d-flex justify-content-end pt-3">
											<a href="Index.jsp"><button type="button" class="btn btn-primary btn-lg">Home
												</button></a>
											<button type="submit" class="btn btn-warning btn-lg ms-2">Register
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
	<script src="js/secure.js"></script>
</body>
</html>