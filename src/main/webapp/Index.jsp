<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="keywords"
	content="Bootstrap, Landing page, Template, Business, Service">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="author" content="Grayrids">
<title>ThinkExam Online Portal</title>
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
<!--====== Favicon Icon ======-->
<link rel="shortcut icon" href="images/logo.png" type="image/png">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/LineIcons.css">
<link rel="stylesheet" href="css/owl.carousel.css">
<link rel="stylesheet" href="css/owl.theme.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/nivo-lightbox.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/responsive.css">
<script src="sweetalert2.all.min.js"></script>
<script src="sweetalert2.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>



</head>

<body onload="noBack();" onpageshow="if (event.persisted) noBack();"
	onunload="">
 	<%try{
			boolean msg = (boolean) session.getAttribute("msg-sent");
			if (msg ==true) {
			%>
			<script>
			Swal.fire({
		    		  title: "Done..!!",
		    		  text: "Your Messgae Has Been Sent Successfully..",
		    		  icon: 'success',
		    		  confirmButtonColor: '#d33',
		    		  //confirmButtonClass: "btn-danger",
		    		  confirmButtonText: 'Okay!',
		    		  closeOnConfirm: true
		    		}
		    	)
		    	</script>
			<%
			}
			session.removeAttribute("msg-sent");
 	}catch(Exception e){
 		//e.printStackTrace();
 	}
			%>
			<%try{
			boolean msg1 = (boolean) session.getAttribute("invalid-email-addr");
			if (msg1 ==false) {
			%>
			<script>
			Swal.fire({
		    		  title: "Error..!!",
		    		  text: "Entered Email Id is Not Exist / It's an Invalid.",
		    		  icon: 'error',
		    		  confirmButtonColor: '#d33',
		    		  //confirmButtonClass: "btn-danger",
		    		  confirmButtonText: 'Okay!',
		    		  closeOnConfirm: true
		    		}
		    	)
		    	</script>
			<%
			}
			session.removeAttribute("invalid-email-addr");
			}catch(Exception e){
				//e.printStackTrace();
				
			}
			%>
	<!-- Header Section Start -->
	<header id="home" class="hero-area fixed-top">
		<div class="overlay">
			<span></span> <span></span>
		</div>
		<nav
			class="navbar navbar-expand-md bg-inverse fixed-top scrolling-navbar">
			<div class="container">
				<a href="Index.jsp" class="navbar-brand"><img
					src="images/logo.png" alt="" width="120px" height="44px"></a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarCollapse" aria-controls="navbarCollapse"
					aria-expanded="false" aria-label="Toggle navigation">
					<i class="lni-menu"></i>
				</button>
				<div class="collapse navbar-collapse" id="navbarCollapse">
					<ul class="navbar-nav mr-auto w-100 justify-content-end">
						<li class="nav-item"><a class="nav-link page-scroll"
							href="#home">Home</a></li>
						<li class="nav-item"><a class="nav-link page-scroll"
							href="#services">About</a></li>
						<li class="nav-item"><a class="nav-link page-scroll"
							href="#features">Services</a></li>

						<li class="nav-item"><a class="nav-link page-scroll"
							href="#team">Team</a></li>

						<li class="nav-item"><a class="nav-link page-scroll"
							href="#contact">Contact</a></li>

						<li class="nav-item"><a class="btn btn-singin" href="#"
							onclick="fun();">Admin</a></li>
						<script>
 function fun(){
	 Swal.fire({
		    title: "ADMIN LOGIN",
		    text: "Enter Password",
		    input: 'password',
		    showCancelButton: true        
		}).then((result) => {
		    if (result.value==='ThinkExam@2021') {
		     window.location.href="AdminDashboard.jsp";
		    }
		    else if (result.value==='') {
		    	Swal.fire({
		    		  title: "Error!!",
		    		  text: "Please fill Password field..!",
		    		  icon: 'error',
		    		  confirmButtonColor: '#d33',
		    		  //confirmButtonClass: "btn-danger",
		    		  confirmButtonText: 'Okay!',
		    		  closeOnConfirm: true
		    		}
		    	)
			    }
		    else{
		    	Swal.fire({
		    		  title: "Error!!",
		    		  text: "Invalid Password.. Please try Again Later..",
		    		  icon: 'error',
		    		  confirmButtonColor: '#d33',
		    		  //confirmButtonClass: "btn-danger",
		    		  confirmButtonText: 'Okay!',
		    		  closeOnConfirm: true
		    		}
		    	)
		    }
		    
		});
 }
 </script>
						<li class="nav-item"><a class="btn btn-singin"
							href="Login.jsp">SignIn</a></li>
						<li class="nav-item"><a class="btn btn-singin" href="DemoQuiz.jsp" >Demo
								Exam</a></li>
					</ul>
				</div>
			</div>
		</nav>
		<div class="container">
			<div class="row space-100">
				<div class="col-lg-6 col-md-12 col-xs-12">
					<div class="contents">
						<h2 class="head-title" style="font-family: Algerian;">Better Online Exam Experience With
							ThinkExam</h2>
						<p>It automates the old conventional method of conducting
							examinations through Web Based Online Examination with supreme
							transparency.</p>

						<div class="header-button">
							<a href="Register_faculty.jsp" class="btn btn-border-filled">Faculty</a>
							<a href="Register_student.jsp" class="btn btn-border page-scroll">Student</a>
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-md-12 col-xs-12 p-0">
					<div class="intro-img">
						<img src="images/hero-img.jpg" alt="">
					</div>
				</div>
			</div>
		</div>
	</header>
	<!-- Header Section End -->


	<!-- Services Section Start -->
	<section id="services" class="section">
		<div class="container">

			<div class="row">
				<!-- Start Col -->
				<div class="col-lg-4 col-md-6 col-xs-12">
					<div class="services-item text-center">
						<div class="icon">
							<i class="lni-cog"></i>
						</div>
						<h4 style="font-family: Algerian;">Question Bank Management</h4>
						<p>During the preparatory phases for exams, the software
							should provide question banks, suggestion papers, and reference
							links or PDFs on various subjects. The question banks should be
							interactive in nature with proper multimedia support and text
							editors. The mode of presentation should be appealing, enough to
							draw the attention of individual students.</p>
					</div>
				</div>
				<!-- End Col -->
				<!-- Start Col -->
				<div class="col-lg-4 col-md-6 col-xs-12">
					<div class="services-item text-center">
						<div class="icon">
							<i class="lni-brush"></i>
						</div>
						<h4 style="font-family: Algerian;">Online Proctoring</h4>
						<p> Look for online exam software that
							provides proper methods of surveillance over individual students.
							It must be able to detect misconduct showcased by individual
							students and send timely notifications to the controller.</p>
					</div>
				</div>
				<!-- End Col -->
				<!-- Start Col -->
				<div class="col-lg-4 col-md-6 col-xs-12">
					<div class="services-item text-center">
						<div class="icon">
							<i class="lni-heart"></i>
						</div>
						<h4 style="font-family: Algerian;">Instant Notifications</h4>
						<p>The software should be able to provide instant notification
							of exams, assessments, classes, timing, and projects to students
							and parents, with great precision and without leaking personal
							information.</p>
					</div>
				</div>
				<!-- End Col -->

			</div>
		</div>
	</section>
	<!-- Services Section End -->



	<!-- Business Plan Section Start -->
	<section id="business-plan">
		<div class="container">

			<div class="row">
				<!-- Start Col -->
				<div class="col-lg-6 col-md-12 pl-0 pt-70 pr-5">
					<div class="business-item-img">
						<img src="img/business/business-img.png" class="img-fluid" alt="">
					</div>
				</div>
				<!-- End Col -->
				<!-- Start Col -->
				<div class="col-lg-6 col-md-12 pl-4">
					<div class="business-item-info">
						<h3 style="font-family: Algerian;">About Our Exam Portal</h3>
						<p>Online Exam System / Portal / Website in Delhi We develop
							an Online Exams System for your institution to be able to create
							paperless, timer-based online examinations for your students.
							This software is highly demanded by institutes, recruiters,
							schools, colleges and universities. With growing technology, it's
							quite a popular product and you can rely on Webpulse as your
							technology partner for Online Exam Software Development. It comes
							with ecommerce features, where you can sell your Online Tests &
							students are able to attend the test online & get quick detailed
							results. We have already developed such a system for our clients.
							Call +91-99112-44888 for more details.</p>

						<a class="btn btn-common" href="DemoQuiz.jsp">Demo Exam</a>
					</div>
				</div>
				<!-- End Col -->

			</div>
		</div>
	</section>
	<!-- Business Plan Section End -->



	<!-- Cool Fetatures Section Start -->
	<section id="features" class="section">
		<div class="container">
			<!-- Start Row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="features-text section-header text-center">
						<div>
							<h2 class="section-title" style="font-family: Algerian;">Services We Provide</h2>
							<div class="desc-text">
								<p></p>
							</div>
						</div>
					</div>
				</div>

			</div>
			<!-- End Row -->
			<!-- Start Row -->
			<div class="row featured-bg">
				<!-- Start Col -->
				<div class="col-lg-6 col-md-6 col-xs-12 p-0">
					<!-- Start Fetatures -->
					<div class="feature-item featured-border1">
						<div class="feature-icon float-left">
							<i class="lni-coffee-cup"></i>
						</div>
						<div class="feature-info float-left">
							<h4>Spatial Visualization</h4>
							<p>Capacity to perform mental revolution and control 2D and
								3D shapes and items intellectually.</p>
						</div>
					</div>
					<!-- End Fetatures -->
				</div>
				<!-- End Col -->

				<!-- Start Col -->
				<div class="col-lg-6 col-md-6 col-xs-12 p-0">
					<!-- Start Fetatures -->
					<div class="feature-item featured-border2">
						<div class="feature-icon float-left">
							<i class="lni-briefcase"></i>
						</div>
						<div class="feature-info float-left">
							<h4>Mathematical Understanding</h4>
							<p>Capacity in numerical capability including computations
								and intellectually handling numbers.</p>
						</div>
					</div>
					<!-- End Fetatures -->
				</div>
				<!-- End Col -->

				<!-- Start Col -->
				<div class="col-lg-6 col-md-6 col-xs-12 p-0">
					<!-- Start Fetatures -->
					<div class="feature-item featured-border1">
						<div class="feature-icon float-left">
							<i class="lni-invention"></i>
						</div>
						<div class="feature-info float-left">
							<h4>Innovativeness</h4>
							<p>Capacity to contextualize data then, at that point use
								out-of-the crate approach and theoretical preparing</p>
						</div>
					</div>
					<!-- End Fetatures -->
				</div>
				<!-- End Col -->

				<!-- Start Col -->
				<div class="col-lg-6 col-md-6 col-xs-12 p-0">
					<!-- Start Fetatures -->
					<div class="feature-item featured-border2">
						<div class="feature-icon float-left">
							<i class="lni-layers"></i>
						</div>
						<div class="feature-info float-left">
							<h4>Semantic Ability</h4>
							<p>Assesses artistic abilities like understanding, spelling
								and sentence structure</p>
						</div>
					</div>
					<!-- End Fetatures -->
				</div>
				<!-- End Col -->

				<!-- Start Col -->
				<div class="col-lg-6 col-md-6 col-xs-12 p-0">
					<!-- Start Fetatures -->
					<div class="feature-item featured-border3">
						<div class="feature-icon float-left">
							<i class="lni-reload"></i>
						</div>
						<div class="feature-info float-left">
							<h4>Mechanical Comprehension</h4>
							<p>Capacity to utilize straightforward specialized ideas and
								standards</p>
						</div>
					</div>
					<!-- End Fetatures -->
				</div>
				<!-- End Col -->

				<!-- Start Col -->
				<div class="col-lg-6 col-md-6 col-xs-12 p-0">
					<!-- Start Fetatures -->
					<div class="feature-item">
						<div class="feature-icon float-left">
							<i class="lni-support"></i>
						</div>
						<div class="feature-info float-left">
							<h4>Perceptual Speed and Accuracy</h4>
							<p>Capacity to rapidly look at and simplify surmisings from
								the given information</p>
						</div>
					</div>
					<!-- End Fetatures -->
				</div>
				<!-- End Col -->


			</div>
			<!-- End Row -->
		</div>
	</section>
	<!-- Cool Fetatures Section End -->



	<!-- Team section Start -->
	<section id="team" class="section">
		<div class="container">
			<!-- Start Row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="team-text section-header text-center">
						<div>
							<h2 class="section-title" style="font-family: Algerian;">Team Members</h2>
						</div>
					</div>
				</div>

			</div>
			<!-- End Row -->
			<!-- Start Row -->
			<div class="row">
				<!-- Start Col -->
				<div class="col-lg-3 col-md-6 col-xs-12">
					<div class="single-team">
						<div class="team-thumb">
							<img src="images/p4.jpg" class="img-fluid" alt="">
						</div>

						<div class="team-details">
							<div class="team-social-icons">
								<ul class="social-list">
									<li><a href="#"><i class="lni-facebook-filled"></i></a></li>
									<li><a href="#"><i class="lni-twitter-filled"></i></a></li>
									<li><a href="#"><i class="lni-google-plus"></i></a></li>
								</ul>
							</div>
							<div class="team-inner text-center">
								<h5 class="team-title">Pranav Kulkarni</h5>
								<p>Java Full Stack Developer</p>
							</div>
						</div>
					</div>
				</div>
				<!-- Start Col -->

				<!-- Start Col -->
				<div class="col-lg-3 col-md-6 col-xs-12">
					<div class="single-team">
						<div class="team-thumb">
							<img src="images/sam.jpg" class="img-fluid" alt="">
						</div>
						<br>
						<div class="team-details">
							<div class="team-social-icons">
								<ul class="social-list">
									<li><a href="#"><i class="lni-facebook-filled"></i></a></li>
									<li><a href="#"><i class="lni-twitter-filled"></i></a></li>
									<li><a href="#"><i class="lni-google-plus"></i></a></li>
								</ul>
							</div>
							<div class="team-inner text-center">
							
								<h5 class="team-title">Sampada Kothari</h5>
								<p>Java Full Stack Developer</p>
							</div>
						</div>
					</div>
				</div>
				<!-- Start Col -->

				<!-- Start Col -->
				<div class="col-lg-3 col-md-6 col-xs-12">
					<div class="single-team">
						<div class="team-thumb">
							<img src="images/mansi.jpg" class="img-fluid" alt="">
						</div>

						<div class="team-details">
							<div class="team-social-icons">
								<ul class="social-list">
									<li><a href="#"><i class="lni-facebook-filled"></i></a></li>
									<li><a href="#"><i class="lni-twitter-filled"></i></a></li>
									<li><a href="#"><i class="lni-google-plus"></i></a></li>
								</ul>
							</div>
							<div class="team-inner text-center">
								<h5 class="team-title">Mansi Kaleshwarkar</h5>
								<p>Front-end Developer</p>
							</div>
						</div>
					</div>
				</div>
				<!-- Start Col -->

				<!-- Start Col -->
				<div class="col-lg-3 col-md-6 col-xs-12">
					<div class="single-team">
						<div class="team-thumb">
							<img src="images/shravani.jpg" class="img-fluid" alt="">
						</div>

						<div class="team-details">
							<div class="team-social-icons">
								<ul class="social-list">
									<li><a href="#"><i class="lni-facebook-filled"></i></a></li>
									<li><a href="#"><i class="lni-twitter-filled"></i></a></li>
									<li><a href="#"><i class="lni-google-plus"></i></a></li>
								</ul>
							</div>
							<div class="team-inner text-center">
								<h5 class="team-title">Shravani Kaleshwarkar</h5>
								<p>Front-end Developer</p>
							</div>
						</div>
					</div>
				</div>
				<!-- Start Col -->


			</div>
			<!-- End Row -->
		</div>
	</section>
	<!-- Team section End -->



	<!-- Contact Us Section -->
	<section id="contact" class="section">
		<!-- Container Starts -->
		<div class="container">
			<!-- Start Row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="contact-text section-header text-center">
						<div>
							<h2 class="section-title" style="font-family: Algerian;">Get In Touch</h2>
						</div>
					</div>
				</div>

			</div>
			<!-- End Row -->
			<!-- Start Row -->
			<div class="row">
				<!-- Start Col -->
				<div class="col-lg-6 col-md-12">
					<form id="contactForm" action="ContactFromServlet" method="post">
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<input type="text" class="form-control" id="name" name="name"
										placeholder="Name" required
										data-error="Please enter your name">
									<div class="help-block with-errors"></div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<input type="text" placeholder="Subject" id="msg_subject"
										class="form-control" name="msg_subject" required
										data-error="Please enter your subject">
									<div class="help-block with-errors"></div>
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<input type="text" class="form-control" id="email" name="email"
										placeholder="Email" required
										data-error="Please enter your Email">
									<div class="help-block with-errors"></div>
								</div>
							</div>

							<div class="col-md-12">
								<div class="form-group">
									<textarea class="form-control" id="message" name="message"
										placeholder="Write Message" rows="4"
										data-error="Write your message" required></textarea>
									<div class="help-block with-errors"></div>
								</div>
								<div class="submit-button">
									<button class="btn btn-common" id="submit" type="submit">Submit</button>
									<div id="msgSubmit" class="h3 hidden"></div>
									<div class="clearfix"></div>
								</div>
							</div>
						</div>
					</form>
				</div>
				<!-- End Col -->
				<!-- Start Col -->
				<div class="col-lg-1"></div>
				<!-- End Col -->
				<!-- Start Col -->
				<div class="col-lg-4 col-md-12">
					<div class="contact-img">
						<img src="img/contact/01.png" class="img-fluid" alt="">
					</div>
				</div>
				<!-- End Col -->
				<!-- Start Col -->
				<div class="col-lg-1"></div>
				<!-- End Col -->

			</div>
			<!-- End Row -->
		</div>
	</section>
	<!-- Contact Us Section End -->

	<!-- Footer Section Start -->
	<footer>
		<!-- Footer Area Start -->
		<section id="footer-Content">
			<div class="container">
				<!-- Start Row -->
				<div class="row">

					<!-- Start Col -->
					<div class="col-lg-3 col-md-6 col-sm-6 col-xs-6 col-mb-12">

						<div class="footer-logo">
							<h2 style="color:white; font: bold;font-family: Algerian;">ThinkExam</h2>
						</div>
					</div>
					<!-- End Col -->
					<!-- Start Col -->
					<div class="col-lg-2 col-md-6 col-sm-6 col-xs-6 col-mb-12">
						<div class="widget">
							<h3 class="block-title">Company</h3>
							<ul class="menu">
								<li><a href="#about"> - About Us</a></li>
								<li><a href="#features">- Services</a></li>
								<li><a href="Login.jsp">- Login</a></li>
								<li><a href="#contact">- Contact</a></li>
							</ul>
						</div>
					</div>
					<!-- End Col -->
					<!-- Start Col -->
					<div class="col-lg-2 col-md-6 col-sm-6 col-xs-6 col-mb-12">
						<div class="widget">
							<h3 class="block-title">Product</h3>
							<ul class="menu">
								<li><a href="#"> - Customer Service</a></li>
								<li><a href="#">- Enterprise</a></li>
								<li><a href="#">- Price</a></li>
								<li><a href="#">- Security</a></li>
								<li><a href="#">- Why ThinkExam?</a></li>
							</ul>
						</div>
					</div>
					<!-- End Col -->
					<!-- Start Col -->
					<div class="col-lg-2 col-md-6 col-sm-6 col-xs-6 col-mb-12">
						<div class="widget">
							<h3 class="block-title">Download App</h3>
							<ul class="menu">
								<li><a href="#"> - Android App</a></li>
								<li><a href="#">- IOS App</a></li>
								<li><a href="#">- Windows App</a></li>
								<li><a href="#">- Play Store</a></li>
								<li><a href="#">- IOS Store</a></li>
							</ul>
						</div>
					</div>
					<!-- End Col -->
					<!-- Start Col -->
					<div class="col-lg-3 col-md-6 col-sm-6 col-xs-6 col-mb-12">
						<div class="widget">
							<h3 class="block-title">Subscribe Now</h3>
							<p>Subscribe Our ThinkExam Portal</p>
							<div class="subscribe-area">
								<input type="email" class="form-control"
									placeholder="Enter Email"> <span><i
									class="lni-chevron-right"></i></span>
							</div>
						</div>
					</div>
					<!-- End Col -->
				</div>
				<!-- End Row -->
			</div>
			<!-- Copyright Start  -->

			<div class="copyright">
				<div class="container">
					<!-- Star Row -->
					<div class="row">
						<div class="col-md-12">
							<div class="site-info text-center">
								<p>
									Designed & Developed By ThinkExam Portal
								</p>
							</div>

						</div>
						<!-- End Col -->
					</div>
					<!-- End Row -->
				</div>
			</div>
			<!-- Copyright End -->
		</section>
		<!-- Footer area End -->

	</footer>
	<!-- Footer Section End -->


	<!-- Go To Top Link -->
	<a href="#" class="back-to-top"> <i class="lni-chevron-up"></i>
	</a>

	<!-- Preloader -->

	<!-- End Preloader -->

	<!-- jQuery first, then Tether, then Bootstrap JS. -->
	<script src="js/jquery-min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/owl.carousel.js"></script>
	<script src="js/jquery.nav.js"></script>
	<script src="js/scrolling-nav.js"></script>
	<script src="js/jquery.easing.min.js"></script>
	<script src="js/nivo-lightbox.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/main.js"></script>

</body>
</html>