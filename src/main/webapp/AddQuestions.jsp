<!DOCTYPE html>
<%@page import="com.exam.model.Course"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.exam.DAO.courseDAO"%>
<html>
<head>
<title>Add Questions | ThinkExam</title>
<%
	ServletContext sc2=request.getServletContext();
	Faculty f2=(Faculty)sc2.getAttribute("faculty-obj");
	if(f2==null){
		session.setAttribute("pls-login", "Please Login Here...");
		response.sendRedirect("Login.jsp");
	}
	%>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<script src="sweetalert2.all.min.js"></script>
<script src="sweetalert2.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</head>
<style>
.card {
	margin-right: 700px;
	padding-top: 30px;
}

h3 {
	font-size: 30px;
	color: blue;
}
</style>
</head>
<%

%>
<body class="hold-transition sidebar-mini layout-fixed">
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
%>
	<div class="wrapper">
		<%@ include file="all_component/faculty-navbar.jsp"%>
		<%
		try {
			boolean msg1 = (boolean) session.getAttribute("question-add-success");
			if (msg1 == true) {
		%>
		<div id="div1">
			<script type="text/javascript">
				Swal.fire('Done.!!&#9989', 'Question added Successfully&#128077',
						'success')
			</script>
		</div>

		<%
		}
		} catch (Exception e) {
		//e.printStackTrace();
		}
		session.removeAttribute("question-add-success");
		%>
		<%
		try {
			boolean msg2 = (boolean) session.getAttribute("question-add-fail");
			if (msg2 == false) {
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
		session.removeAttribute("question-add-fail");
		%>
		<nav aria-label="breadcrumb" class="main-breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="FacultyDashboard.jsp">Dashboard</a></li>

				<li class="breadcrumb-item active" aria-current="page">Add
					Questions</li>
			</ol>
		</nav>
		<form action="AddQuestionServlet" method="post">
			<div style="width: 100%;">
				<div style="width: 35%; float: left;">

					<div class="card"
						style="width: 80%; margin-left: 10%; padding: 5%;">
						<h3 class="text-center" style="color: blue; font: 20px;">Select
							Course</h3>

						<div class="form-outline mb-4">
							<label class="form-label" for="form1Example1">Course Name
								: &nbsp&nbsp</label> <select class="form-control" name="cname" required="required">
								<option>-- Select Course --</option>
								<%try{
								ServletContext sc1 = request.getServletContext();
								Faculty s = (Faculty) sc1.getAttribute("faculty-obj");
								courseDAO cd = new courseDAO();
								List<Course> lst = cd.getAllDataById(s.getFacId());
								for(Course c:lst) {
									String name = c.getCoursename();
								%>

								<option value="<%=name%>"><%=name%></option>

								<%
								}
								}catch(Exception e){
									e.printStackTrace();
								}
								%>


							</select>
						</div>

						<!-- Submit button -->
						<button type="submit" id="load1"
							class="btn btn-primary text-center form-control"
							style="width: 50%;margin-left:25%" onclick="change_text()">Select</button><br><h4 id="d1" class="text-center"></h4>
						<script>
						function change_text(){
						    document.getElementById("d1").innerHTML = "Selected &#9989";
						}
						</script>
					</div>

				</div>
				<div style="margin-left: 50%; height: 100px;">
					<div class="card" style="width: 80%; margin-left: 10%; padding: 3%">
						<h3 class="text-center" style="color: blue; font: 20px;">Add
							Question</h3>

						<div class="form-outline mb-4">
							<label class="form-label" for="form1Example1">Question :
								&nbsp&nbsp</label>
							<textarea rows="2" cols="0" class="form-control" required="required" placeholder="Type Question Here" name="question"></textarea>
						</div>

						<!-- Password input -->
						<div class="form-outline mb-4 ">
							<label class="form-label" for="form1Example2">Option 1 :
								&nbsp&nbsp</label> <input type="text" id="form1Example2" name="opt1" placeholder="Option 1"
								required />
						</div>
						<div class="form-outline mb-4">
							<label class="form-label" for="form1Example2">Option 2 :
								&nbsp&nbsp</label> <input type="text" id="form1Example2" name="opt2" placeholder="Option 2"
								required />
						</div>
						<div class="form-outline mb-4">
							<label class="form-label" for="form1Example2">Option 3 :
								&nbsp&nbsp</label> <input type="text" id="form1Example2" name="opt3" placeholder="Option 3"
								required />
						</div>
						<div class="form-outline mb-4">
							<label class="form-label" for="form1Example2">Option 4 :
								&nbsp&nbsp</label> <input type="text" id="form1Example2" name="opt4" placeholder="Option 4"
								required />
						</div>
						<div class="form-outline mb-4">
							<label class="form-label" for="form1Example2">Correct
								Answer <select class="form-control" style="width: 100%" name="correct">
									<option>-- &nbsp&nbspChoose Correct Answer Option&nbsp&nbsp --</option>
									<option>Option 1</option>
									<option>Option 2</option>
									<option>Option 3</option>
									<option>Option 4</option>
							</select>
						</div>
						<!-- Submit button -->
						<button type="submit" class="btn btn-primary" style="width: 50%">Add
							Question</button>

					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
