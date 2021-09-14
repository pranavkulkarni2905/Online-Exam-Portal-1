<%@page import="java.sql.ResultSet"%>
<%@page import="com.exam.DAO.resultDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8">


<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.4/jspdf.min.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.js"></script>
<link rel="stylesheet"
	href="path/to/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="js/secure.js"></script>
<style>
body {
	margin: 0;
	padding: 0;
	align-items: center;
	height: 188mm;
}

.border-pattern {
	position: absolute;
	left: 4mm;
	top: 4mm;
	height: 200mm;
	width: 267mm;
	border: 1mm solid #991B1B;
	/* http://www.heropatterns.com/ */
	background-color: #d6d6e4;
	background-image:
		url("data:image/svg+xml,%3Csvg width='16' height='16' viewBox='0 0 16 16' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M0 0h16v2h-6v6h6v8H8v-6H2v6H0V0zm4 4h2v2H4V4zm8 8h2v2h-2v-2zm-8 0h2v2H4v-2zm8-8h2v2h-2V4z' fill='%23991B1B' fill-opacity='1' fill-rule='evenodd'/%3E%3C/svg%3E");
}

.content {
	position: absolute;
	left: 10mm;
	top: 10mm;
	height: 198mm;
	width: 245mm;
	border: 1mm solid #991B1B;
	background: white;
}

.inner-content {
	border: 1mm solid #991B1B;
	margin: 4mm;
	padding: 10mm;
	height: 170mm;
	text-align: center;
}

h1 {
	text-transform: uppercase;
	font-size: 34pt;
	margin-bottom: 0;
}

h2 {
	font-size: 24pt;
	margin-top: 0;
	padding-bottom: 1mm;
	display: inline-block;
	border-bottom: 1mm solid #991B1B;
}

h2::after {
	content: "";
	display: block;
	padding-bottom: 4mm;
	border-bottom: 1mm solid #991B1B;
}

h3 {
	font-size: 20pt;
	margin-bottom: 0;
	margin-top: 10mm;
}

p {
	font-size: 16pt;
}

.badge {
	width: 40mm;
	height: 40mm;
	position: absolute;
	right: 10mm;
	bottom: 10mm;
	background-image:
		url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 24 24' stroke='currentColor'%3E%3Cpath stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M9 12l2 2 4-4M7.835 4.697a3.42 3.42 0 001.946-.806 3.42 3.42 0 014.438 0 3.42 3.42 0 001.946.806 3.42 3.42 0 013.138 3.138 3.42 3.42 0 00.806 1.946 3.42 3.42 0 010 4.438 3.42 3.42 0 00-.806 1.946 3.42 3.42 0 01-3.138 3.138 3.42 3.42 0 00-1.946.806 3.42 3.42 0 01-4.438 0 3.42 3.42 0 00-1.946-.806 3.42 3.42 0 01-3.138-3.138 3.42 3.42 0 00-.806-1.946 3.42 3.42 0 010-4.438 3.42 3.42 0 00.806-1.946 3.42 3.42 0 013.138-3.138z' /%3E%3C/svg%3E");
}

.abc {
	float: right;
	margin-top: 25%;
	margin-right: 70px;
	color: white;
	width: 10%;
	height: 5%;
	font-size: 20px;
	text-align: center;
}
</style>
</head>
<body>

			
				
					<%
					try {
						ServletContext sc = request.getServletContext();
						//Student stud=(Student)sc.getAttribute("student-obj");
						//String exam_code=(String)sc.getAttribute("exam-code");
						// String date=(String)sc.getAttribute("exam-date");
						int resId = Integer.parseInt(request.getParameter("res_id"));
						int studId = Integer.parseInt(request.getParameter("stud_id"));
						resultDAO rd = new resultDAO();
						ResultSet rs = rd.getResult(resId, studId);
						if (rs.next()) {
							if(rs.getFloat(13)>=40){
					%>

<div class="border-pattern">
					<div class="content">
<div id="abc">
						<div class="inner-content">
							<h3>ThinkExam Presents The ,</h3>
							<h1>CERTIFICATE OF ACHIEVEMENT</h1>
							<h2>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</h2>
							<h3>This Certificate Is Proudly Presented To</h3>
							<h1 style="font-size: 30px;">
								"<%=rs.getString(3)%>"
							</h1>
							<h3>
								For successfully Completing
								<p>
									'<%=rs.getString(5)%>'
								</p>
								Exam with A Score of
								<%=rs.getInt(13)%>%
							</h3>
							<h3>On</h3>
							<p><%=rs.getString(15)%></p>
							<div class="badge"></div>
						</div>
					</div>

				</div>
			</div>

	<%
	}else{
		HttpSession session1=request.getSession();
		session1.setAttribute("certificate-invalid", false);
		response.sendRedirect("StudentViewResult.jsp");
	}
						}
	} catch (Exception e) {
	e.printStackTrace();
	}
	%>

	<button class="btn btn-success abc" id="download"
		style="background-color: green;">
		<i class="fa fa-download"></i> Download
	</button>
	&nbsp&nbsp
	<a href="StudentDashboard.jsp">
		<button class="btn btn-primary abc" style="background-color: blue;">
			<i class="fa fa-arrow-left"></i> Back
		</button>
	</a>

	<script type="text/javascript">
window.onload = function () {
    document.getElementById("download")
        .addEventListener("click", () => {
            const invoice = this.document.getElementById("abc");
            console.log(invoice);
            console.log(window);
            var opt = {
                margin: 0.2,
                filename: 'ThinkExam_Achivement_Certificate.pdf',
                image: { type: 'jpeg', quality: 1 },
                html2canvas: { scale: 2 },
                jsPDF: { unit: 'in', format: 'A4', orientation: 'portrait' }
            };
            html2pdf().from(invoice).set(opt).save();
        })
}
</script>
<script src="js/secure.js"></script>
</body>
</html>
