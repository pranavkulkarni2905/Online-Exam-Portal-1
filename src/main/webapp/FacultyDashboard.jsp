<%@page import="com.exam.DAO.courseDAO"%>
<%@page import="com.exam.DAO.questionDAO"%>
<%@page import="com.exam.DAO.examDAO"%>
<%@page import="com.exam.DAO.studentDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.exam.DAO.facultyDAO"%>
<%@page import="com.exam.model.Faculty"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
ServletContext sc1 = request.getServletContext();
Faculty f = (Faculty) sc1.getAttribute("faculty-obj");
if (f == null) {
	session.setAttribute("pls-login", "Please Login Here...");
	response.sendRedirect("Login.jsp");
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>Faculty Dashboard | ThinkExam</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<script src="sweetalert2.all.min.js"></script>
<script src="sweetalert2.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<link
	href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/yourcode.js"
	crossorigin="anonymous"></script>
<style>
.wrapper {
	background: linear-gradient(to bottom, #33ccff 0%, #ff99cc 100%);
}
</style>
</head>
<body class="hold-transition sidebar-mini ">

	<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	%>
	<%
	try {

		Faculty fac = (Faculty) session.getAttribute("fac-obj");
		if (fac != null) {
	%>
	<div id="div1">
		<script type="text/javascript">
			Swal.fire('Congrats.!! &#128525 ', 'Login Successfully..&#128077 ',
					'success')
		</script>
	</div>

	<%
	}
	} catch (Exception e) {
	e.printStackTrace();
	}
	session.removeAttribute("fac-obj");
	%>
	<%int i=0,studCount=0,examCounter=0,quesCount=0,courseCount=0;
	try{
	studentDAO s=new studentDAO();
	 studCount=s.studCounter();
	
	examDAO ed=new examDAO();
	 examCounter=ed.examCounter(f.getFacId());
	
	questionDAO qd=new questionDAO();
	 quesCount=qd.quesCounter(f.getFacId());
	
	courseDAO cd=new courseDAO();
	 courseCount=cd.courseCounter(f.getFacId());
	
	
	
	 i=(int)session.getAttribute("enroll-stud");
	}catch(Exception e){
		e.printStackTrace();
	}
	%>
	<div class="wrapper">

		<%@ include file="all_component/faculty-navbar.jsp"%>
		
		<section class="content">
			<div class="container-fluid">
				<!-- Small boxes (Stat box) -->
				<div class="row">
					<div class="col-lg-4 col-6">
						<!-- small box -->
						<div class="small-box bg-info">
							<div class="inner">
								<h3><%=studCount %></h3>

								<p>Total Registered Students</p>
							</div>
							<div class="icon">
								<i class="ion ion-person-add"></i>
							</div>
							<a href="#" class="small-box-footer">More info <i
								class="fa fa-arrow-circle-right"></i></a>
						</div>
					</div>
					<!-- ./col -->
					<div class="col-lg-4 col-6">
						<!-- small box -->
						<div class="small-box bg-success">
							<div class="inner">
								<h3><%=i %></h3>

								<p>Total Enrolled Students</p>
							</div>
							<div class="icon">
								<i class="fa fa-user-circle-o"></i>
							</div>
							<a href="#" class="small-box-footer">More info <i
								class="fa fa-arrow-circle-right"></i></a>
						</div>
					</div>
					<!-- ./col -->
					<div class="col-lg-4 col-6">
						<!-- small box -->
						<div class="small-box bg-warning">
							<div class="inner">
								<h3><%=examCounter %></h3>

								<p>Total Exams</p>
							</div>
							<div class="icon">
								<i class="fa fa-university"></i>
							</div>
							<a href="#" class="small-box-footer">More info <i
								class="fa fa-arrow-circle-right"></i></a>
						</div>
					</div>
					<!-- ./col -->
					<div class="col-lg-4 col-6">
						<!-- small box -->
						<div class="small-box bg-danger">
							<div class="inner">
								<h3><%=quesCount %></h3>

								<p>Total Questions</p>
							</div>
							<div class="icon">
								<i class="fa fa-question"></i>
							</div>
							<a href="#" class="small-box-footer">More info <i
								class="fa fa-arrow-circle-right"></i></a>
						</div>
					</div>
					<div class="col-lg-4 col-6">
						<!-- small box -->
						<div class="small-box bg-secondary">
							<div class="inner">
								<h3><%=courseCount %></h3>

								<p>Total Courses</p>
							</div>
							<div class="icon">
								<i class="fa fa-book"></i>
							</div>
							<a href="#" class="small-box-footer">More info <i
								class="fa fa-arrow-circle-right"></i></a>
						</div>
					</div>
				</div>
				<div class="row">
					<section class="col-lg-7 connectedSortable"></section>
				</div>
			</div>
		</section>
		

		<!-- Main content -->

	</div>

	<script src="plugins/jquery/jquery.min.js"></script>
	<script src="plugins/jquery-ui/jquery-ui.min.js"></script>

	<script>
		$.widget.bridge('uibutton', $.ui.button)
	</script>

</body>
</html>
