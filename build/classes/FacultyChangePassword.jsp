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
<title>Change Password</title>
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
<script src="sweetalert2.all.min.js"></script>
<script src="sweetalert2.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<style>
.mainDiv {
	display: flex;
	min-height: 100%;
	margin-top: 30px;
	align-items: center;
	justify-content: center;
	background-color: #f9f9f9;
	font-family: 'Open Sans', sans-serif;
}

.cardStyle {
	width: 500px;
	border-color: white;
	background: #fff;
	padding: 36px 0;
	border-radius: 4px;
	margin: 30px 0;
	box-shadow: 0px 0 2px 0 rgba(0, 0, 0, 0.25);
}

#signupLogo {
	max-height: 100px;
	margin: auto;
	display: flex;
	flex-direction: column;
}

.formTitle {
	font-weight: 600;
	margin-top: 20px;
	color: #2F2D3B;
	text-align: center;
}

.inputLabel {
	font-size: 12px;
	color: #555;
	margin-bottom: 6px;
	margin-top: 24px;
}

.inputDiv {
	width: 70%;
	display: flex;
	flex-direction: column;
	margin: auto;
}

input {
	height: 40px;
	font-size: 16px;
	border-radius: 4px;
	border: none;
	border: solid 1px #ccc;
	padding: 0 11px;
}

input:disabled {
	cursor: not-allowed;
	border: solid 1px #eee;
}

.buttonWrapper {
	margin-top: 40px;
}

.submitButton {
	width: 70%;
	height: 40px;
	margin: auto;
	display: block;
	color: #fff;
	background-color: #065492;
	border-color: #065492;
	text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.12);
	box-shadow: 0 2px 0 rgba(0, 0, 0, 0.035);
	border-radius: 4px;
	font-size: 14px;
	cursor: pointer;
}

.submitButton:disabled, button[disabled] {
	border: 1px solid #cccccc;
	background-color: #cccccc;
	color: #666666;
}

#loader {
	position: absolute;
	z-index: 1;
	margin: -2px 0 0 10px;
	border: 4px solid #f3f3f3;
	border-radius: 50%;
	border-top: 4px solid #666666;
	width: 14px;
	height: 14px;
	-webkit-animation: spin 2s linear infinite;
	animation: spin 2s linear infinite;
}

@
keyframes spin { 0% {
	transform: rotate(0deg);
}
100
%
{
transform
:
rotate(
360deg
);
}
}
</style>

</head>
<body class="hold-transition sidebar-mini layout-fixed">

	<%@include file="all_component/faculty-navbar.jsp"%>
	<nav aria-label="breadcrumb" class="main-breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="FacultyDashboard.jsp">Dashboard</a></li>

			<li class="breadcrumb-item active" aria-current="page">Change
				Password</li>
		</ol>
	</nav>



	<div class="mainDiv">
		<div class="cardStyle">
			<form action="ChangepasswordServlet" method="post" name="signupForm"
				id="signupForm">
				<%
				String msg1 = (String) session.getAttribute("pass-notMatch");
				if (msg1 != null) {
				%>

				<div class="alert alert-danger alert-dismissible text-center">
					<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
					<b><h5><%=msg1%></h5></b>
				</div>
				<%
				}
				session.removeAttribute("pass-notMatch");
				%>
				<%
				String msg4 = (String) session.getAttribute("oldpass");
				if (msg4 != null) {
				%>

				<div class="alert alert-danger alert-dismissible text-center">
					<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
					<b><h5><%=msg4%></h5></b>
				</div>
				<%
				}
				session.removeAttribute("oldpass");
				%>
				<%
				try {
					boolean msg2 = (boolean) session.getAttribute("pass-update-success");
					if (msg2 == true) {
				%>
				<div id="div1">
					<script type="text/javascript">
						Swal.fire('Congrats.!!',
								'Your Password Updated Successfully&#128077',
								'success')
					</script>
				</div>

				<%
				}
				} catch (Exception e) {
				//e.printStackTrace();
				}
				session.removeAttribute("pass-update-success");
				%>
				<%
				try {
					boolean msg3 = (boolean) session.getAttribute("pass-update-fail");
					if (msg3 == false) {
				%>
				<div id="div1">
					<script type="text/javascript">
						Swal.fire('Ooops.!!', 'Something went wrog on server.',
								'warning')
					</script>
				</div>
				<%
				}
				} catch (Exception e) {
				//e.printStackTrace();
				}
				session.removeAttribute("pass-update-fail");
				%>
				<img src="" id="signupLogo" />

				<h2 class="formTitle">Change your password</h2>

				<div class="inputDiv">
					<label class="inputLabel" for="password">Old Password</label> <input
						type="password" id="oldpassword" name="oldpassword" required>
				</div>
				<div class="inputDiv">
					<label class="inputLabel" for="password">New Password</label> <input
						type="password" id="password" name="password" required>
				</div>

				<div class="inputDiv">
					<label class="inputLabel" for="confirmPassword">Confirm
						Password</label> <input type="password" id="confirmPassword"
						name="confirmPassword">
				</div>

				<div class="buttonWrapper">
					<button type="submit" id="submitButton"
						class="submitButton pure-button pure-button-primary">
						<span>Change</span>
					</button>
				</div>

			</form>
		</div>
	</div>
	<script src="js/secure.js"></script>
</body>
</html>