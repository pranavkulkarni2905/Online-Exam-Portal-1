<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
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
	var secs = 5;

	//countdown function is evoked when page is loaded
	function countdown() {
		setTimeout('Decrement()', 5);
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
				alert('Now you can start exam...All the best!');
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
<title>Instructions|ThinkExam</title>
</head>
<body onload="countdown();">
	<div id="time" align="right">
		Time Left : <input id="minutes" type="text"
			style="width: 20px; border: none; font-size: 16px; font-weight: bold; color: black;"><font
			size="5"> : </font> <input id="seconds" type="text"
			style="width: 25px; border: none; font-size: 16px; font-weight: bold; color: black;">
	</div>
	<%
		String exam_code = request.getParameter("exam_code"); 
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
			<li>All questions are compulsory and each carries One mark.</li>
			<li>The total number of questions, duration of examination, will
				be different based on the course, the detail is available on your
				screen.</li>
			<li>There will be NO NEGATIVE MARKING for the wrong answers.</li>
			<li>The Time of the examination begins only when the 'Start
				Exam' button is pressed</li>
			<li>The Time remaining is shown in the Right Top Corner of the
				screen.</li>
			<li>The system automatically shuts down when the time limit is
				over OR alternatively if examinee finishes the exam before time he
				can quit by pressing the 'End Exam' button.</li>
			<li>'End exam' button will be available at the last question</li>
		</ul>
		<small>Exam start button will available after 30 sec</small><br>
		<hr>
		<input type="checkbox" required>Read and interpreted all
		instructions<br>
		<center>
		<a href="StartExamServlet?exam_code=<%=exam_code%>"><button type="submit" class="btn btn-success" id="startbtn" disabled>Start
				Exam</button></a>
		</center>
	</div>
	
</body>
</html>