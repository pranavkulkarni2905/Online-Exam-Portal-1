<%@page import="com.exam.model.Question"%>
<%@page import="com.exam.DAO.questionDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%
	ServletContext sc1=request.getServletContext();
	Faculty f=(Faculty)sc1.getAttribute("faculty-obj");
	if(f==null){
		session.setAttribute("pls-login", "Please Login Here...");
		response.sendRedirect("Login.jsp");
	}
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Question | ThinkExam</title>
<script src="js/secure.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<script src="sweetalert2.all.min.js"></script>
<script src="sweetalert2.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>
.card {
	margin-right: 50px;
	padding-top: 30px;
}

h3 {
	font-size: 30px;
	color: blue;
}
</style>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
%>
<%
	int qId = Integer.parseInt(request.getParameter("q_id"));
	questionDAO qd=new questionDAO();
	Question c = qd.getDataByQuesId(qId);
	%>
	<div class="wrapper">
		<%@ include file="all_component/faculty-navbar.jsp"%>

		<nav aria-label="breadcrumb" class="main-breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="FacultyDashboard.jsp">Dashboard</a></li>
				<li class="breadcrumb-item"><a href="DisplayQuestion.jsp">All
						Questions</a></li>
				<li class="breadcrumb-item active" aria-current="page">Edit
					Questions</li>
			</ol>
		</nav>
		<form action="EditQuestionServlet" method="post">

			<div style="margin-left: 20%; height: 100px;">
				<div class="card" style="width: 80%; margin-left: 1%; padding: 3%">
					<h3 class="text-center" style="color: blue; font: 20px;">Edit
						Question</h3>
						<input type="hidden" value="<%=c.getqId() %>" name="qid">
					<div class="form-outline mb-4 ">
						<label class="form-label" for="form1Example2">Course Name
							: &nbsp&nbsp</label> <input type="text" id="form1Example2" name="cname"
							 class="form-control-plaintext" required readonly="readonly" value="<%=c.getcName()%>" />
					</div>
					<div class="form-outline mb-4">
						<label class="form-label" for="form1Example1">Question :
							&nbsp&nbsp</label>
						<textarea rows="2" cols="0" class="form-control"
							required="required" placeholder="Type Question Here"
							name="question"  ><%=c.getqName() %></textarea>
					</div>

					<!-- Password input -->
					<div class="form-outline mb-4 ">
						<label class="form-label" for="form1Example2">Option 1 :
							&nbsp&nbsp</label> <input type="text" id="form1Example2" name="opt1"
							placeholder="Option 1" value="<%=c.getOpt1() %>" required />
					</div>
					<div class="form-outline mb-4">
						<label class="form-label" for="form1Example2">Option 2 :
							&nbsp&nbsp</label> <input type="text" id="form1Example2" name="opt2"
							placeholder="Option 2" value="<%=c.getOpt2() %>" required />
					</div>
					<div class="form-outline mb-4">
						<label class="form-label" for="form1Example2">Option 3 :
							&nbsp&nbsp</label> <input type="text" id="form1Example2" name="opt3"
							placeholder="Option 3" value="<%=c.getOpt3() %>" required />
					</div>
					<div class="form-outline mb-4">
						<label class="form-label" for="form1Example2">Option 4 :
							&nbsp&nbsp</label> <input type="text" id="form1Example2" name="opt4"
							placeholder="Option 4" value="<%=c.getOpt4() %>" required />
					</div>
					<div class="form-outline mb-4">
						<label class="form-label" for="form1Example2">Correct
							Answer <select class="form-control" style="width: 100%"
							name="correct">
								<option>-- &nbsp&nbspChoose Correct Answer
									Option&nbsp&nbsp --</option>
								<option>Option 1</option>
								<option>Option 2</option>
								<option>Option 3</option>
								<option>Option 4</option>
						</select>
					</div>
					<!-- Submit button -->
					<button type="submit" class="btn btn-primary" style="width: 50%">Save
						Changes</button>

				</div>
			</div>

		</form>
	</div>
	<script src="js/secure.js"></script>
</body>
</html>