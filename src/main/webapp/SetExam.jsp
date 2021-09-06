<%@page import="java.util.Collections"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.exam.model.Exam"%>
<%@page import="com.exam.DAO.examDAO"%>
<%@page import="com.exam.model.Course"%>
<%@page import="java.util.List"%>
<%@page import="com.exam.DAO.courseDAO"%>
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
<title>Set Exam | ThinkExam</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>
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



<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<style>
.class {
	margin-left: 100px;
}

.form-group {
	width: 500px;
}

.label {
	display: block;
	font: 1rem 'Fira Sans', sans-serif;
}

.card {
	height: 560px;
	width: 700px;
	margin-left: 200px;
}

.form-group row {
	margin-top: 100px;
	padding-top: 10px;
	spacing: 10px;
}

input, label {
	margin: .4rem 0;
}
</style>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<%@ include file="all_component/faculty-navbar.jsp"%>


	<%
	try {
		boolean msg1 = (boolean) session.getAttribute("exam-set-success");
		if (msg1 == true) {
	%>
	<div id="div1">
		<script type="text/javascript">
			Swal.fire('Done.!!&#9989', 'Exam Set Successfully&#128077',
					'success')
		</script>
	</div>

	<%
	}
	} catch (Exception e) {
	//e.printStackTrace();
	}
	session.removeAttribute("exam-set-success");
	%>
	<%
	try {
		boolean msg2 = (boolean) session.getAttribute("exam-set-fail");
		if (msg2 == false) {
	%>
	<div id="div1">
		<script type="text/javascript">
			Swal.fire('Ooops.!!', 'Something went wrog on server.', 'warning')
		</script>
	</div>

	<%
	}
	} catch (Exception e) {
	//e.printStackTrace();
	}
	session.removeAttribute("exam-set-fail");
	%>
	<%
	try {
		boolean msg3 = (boolean) session.getAttribute("exam-edit-success");
		if (msg3 == true) {
	%>
	<div id="div1">
		<script type="text/javascript">
			Swal.fire('Done.!!&#9989', 'Exam updated Successfully&#128077',
					'success')
		</script>
	</div>

	<%
	}
	} catch (Exception e) {
	//e.printStackTrace();
	}
	session.removeAttribute("exam-edit-success");
	%>
	<%
	try {
		boolean msg4 = (boolean) session.getAttribute("exam-edit-fail");
		if (msg4 == false) {
	%>
	<div id="div1">
		<script type="text/javascript">
			Swal.fire('Ooops.!!', 'Something went wrog on server.', 'warning')
		</script>
	</div>

	<%
	}
	} catch (Exception e) {
	//e.printStackTrace();
	}
	session.removeAttribute("exam-edit-fail");
	%>
	<%
	try {
		boolean msg5 = (boolean) session.getAttribute("exam-delete-success");
		if (msg5 == true) {
	%>
	<div id="div1">
		<script type="text/javascript">
			Swal.fire('Done.!!&#9989', 'Exam deleted Successfully&#128077',
					'success')
		</script>
	</div>

	<%
	}
	} catch (Exception e) {
	//e.printStackTrace();
	}
	session.removeAttribute("exam-delete-success");
	%>
	<%
	try {
		boolean msg6 = (boolean) session.getAttribute("exam-delete-fail");
		if (msg6 == false) {
	%>
	<div id="div1">
		<script type="text/javascript">
			Swal.fire('Ooops.!!', 'Cannot delete right now ', 'warning')
		</script>
	</div>

	<%
	}
	} catch (Exception e) {
	//e.printStackTrace();
	}
	session.removeAttribute("exam-delete-fail");
	%>
	<%
	int eId = 0;
	ArrayList<Integer> list = new ArrayList<Integer>();
	for (int i = 1; i < 50000; i++) {
		list.add(new Integer(i));
	}
	Collections.shuffle(list);
	for (int i = 1; i <= 8000; i++) {
		eId = list.get(i);
	}
	
	%>
	<%
			String msg = (String) session.getAttribute("invalid-date");
			if (msg != null) {
			%>

			<div class="alert alert-danger alert-dismissible text-center">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<h5><%=msg%></h5>
			</div>
			<%
			}
			session.removeAttribute("invalid-date");
			%>
	<div class="card">
		<div class="class">
			<form action="AddExamServlet" method="post">
				<h2 class="text-center" style="color: blue;">
					<b>Set Exam</b>
				</h2>
				<div class="form-group row">
					<label for="inputEmail3" class="col-sm-2 col-form-label"
						style="margin-top: 30px;">Exam Code</label>
					<div class="col-sm-10">
						
						<input type="text" class=" form-control-plaintext" name="examcode"
							style="margin-top: 50px;" readonly="readonly"
							value="EXAM-<%=eId%>">
						
					</div>
				</div>
				<div class="form-group row">
					<label for="inputPassword3" class="col-sm-2 col-form-label">Exam
						Name</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="examname"
							id="inputPassword3" placeholder="Examname">
					</div>
				</div>
				<div class="form-group row">
					<label for="inputEmail3" class="col-sm-2 col-form-label">Course
						Name</label>
					<div class="col-sm-10">
						<select name="cname" class="form-control">
							<option>-- Select Course Name --</option>
							<%
							try {
								ServletContext sc1 = request.getServletContext();
								Faculty s = (Faculty) sc1.getAttribute("faculty-obj");
								courseDAO cd = new courseDAO();
								List<Course> lst = cd.getAllDataById(s.getFacId());
								for (Course c : lst) {
									String name = c.getCoursename();
							%>

							<option value="<%=name%>"><%=name%></option>

							<%
							}
							} catch (Exception e) {
							e.printStackTrace();
							}
							%>
						</select>
					</div>
				</div>
				<div>
					<label for="start" class="Label">Exam date:
						&nbsp&nbsp&nbsp&nbsp</label> <input type="date" id="start" name="date"
						value="2018-07-22" min="2021-08-01" max="2022-12-31">
				</div>
				<br>

				<div class="row">
					<h6>
						<b>Exam time</b>
					</h6>

					<br>
					<div class="container">
						<div class="col-sm-8">
							<label class="radio-inline"> <input type="radio"
								name="optradio" value="60" checked>60 Min
							</label>&nbsp&nbsp&nbsp  <label class="radio-inline"> <input
								type="radio" value="30" name="optradio">30 Min
							</label>&nbsp&nbsp&nbsp <label class="radio-inline"> <input
								type="radio" value="20" name="optradio">20 Min
							</label>&nbsp&nbsp&nbsp <label class="radio-inline"> <input
								type="radio" value="5" name="optradio">5 Min
							</label>&nbsp&nbsp&nbsp <label class="radio-inline"> <input
								type="radio" value="1" name="optradio">1 Min
							</label> <br>
						</div>
					</div>
				</div>
				<hr>
				<br>
				<div class="form-group row">
					<div class="col-sm-10">
						<button type="submit" class="btn btn-success">Add exam</button>
						&nbsp&nbsp&nbsp&nbsp
						<button type="button" class="btn btn-primary" data-toggle="modal"
							data-target=".bd-example-modal-lg">View All Exam</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog"
		aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div
			class="modal-dialog  modal-dialog-centered modal-dialog-scrollable modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Description</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<table class="table table-hover">
						<tbody>
							<tr>
								<th scope="row">#</th>
								<th scope="row">Exam Code</th>
								<th scope="row">Exam Name</th>
								<th scope="row">Exam Date</th>
								<th scope="row">Exam Time</th>
								<th scope="row">Course</th>
								<th scope="row">Edit</th>
								<th scope="row">Delete</th>

							</tr>
						</tbody>
						<%
						try {
							ServletContext sc1 = request.getServletContext();
							Faculty s = (Faculty) sc1.getAttribute("faculty-obj");
							if (s != null) {
								int sr = 1;
								examDAO ed = new examDAO();
								List<Exam> lst = ed.getAllDataByFacId(s.getFacId());
								for (Exam e : lst) {
						%>

						<tbody>
							<tr>
								<td><%=sr++%></td>
								<td><%=e.getExamCode()%></td>
								<td><%=e.getExamName()%></td>
								<td><%=e.getExamDate()%></td>
								<td><%=e.getExamTime()%>&nbspMin</td>
								<td><%=e.getcName()%></td>
								<td><a href="EditExam.jsp?exam_code=<%=e.getExamCode()%>"><button type="button" class="btn btn-success">
								<i class="fa fa-pencil"></i> Edit</button></a></td>
								<td><a href="DeleteExamServlet?exam_code=<%=e.getExamCode()%>"><button class="btn btn-danger" data-toggle="modal">
									<i class="fa fa-trash"></i> Delete</button> </a>
							</tr>
						</tbody>


						<%
						}
						}
						} catch (Exception e) {
						e.printStackTrace();
						}
						%>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>

				</div>
			</div>
		</div>
	</div>
</body>
</html>