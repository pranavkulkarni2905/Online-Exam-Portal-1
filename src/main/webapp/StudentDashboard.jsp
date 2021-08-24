<%@page import="com.exam.DAO.RequestDAO"%>
<%@page import="com.exam.DAO.examDAO"%>
<%@page import="com.exam.model.Student"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%
	ServletContext sc1=request.getServletContext();
	Student s=(Student)sc1.getAttribute("student-obj");
	if(s==null){
		session.setAttribute("pls-login", "Please Login Here...");
		response.sendRedirect("Login.jsp");
	}
	%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Student Dashboard | ThinkExam</title>
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
<link
	href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/yourcode.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
	
	<script src="sweetalert2.all.min.js"></script>
<script src="sweetalert2.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>

.wrapper {
	background: linear-gradient(to bottom, #33ccff 0%, #ff99cc 100%);
}
</style>

</head>
<body class="hold-transition sidebar-mini layout-fixed" onload="noBack();" 
	onpageshow="if (event.persisted) noBack();" onunload="">
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
%>
<%try{
	
			Student stud = (Student) session.getAttribute("stud-obj");
			if (stud!=null) {
			%>
			<div id="div1">
				<script type="text/javascript">
					Swal.fire('Congrats.!! &#128525 ',
				'Login Successfully..&#128077 '
					, 'success')
				</script>
			</div>

			<%
			}
			}catch(Exception e){
				e.printStackTrace();
			}
			session.removeAttribute("stud-obj");
			%>
			
			<%
			int exam=0,enroll=0,decline=0,complete=0;
			try{
				examDAO ed=new examDAO();
				exam=ed.totalExam();
				RequestDAO rd=new RequestDAO();
				enroll=rd.requestCounter("Accepted", s.getStudId());
				decline=rd.requestCounter("Declined", s.getStudId());
				complete=rd.examCompletedCounter("Yes",s.getStudId());
			}catch(Exception e){
				e.printStackTrace();
			}
			%>
	<div class="wrapper">

		<%@ include file="all_component/student-navbar.jsp"%>


		<!-- Main content -->
		<section class="content">
			<div class="container-fluid">
				<!-- Small boxes (Stat box) -->
				<div class="row">
					<div class="col-lg-4 col-6">
						<!-- small box -->
						<div class="small-box bg-info">
							<div class="inner">
								<h3><%=exam %></h3>

								<p>Total Exams</p>
							</div>
							<div class="icon">
								<i class="fa fa-calculator"></i>
							</div>
							<a href="#" class="small-box-footer">More info <i
								class="fas fa-arrow-circle-right"></i></a>
						</div>
					</div>
					<!-- ./col -->
					<div class="col-lg-4 col-6">
						<!-- small box -->
						<div class="small-box bg-success">
							<div class="inner">
								<h3>
									<%=enroll %>
								</h3>

								<p>Total Enrolled Exams</p>
							</div>
							<div class="icon">
								<i class="fa fa-registered"></i>
							</div>
							<a href="#" class="small-box-footer">More info <i
								class="fas fa-arrow-circle-right"></i></a>
						</div>
					</div>
					<!-- ./col -->
					<div class="col-lg-4 col-6">
						<!-- small box -->
						<div class="small-box bg-warning">
							<div class="inner">
								<h3><%=decline %></h3>

								<p>Declined Requests</p>
							</div>
							<div class="icon">
								<i class="fa fa-close"></i>
							</div>
							<a href="#" class="small-box-footer">More info <i
								class="fas fa-arrow-circle-right"></i></a>
						</div>
					</div>
					<!-- ./col -->
					<div class="col-lg-4 col-6">
						<!-- small box -->
						<div class="small-box bg-danger">
							<div class="inner">
								<h3><%=complete %></h3>

								<p>Exams Completed</p>
							</div>
							<div class="icon">
								<i class="fa fa-check-square-o"></i>
							</div>
							<a href="#" class="small-box-footer">More info <i
								class="fas fa-arrow-circle-right"></i></a>
						</div>
					</div>
				</div>
				<div class="row">
					<section class="col-lg-7 connectedSortable"></section>
				</div>
			</div>
		</section>
	</div>
	</div>
	<script src="plugins/jquery/jquery.min.js"></script>
	<script src="plugins/jquery-ui/jquery-ui.min.js"></script>

	<script>
		$.widget.bridge('uibutton', $.ui.button)
	</script>

</body>
</html>
