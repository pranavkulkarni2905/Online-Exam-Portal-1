<%@page import="com.exam.DAO.questionDAO"%>
<%@page import="com.exam.model.Question"%>
<%@page import="com.exam.DAO.StartExamDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8">
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
<title>Start Exam</title>
<link rel="stylesheet" type="text/css" href="ExamStyle.css">
</head>
<body>
	<div class="header">
		<div class="header-right">
			<a href="#" style="color: blue; font: 40px;">ThinkExam</a> <a
				href="#home">Student Name</a> <a href="#contact">Course Name</a> <a
				href="#about">Course Code</a>
		</div>

		<p id="demo">

			<script>
  
//Set the date we're counting down to
var countDownDate = new Date("Sept 5, 2022 15:37:25").getTime();


// Update the count down every 1 second
var x = setInterval(function() {

  // Get today's date and time
  var now = new Date().getTime();
    
  // Find the distance between now and the count down date
  var distance = countDownDate - now;
    
  // Time calculations for days, hours, minutes and seconds
  
  var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
  var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
  var seconds = Math.floor((distance % (1000 * 60)) / 1000);
    
  // Output the result in an element with id="demo"
  document.getElementById("demo").innerHTML =hours + "h "
  + minutes + "m " + seconds + "s ";
    
  // If the count down is over, write some text 
  if (distance < 0) {
    clearInterval(x);
    document.getElementById("demo").innerHTML = "EXPIRED";
  }
}, 1000);

</script>
		</p>

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
	ServletContext sc = request.getServletContext();
	Question que[] = (Question[]) sc.getAttribute("que");
	StartExamDAO exd = new StartExamDAO();
	questionDAO qd = new questionDAO();
	int size = qd.getLength();
	int i = exd.getCurr_que();
	sc.setAttribute("question", que[i]);
	%>
	<form>
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-6">
					<div class="container5">
						<div class="d-flex justify-content-center row">
							<div class="col-md-10 col-lg-10">
								<div class="border">
									<div class="question bg-white p-3 border-bottom">
										<div
											class="d-flex flex-row justify-content-between align-items-center mcq">
											<h3>
												<span>Q. : <%=i + 1%></span>
											</h3>

										</div>
										<h3><%=que[i].getqName()%></h3>
									</div>

									<div class="question bg-white p-3 border-bottom">
										
										<div class="ans ml-2">
											<label class="radio"> <input type="radio" name="ans"
												value="<%=que[i].getOpt1()%>" id="opt1"> <span><%=que[i].getOpt1()%></span>
											</label>
										</div>
										<div class="ans ml-2">
											<label class="radio"> <input type="radio" name="ans"
												value="<%=que[i].getOpt2()%>" id="opt1"> <span><%=que[i].getOpt2()%></span>
											</label>
										</div>
										<div class="ans ml-2">
											<label class="radio"> <input type="radio" name="ans"
												value="<%=que[i].getOpt3()%>" id="opt3"> <span><%=que[i].getOpt3()%></span>
											</label>
										</div>
										<div class="ans ml-2">
											<label class="radio"> <input type="radio" name="ans"
												value="<%=que[i].getOpt4()%>" id="opt4"> <span><%=que[i].getOpt4()%></span>
											</label>
										</div>

									</div>

								</div>

							</div>
						</div>
					</div>
					<input type="hidden" name="curr" value="<%=i%>"> 
					<button type="submit" style="margin-left: 400px; margin-top: 40px; background-color: blue;"
							class="btn btn-info">Previous</button>
					<button type="submit" formaction="SaveServlet"
						style="margin-left: 50px; margin-top: 40px; background-color: green;"
						class="btn btn-success" class="next">Save</button>
					<button type="submit" formaction="NextServlet"
						style="margin-left: 50px; margin-top: 40px; background-color: blue;"
						class="btn btn-success" class="next">Next</button>
						<%
							if(i==size-1)
							{
						%>
						<button type="submit" style="margin-left: 50px; margin-top: 40px; background-color: red;"
						class="btn btn-success" class="next">End Exam</button>
						<%	}
						%>
					<h5 style="color: red; margin-left: 300px; margin-top: 40px;">
						<b>End Exam button will be available on Last Question</b>
					</h5>
				</div>
		

	</form>

	<div class="col-lg-6">
		<div class="container3">
			<div class="border">
				<button type="button" class="btn btn-info">
					<a href="questionexamui.html">1</a>
				</button>
				<button type="button" class="btn btn-info">
					<a href="que1.html">2</a>
				</button>
				<button type="button" class="btn btn-info">
					<a href="que2.html">3</a>
				</button>
				<button type="button" class="btn btn-info">
					<a href="que3.html">4</a>
				</button>
				<button type="button" class="btn btn-info">
					<a href="que4.html">5</a>
				</button>
				<button type="button" class="btn btn-info">
					<a href="que5.html">6</a>
				</button>
				<button type="button" style="margin-top: 15px;" class="btn btn-info">
					<a href="que6.html">7</a>
				</button>
				<button type="button" style="margin-top: 15px;" class="btn btn-info">
					<a href="que7.html">8</a>
				</button>
				<button type="button" style="margin-top: 15px;" class="btn btn-info">
					<a href="que8.html">9</a>
				</button>
				<button type="button" style="margin-top: 15px;" class="btn btn-info">
					<a href="que9.html">10</a>
				</button>
				<hr>
				<button type="button" style="background-color: red;"
					class="btn btn-info">5</button>
				<p style="float: right; margin-right: 85px; margin-top: 10px;">Current
					Question</p>
				<hr>
				<p>Total Attempted</p>
				<hr>
				<button type="button" style="background-color: green;"
					class="btn btn-info">2</button>
				<p style="float: right; margin-right: 20px; margin-top: 10px;">Attempted
					And Not Reviewed</p>
				<hr>
				<button type="button"
					style="background-color: blue; margin-bottom: 10px;"
					class="btn btn-info">1</button>
				<p
					style="float: right; margin-right: 40px; margin-top: 10px; margin-bottom: 10px;">Attempted
					And Reviewed</p>
			</div>
		</div>
	</div>
	</div>
	</div>
</body>
</html>