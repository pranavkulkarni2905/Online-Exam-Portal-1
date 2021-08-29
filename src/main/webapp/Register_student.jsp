<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Register | ThinkExam</title>
<link href="css/register.css" rel="stylesheet">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

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
<style>
body {
	background: linear-gradient(to bottom, #33ccff 0%, #ff99cc 100%);
}
</style>
</head>
<body>

	<div class="container">
		<h1 class="well">
			<img src="images/logo.png" class="logo" width="120px"> Student
			Registration Form<br>
			<%
			String msg = (String) session.getAttribute("stud-reg-success");
			if (msg != null) {
			%>
			<div class="alert alert-success alert-dismissible text-center">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<b><h5><%=msg%>Click Here to <a
							href="https://mail.google.com/">Verify</a>
					</h5></b>
			</div>
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

		</h1>
		<div class="col-lg-12 well">

			<div class="row">
				<form action="RegisterStudentServlet" method="post">
					<div class="col-sm-12">

						<div class="row">
							<div class="col-sm-6 form-group">
								<label>First Name</label> <input type="text"
									placeholder="Enter First Name Here.." class="form-control"
									name="fname" required="required" id="fname"
									pattern="[A-Za-z]{1,20}"
									title="First Name should only contain letters. e.g. john">
							</div>
							<div class="col-sm-6 form-group">
								<label>Last Name</label> <input type="text"
									placeholder="Enter Last Name Here.." class="form-control"
									name="lname" required="required" id="lname"
									pattern="[A-Za-z]{1,20}"
									title="Last Name should only contain letters. e.g. john">
							</div>
						</div>

						<div class="row">
							<div class="col-sm-4 form-group">
								<label>City</label> <input type="text"
									placeholder="Enter City Name Here.." class="form-control"
									name="city" required="required">
							</div>
							<div class="col-sm-4 form-group">
								<label>State</label> <input type="text"
									placeholder="Enter State Name Here.." class="form-control"
									name="state" required="required">
							</div>

							<div class="col-sm-4 form-group">
								<label>Gender</label> <select class="form-control" name="gender"
									required="required">
									<option>Male</option>
									<option>Female</option>
									<option>Other</option>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-4 form-group">
								<label>Date Of Birth</label> <input type="date" placeholder="."
									class="form-control" name="dob" required="required">
							</div>
							<div class="col-sm-4 form-group">
								<label>Profile Photo</label> <input type="file"
									class="form-control" name="photo" required="required">
							</div>
						</div>
						<div class="row">
							<div class="col-sm-6 form-group">
								<label>Phone Number</label> <input type="text"
									placeholder="Enter Phone Number Here.." class="form-control"
									name="mob" maxlength="10" min="10" required="required">
							</div>
							<div class="col-sm-6 form-group">
								<label>Email Address</label> <input type="email"
									placeholder="Enter Email Address Here.." class="form-control"
									name="email" required="required">
							</div>
						</div>
						<div class="form-group">

							<label>Password</label> <input type="password" id="psw"
								placeholder="Enter Password Here.." class="form-control"
								name="pass" pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$"
								title="Password must contain: Minimum 8 characters atleast 1 Alphabet and 1 Number"
								required="required">

						</div>
						<div class="row">
							<div class="col-sm-6 form-group">
								<label>Confirm Password</label> <input type="password"
									placeholder="Confirm Password Here.." class="form-control"
									name="cnf_pass" required="required">
							</div>
							<div class="col-sm-6 form-group" id="div1"></div>
						</div>
						<button onclick="validate()" type="submit"
							class="btn btn-success ">Register</button>
						&nbsp&nbsp&nbsp <a href="Index.jsp" class="btn btn-info">Home</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script>
		function validate() {
			var regName = '/^[a-zA-Z]+ [a-zA-Z]+$/';
			var fname = document.getElementById('fname').value;
			var lname = document.getElementById('lname').value;
			if (!regName.test(fname)) {
				Swal.fire({
					title : "Error!!!",
					text : "Please Enter Proper & Correct Name..",
					icon : "error",
					confirmButtonClass : "btn-danger",
					confirmButtonText : "Okay..Noted it.!",
					closeOnConfirm : true
				})
				document.getElementById('fname').focus();
				return false;
			} else {
				//alert('Valid name given.');
				return true;
			}

			if (!regName.test(lname)) {
				Swal.fire({
					title : "Error!!!",
					text : "Please Enter Proper & Correct Name..",
					icon : "error",
					confirmButtonClass : "btn-danger",
					confirmButtonText : "Okay..Noted it.!",
					closeOnConfirm : true
				})
				document.getElementById('lname').focus();
				return false;
			} else {
				//alert('Valid name given.');
				return true;
			}
		}
	</script>
</body>
</html>