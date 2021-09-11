
<%@page import="java.sql.ResultSet"%>
<%@page import="com.exam.DAO.examDAO"%>

<%@page import="com.exam.model.Student"%>
<%@page import="com.exam.DAO.questionDAO"%>
<%@page import="com.exam.model.Question"%>
<%@page import="com.exam.DAO.StartExamDAO"%>
<%@page import="com.exam.servlet.SaveServlet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
ServletContext sc2 = request.getServletContext();
Student s2 = (Student) sc2.getAttribute("student-obj");
if (s2 == null) {
	session.setAttribute("pls-login", "Please Login Here...");
	response.sendRedirect("Login.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8">
<title>Start Exam</title>
<SCRIPT type="text/javascript">
    window.history.forward();
    function noBack() { window.history.forward(); }
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
<script src="sweetalert2.all.min.js"></script>
<script src="sweetalert2.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script src="sweetalert2.all.min.js"></script>

<script src="sweetalert2.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">

<link rel="stylesheet" href="questionexamui.css">
<link rel="stylesheet" href="css/style.css">
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"
	type="text/javascript">
</script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js">
</script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel=”stylesheet” href=”css/bootstrap.css”>
<link rel=”stylesheet” href=”css/bootstrap-responsive.css”>

<link rel="stylesheet" type="text/css" href="ExamStyle.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script>
	 $(document).ready(function() {
	        $('body').bind('cut copy paste', function(e) {
	            e.preventDefault();
	        })
	        $('body').on("contextmenu", function(e) {
	            return false;
	        })
	    })
	    document.onselectstart=()=>{
	    	event.preventDefault();
	    	Swal.fire({
	    		  title: "Warning / Alert!!!",
	    		  text: "You Appear to get the help from other sources during examination. This may lead to registering copy case against you.",
	    		  icon: 'warning',
	    		  confirmButtonColor: '#d33',
	    		  //confirmButtonClass: "btn-danger",
	    		  confirmButtonText: 'Okay..Noted it.!',
	    		  closeOnConfirm: true
	    		}
	    	)
	    }
	   
	</script>
	 <script>
            if (navigator.onLine)
            {
                // alert('Online');
            }
            else
            {
            	Swal.fire({
  	    		  title: "Error!!!",
  	    		  text: "You Are Offline..",
  	    		  icon: 'error',
  	    		  confirmButtonColor: '#d33',
  	    		  //confirmButtonClass: "btn-danger",
  	    		  confirmButtonText: 'Okay..Noted it.!',
  	    		  closeOnConfirm: true
  	    		}
  	    	)
                window.location.href="ErrorPage.jsp";
            }
        window.addEventListener('online', function (e)
        {
            alert('You Are Back Online');
        }, false);
        window.addEventListener('offline', function (e)
        {
            alert('You went offline');
            window.location.href="ErrorPage.jsp";
        }, false);
    </script>
<script>
	document.addEventListener('visibilitychange',function(){
		document.title=document.visibilityState;
		var state = document.visibilityState;
		if(state ==='hidden'){
			Swal.fire({
	    		  title: "Warning / Alert!!!",
	    		  text: "You are switching tabs.Please dont do this. This may lead to registering copy case against you.",
	    		  icon: "warning",
	    		  confirmButtonClass: "btn-danger",
	    		  confirmButtonText: "Okay..Noted it.!",
	    		  closeOnConfirm: true
	    		}
	    	)
		}
	});
	</script>
</head>
<body onload="noBack();" onpageshow="if (event.persisted) noBack();"
	onunload="">
	<%
	ServletContext sc = request.getServletContext();
	Question que[] = (Question[]) sc.getAttribute("que");
	Student stud=(Student)sc.getAttribute("student-obj");
	String exam_code = (String) sc.getAttribute("exam-code");
	String cName = (String) sc.getAttribute("course-name");
	String time = (String) session.getAttribute("exam-time");
	System.out.print(time);
	StartExamDAO exd = new StartExamDAO();
	questionDAO qd = new questionDAO();
	int size = qd.getLength(stud.getStudId(),exam_code);
	int i = exd.getCurr_que(stud.getStudId(),exam_code);
	
	sc.setAttribute("question", que[i]);
	%>
	<div class="header">
		<div class="header-right">
			<a href="#" style="color: blue; font: 40px;">ThinkExam </a> <a
				href="#home"><b>Student Name :</b> <%=s2.getfName()%>&nbsp&nbsp<%=s2.getlName()%></a>
			<a href="#contact"><b>Course Name : </b><%=cName%></a> <a
				href="#about"><b>Exam Code :</b> <%=exam_code%> </a>
		</div>
		<input type="hidden" value="<%=time%>" id="time">
		<input type="hidden" value="<%=size%>" id="size">
		<p id="demo"></p>

		<script>
		
var a=document.getElementById("time").value;
if(localStorage.getItem("count_timer")){
    var count_timer = localStorage.getItem("count_timer");
} else {
    var count_timer = parseInt(a*60);
}
var minutes = parseInt(count_timer/60);
var seconds = parseInt(count_timer%60);
function countDownTimer(){
    if(seconds < 10){
        seconds= "0"+ seconds ;
    }if(minutes < 10){
        minutes= "0"+ minutes ;
    }
    
    document.getElementById("demo").innerHTML = "Time Left : "+minutes+" min "+seconds+" s";
    if(count_timer <= 0){
         localStorage.clear("count_timer");
         
         // alert after time ends
         // var size=parseInt(document.getElementById("size").value);
          Swal.fire({
	    		  title: "Ooops!!!",
	    		  text: "Time Elapsed..",
	    		  icon: "error",
	    		  confirmButtonClass: "btn-danger",
	    		  confirmButtonText: "Okay..Noted it.!",
	    		  closeOnConfirm: true
	    		}
	    	)
          
         window.location.href="EndExamPage.jsp";
           //document.location.href='SaveServlet?size='+size;
          // document.form.submit();
        // document.getElementById('click').dispatchEvent(new MouseEvent("click"));

    } else {
        count_timer = count_timer -1 ;
        minutes = parseInt(count_timer/60);
        seconds = parseInt(count_timer%60);
        localStorage.setItem("count_timer",count_timer);
        setTimeout("countDownTimer()",1000);
    }
    //document.getElementById('myField').value=count_timer;
}
setTimeout("countDownTimer()",1000);

	
</script>


	</div>
	<div class="container">
		<div class="video">
			<div class="row">
				<div class="col-sm-12">
					<div class="card-body">
						<div class="booth">
							<video id="video" width="40%" height="60%" autoplay>
							</video>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
    var stop = function () {
        var stream = video.srcObject;
        var tracks = stream.getTracks();
        for (var i = 0; i < tracks.length; i++) {
            var track = tracks[i];
            track.stop();
        }
        video.srcObject = null;
    }
    var start = function () {
        var video = document.getElementById('video'),
            vendorUrl = window.URL || window.webkitURL;
        if (navigator.mediaDevices.getUserMedia) {
            navigator.mediaDevices.getUserMedia({ video: true })
                .then(function (stream) {
                    video.srcObject = stream;
                }).catch(function (error) {
                    console.log("Something went wrong!");
                });
        }
    }
    $(function () {
        start();
    });  
</script>
	<%
	try {
		String msg = (String) session.getAttribute("answered");
		if (msg != null) {
	%>
	<script type="text/javascript">
			swal("You have already attempted this question.");
			</script>
	<%
	}
	} catch (Exception e) {

	}
	session.removeAttribute("answered");
	%>
	<form name="form">

		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-6">
					<div class="container5">
						<div class="d-flex justify-content-center row">
							<div class="col-md-10 col-lg-8">

 
								<div
									class="d-flex flex-row justify-content-between align-items-center mcq">
									<h3>
										<button style="background-color: yellow;">
											Q.<%=i + 1%></button>

									</h3>
								</div>
								<h3>
									<b><%=que[i].getqName()%></b>
								</h3>
								<hr>
								<br>
								<div class="ans ml-2">
									<label class="radio"> <input type="radio" name="ans"
										value="<%=que[i].getOpt1()%>" id="opt1"> <span><%=que[i].getOpt1()%></span>
									</label>
								</div>
								<hr>
								<div class="ans ml-2">
									<label class="radio"> <input type="radio" name="ans"
										value="<%=que[i].getOpt2()%>" id="opt1"> <span><%=que[i].getOpt2()%></span>
									</label>
								</div>
								<hr>
								<div class="ans ml-2">
									<label class="radio"> <input type="radio" name="ans"
										value="<%=que[i].getOpt3()%>" id="opt3"> <span><%=que[i].getOpt3()%></span>
									</label>
								</div>
								<hr>
								<div class="ans ml-2">
									<label class="radio"> <input type="radio" name="ans"
										value="<%=que[i].getOpt4()%>" id="opt4"> <span><%=que[i].getOpt4()%></span>
									</label>
								</div>

							</div>
						</div>
					</div>
					<input type="hidden" name="curr" value="<%=i%>">
					<button type="submit"
						style="margin-left: 350px; margin-top: 40px; background-color: blue;"
						formaction="PrevServlet" class="btn btn-info">Previous</button>

					<%
					if (i == size - 1) {
					%>
					<button type="submit" id="click" formaction="SaveServlet"
						style="margin-left: 5px; margin-top: 40px; background-color: red;"
						class="btn btn-success" class="next" >End Exam</button>
						
						<!-- <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Confirmation !!!</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" style="color: red">
       Are You Sure to End Exam ?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-warning" >End Exam</button>
      </div>
    </div>
  </div>
</div> -->
<%
					
					} else {
					%>
					<button type="submit"  formaction="SaveServlet"
						style="margin-left: 50px; margin-top: 40px; background-color: green;"
						class="btn btn-success" class="next">Save</button>
					<button type="submit" formaction="NextServlet"
						style="margin-left: 50px; margin-top: 40px; background-color: blue;"
						class="btn btn-success" class="next">Next</button>
					<%
					}
					%>
					<h5 style="color: red; margin-left: 300px; margin-top: 40px;">
						<b>End Exam button will be available on Last Question</b>
					</h5>
				</div>
	</form>
	<form>
	<div class="col-lg-6">
		<div class="container3">
			<div class="border">
				<h3 class="text-center">Total Questions</h3>
				<%
				for (int j = 1; j <= size; j++) {
				%>
				<a href="PaginationServlet?que=<%=j%>" class="btn btn-info" style="background-color:tomato;">
				<%=j%></a>
				<%
				}
				%>
	
				<hr>
				<button type="button" style="background-color: red;"
					class="btn btn-info"><%=i + 1%></button>
				<p style="float: right; margin-right: 85px; margin-top: 10px;">
					<b>Current Question</b>
				</p>
				<hr>
				<p>
					<b>Total Attempted</b>
				</p>
				<hr>
				<%
				StartExamDAO sd = new StartExamDAO();
				ResultSet rs = sd.getCounter(stud.getStudId(),exam_code);
				if (rs.next()) {
				%>
				<button type="button" style="background-color: green;"
					class="btn btn-info"><%=rs.getInt(1)%></button>
				<p style="float: right; margin-right: 110px; margin-top: 10px;">
					<b>Attempted</b>
				</p>
				<hr>
				<button type="button"
					style="background-color: blue; margin-bottom: 10px;"
					class="btn btn-info"><%=size - rs.getInt(1)%></button>
				<p
					style="float: right; margin-right: 90px; margin-top: 10px; margin-bottom: 10px;">
					<b>Non-Attempted</b>
				</p>
				<%
				}
				%>

			</div>
		</div>
	</div>
	</div>
	</div>

	</form>
	<script src="http://sibeeshpassion.com/content/scripts/jquery-1.11.1.min.js"></script> 
	<script>  
document.onkeypress = function (event) {  
event = (event || window.event);  
if (event.keyCode == 123) {  
return false;  
}  
}  
document.onmousedown = function (event) {  
event = (event || window.event);  
if (event.keyCode == 123) {  
return false;  
}  
}  
document.onkeydown = function (event) {  
event = (event || window.event);  
if (event.keyCode == 123) {  
return false;  
}  
}  
</script>  
<script>
document.addEventListener("keydown", function(e){
  // USE THIS TO DISABLE CONTROL AND ALL FUNCTION KEYS
  // if (e.ctrlKey || (e.keyCode>=112 && e.keyCode<=123)) {
  // THIS WILL ONLY DISABLE CONTROL AND F12
  if (e.ctrlKey || e.keyCode==123) {
    e.stopPropagation();
    e.preventDefault();
  }
});
</script>
</body>
</html>