<!DOCTYPE html>
<%@page import="com.exam.DAO.facultyDAO"%>
<%@page import="com.exam.DAO.studentDAO"%>
<%@page import="com.exam.verify.sendHtmlMail"%>
<%@page import="com.exam.verify.SendMail"%>
<%@page import="com.exam.verify.ExistMail"%>

<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Login | ThinkExam</title>
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
<script src="https://www.google.com/recaptcha/api.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="css/login.css" rel="stylesheet">
<%@include file="all_component/allLinks.jsp"%>

<script src="sweetalert2.all.min.js"></script>
<script src="sweetalert2.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

 <script src="backNoWork.js" type="text/javascript"></script>

<style>
#div1 {
	font-family: "Open Sans", -apple-system, BlinkMacSystemFont, "Segoe UI",
		Roboto, Oxygen-Sans, Ubuntu, Cantarell, "Helvetica Neue", Helvetica,
		Arial, sans-serif;
}
</style>
</head>
<body onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">
	

	<div class="container-fluid px-1 px-md-5 px-lg-1 px-xl-5 py-5 mx-auto">
		<div class="card card0 border-0">
			<%
			String msg1 = (String) session.getAttribute("email");
			if (msg1 != null) {
			%>

			<div class="alert alert-danger alert-dismissible text-center">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<b><h5><%=msg1%></h5></b>
			</div>
			<%
			}
			session.removeAttribute("email");
			%>
			<%try{
			boolean msg2 = (boolean) session.getAttribute("pass-update-success");
			if (msg2==true) {
			%>
			<div id="div1">
				<script type="text/javascript">
					Swal.fire('Congrats.!!',
				'Your Password Updated Successfully&#128077'
					, 'success')
				</script>
			</div>

			<%
			}
			}catch(Exception e){
				//e.printStackTrace();
			}
			session.removeAttribute("pass-update-success");
			%>
			<%try{
			boolean msg3 = (boolean) session.getAttribute("pass-update-fail");
			if (msg3==false) {
			%>
			<div id="div1">
				<script type="text/javascript">
					Swal.fire('Ooops.!!',
				'Something went wrog on server.'
					, 'warning')
				</script>
			</div>

			<%
			}
			}catch(Exception e){
				//e.printStackTrace();
			}
			session.removeAttribute("pass-update-fail");
			%>
			<%try{
			boolean msg4 = (boolean) session.getAttribute("verify-email");
			if (msg4==true) {
			%>
			<div id="div1">
				<script type="text/javascript">
					Swal.fire('Congrats.!!',
				'Your Email Verification Process Successfuly Done.Now You Can Login.&#128077'
					, 'success')
				</script>
			</div>

			<%
			}
			}catch(Exception e){
				//e.printStackTrace();
			}
			session.removeAttribute("verify-email");
			%>
			<%
			String msg5 = (String) session.getAttribute("login-fail");
			if (msg5 != null) {
			%>

			<div class="alert alert-danger alert-dismissible text-center">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<b><h5><%=msg5%></h5></b>
			</div>
			<%
			}
			session.removeAttribute("login-fail");
			%>
			<%try{
			boolean msg6 = (boolean) session.getAttribute("not-verify");
			if (msg6==false) {
			%>
			<div id="div1">
				<script type="text/javascript">
					Swal.fire('Ooops.!!',
				'Please Verify Your Email First..We have Already sent you Mail on Registered Email-Id.'
					, 'warning')
				</script>
			</div>

			<%
			}
			}catch(Exception e){
				//e.printStackTrace();
			}
			session.removeAttribute("not-verify");
			%>
			<%try{
			boolean msg7 = (boolean) session.getAttribute("verify-email-fail");
			if (msg7==false) {
			%>
			<div id="div1">
				<script type="text/javascript">
					Swal.fire('Ooops.!!',
				'Something Went Wrong During Email Verification.Please Try Again Later'
					, 'warning')
				</script>
			</div>

			<%
			}
			}catch(Exception e){
				//e.printStackTrace();
			}
			session.removeAttribute("verify-email-fail");
			%>
			<%
			String msg8 = (String) session.getAttribute("captacha-fail");
			if (msg8 != null) {
			%>

			<div class="alert alert-danger alert-dismissible text-center">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<b><h5><%=msg8%></h5></b>
			</div>
			<%
			}
			session.removeAttribute("captacha-fail");
			%>
			<%
			
			String msg9 = (String) session.getAttribute("logout-msg");
			if (msg9 != null) {
			%>

			<div class="alert alert-success alert-dismissible text-center">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<b><h5><%=msg9%></h5></b>
			</div>
			<%
			}
			session.removeAttribute("logout-msg");
			%>
			<%
			
			String msg10 = (String) session.getAttribute("pls-login");
			if (msg10 != null) {
			%>

			<div class="alert alert-danger alert-dismissible text-center">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<b><h5><%=msg10%></h5></b>
			</div>
			<%
			}
			session.removeAttribute("pls-login");
			%>
			<%
			
			String msg11 = (String) session.getAttribute("e1");
			if (msg11 != null) {
			%>

			<div class="alert alert-success alert-dismissible text-center">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<b><h5><%=msg11%></h5></b>
			</div>
			<%
			}
			session.removeAttribute("e1");
			%>
			<div class="row d-flex">
				<div class="col-lg-6">
					<div class="card1 pb-5">
						<div class="row">
							<img src="images/logo.png" class="logo">
						</div>
						<div class="row px-3 justify-content-center mt-4 mb-5 border-line">
							<img src="images/signin-image.jpg" class="image">
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="card2 card border-0 px-4 py-5">
						<div class="row mb-4 px-3">
							<h6 class="mb-0 mr-4 mt-2">Sign in with</h6>
							<div class="facebook text-center mr-3">
								<div class="fa fa-facebook"></div>
							</div>
							<div class="twitter text-center mr-3">
								<div class="fa fa-twitter"></div>
							</div>
							<div class="linkedin text-center mr-3">
								<div class="fa fa-linkedin"></div>
							</div>
						</div>
						<div class="row px-3 mb-4">
							<div class="line"></div>
							<small class="or text-center">Or</small>
							<div class="line"></div>
						</div>
						<form action="LoginServlet" method="post">
						<div class="row px-3">
							<label class="mb-1">
								<h6 class="mb-0 text-sm">Email Address</h6>
							</label> <input class="mb-4" type="text" name="email"
								placeholder="Enter a valid email address">
						</div>
						<div class="row px-3">
							<label class="mb-1">
								<h6 class="mb-0 text-sm">Password</h6>
							</label> <input type="password" name="password"
								placeholder="Enter password">
						</div>
						<div class="row px-3 mb-4">
							<div class="custom-control custom-checkbox custom-control-inline">
								<input id="chk1" type="checkbox" name="chk"
									class="custom-control-input"> <label for="chk1"
									class="custom-control-label text-sm">Remember me</label>
							</div>
							<a href="#" class="ml-auto mb-0 text-sm" data-target="#pwdModal"
								data-toggle="modal">Forgot Password?</a>
						</div>
						 <div class="g-recaptcha"
            data-sitekey="6Ld75VQcAAAAAKIMT--F72zfh0uugcfrmaGiHIBL"></div><br>
						<div class="row mb-3 px-3">
							<button type="submit" class="btn btn-blue text-center">Login</button>
							&nbsp&nbsp&nbsp
							<a href="Index.jsp" class="btn btn-primary text-center">Home</a>
						</div>
						<div class="row mb-4 px-3">
							<small class="font-weight-bold">Don't have an account? <a
								href="Index.jsp" class="text-danger ">Register</a></small>
						</div>
						</form>
					</div>
				</div>
			</div>
			<div class="bg-blue py-4">
				<div class="row px-3">
					<small class="ml-4 ml-sm-5 mb-2">Copyright &copy; 2021. All
						rights reserved.</small>
					<div class="social-contact ml-4 ml-sm-auto">
						<span class="fa fa-facebook mr-4 text-sm"></span> <span
							class="fa fa-google-plus mr-4 text-sm"></span> <span
							class="fa fa-linkedin mr-4 text-sm"></span> <span
							class="fa fa-twitter mr-4 mr-sm-5 text-sm"></span>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!--modal-->
	<div id="pwdModal" class="modal fade" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="text-center">What's My Password?</h1>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
				</div>
				<div class="modal-body">
					<div class="col-md-12">
						<div class="panel panel-default">
							<div class="panel-body">
								<div class="text-center">

									<p>If you have forgotten your password you can reset it
										here.</p>
									<div class="panel-body">
										<form action="ForgotPasswordServlet" method="post">
											<fieldset>
												<div class="form-group">
													<input class="form-control input-lg"
														placeholder="E-mail Address" name="email" type="email" required="required">
												</div>
												<input class="btn btn-lg btn-primary btn-block"
													value="Reset Password" type="submit">
											</fieldset>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<div class="col-md-12">
						<button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>