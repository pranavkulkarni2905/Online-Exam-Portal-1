<%@page import="com.exam.DAO.RequestDAO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.exam.DAO.examDAO"%>
<%@page import="java.time.LocalDate"%>
<%@page import="com.exam.model.Student"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
ServletContext sc2 = request.getServletContext();
Student s2 = (Student) sc2.getAttribute("student-obj");
if (s2 == null) {
	session.setAttribute("pls-login", "Please Login Here...");
	response.sendRedirect("Login.jsp");
}
String exam_code1 = request.getParameter("exam_code");
RequestDAO rd=new RequestDAO();
ResultSet rs1=rd.getDataForCheckStatus(s2.getStudId(),exam_code1);
String status=null;

if(rs1.next()){
	status=rs1.getString(11);
}
if(status.contentEquals("Yes")|| status.contentEquals("Started")){
	session.setAttribute("exam-status", false);
	response.sendRedirect("ErrorPage.jsp");
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script>
	localStorage.clear();
</script>
<SCRIPT type="text/javascript">
	window.history.forward();
	function noBack() {
		window.history.forward();
	}
</SCRIPT>
<%
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
if (session.getAttribute("token") == null) {
	//response.sendRedirect(request.getContextPath() + "/LogOut.jsp");

}
%>
<script src="js/secure.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
#heading {
	background-color: lightskyblue;
	color: red;
	font-size: 40px;
	padding: 10px;
}

#startbtn {
	font-size: 25px;
}

#div1 {
	margin-left: 200px;
	margin-right: 200px;
	padding-left: 30px;
	padding-right: 30px;
	font-size: 20px;
}

small {
	color: red;
}

#time {
	background-color: powderblue;
	margin-left: 1370px;
	margin-right: 10px;
}

input[type=text] {
	background-color: powderblue;
}
</style>
<script>
	var secs = 30;

	//countdown function is evoked when page is loaded
	function countdown() {
		setTimeout('Decrement()', 30);
	}

	//Decrement function decrement the value.
	function Decrement() {
		if (document.getElementById) {
			seconds = document.getElementById("seconds");
			minutes.value = 0;
			seconds.value = secs;
			seconds.value = getseconds();
			//when less than a minute remaining
			//colour of the minutes and seconds
			//changes to red
			if (secs < 6) {
				minutes.style.color = "red"
				seconds.style.color = "red";
			}
			//if seconds becomes zero,
			//then page alert time up
			if (secs < 0) {
				swal(
						"Best Of Luck!",
						"We Hope you will have read All instructions carefully . Now you can start exam...All the best!");
				//alert('');
				document.getElementById("startbtn").disabled = false;
				minutes.value = 00;
				seconds.value = 00;
			}
			//if seconds > 0 then seconds is decremented
			else {
				secs--;
				setTimeout('Decrement()', 1000);
			}
		}
	}
	function getseconds() {
		//take minutes remaining (as seconds) away 
		//from total seconds remaining
		return secs;
	}
</script>
<title>Instructions | ThinkExam</title>
</head>
<body onload="countdown();" onload="noBack();"
	onpageshow="if (event.persisted) noBack();" onunload="">
	<div id="time" align="right">
		Time Left : <input id="minutes" type="text"
			style="width: 20px; border: none; font-size: 16px; font-weight: bold; color: black;"><font
			size="5"> : </font> <input id="seconds" type="text"
			style="width: 25px; border: none; font-size: 16px; font-weight: bold; color: black;">
	</div>
	<%
	String exam_code = request.getParameter("exam_code");
	examDAO ed = new examDAO();
	ResultSet rs = ed.getAllData();
	String date = null;
	try {
		while (rs.next()) {
			if (rs.getString(1).equals(exam_code)) {

		date = rs.getString(3);
			}
		}
		LocalDate now = LocalDate.now();
		LocalDate date1 = LocalDate.parse(date);
		if (date1.isEqual(now)) {

		} else {
			session.setAttribute("exam-date-check", true);
			response.sendRedirect("StudentEnrolledExam.jsp");
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	%>
	<div id="div1">
		<h2>
			<div id="heading">
				<center>!! Instructions !!</center>
			</div>
		</h2>
		<small>Read all instructions carefully!</small>
		<ul>
			<li>The examination will comprise of Objective type Multiple
				Choice Questions (MCQ)</li>
			<li>All questions are compulsory and each carries Two marks.</li>
			<li>The total number of questions, duration of examination, will
				be different based on the course, the detail is available on your
				screen.</li>
			<li>There will be NO NEGATIVE MARKING for the wrong answers.</li>
			<li>The Time of the examination begins only when the 'Start
				Exam' button is pressed</li>
			<li>The Time remaining is shown in the Right Top Corner of the
				screen.</li>
			<li>The system automatically shuts down when the time limit is
				over OR alternatively if examiner finishes the exam before time he
				can quit by pressing the 'End Exam' button.</li>
			<li>'End exam' button will be available at the last question</li>
			<li><b>Once You have Saved the Answer of any Question, you will not be 
					able to	Edit your answer.</b></li>
			<li><b>Once You have Saved Last Question, exam will terminate
					Automatically.</b></li>
		</ul>
		<small>Exam start button will available after 30 seconds</small><br>
		<hr>
		<input type="checkbox" required> Read and interpreted all
		instructions<br>
		<center>
			<a href="StartExamServlet?exam_code=<%=exam_code%>">
			<button type="submit" class="btn btn-success" id="startbtn" disabled>
			Start Exam</button></a>&nbsp&nbsp&nbsp 
			<a href="StudentDashboard.jsp" class="btn btn-warning">Back </a>
		</center>
	</div>
<script src="js/secure.js"></script>
</body>
</html>