<%@page import="java.sql.ResultSet"%>
<%@page import="com.exam.DAO.resultDAO"%>
<%@page import="com.exam.model.Student"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
	ServletContext sc2=request.getServletContext();
	Student s2=(Student)sc2.getAttribute("student-obj");
	if(s2==null){
		session.setAttribute("pls-login", "Please Login Here...");
		response.sendRedirect("Login.jsp");
	}
	%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Result Details</title>
<script src="js/secure.js"></script>
<SCRIPT type="text/javascript">
    window.history.forward();
    function noBack() { window.history.forward(); }
</SCRIPT>
<%

response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);
    if(session.getAttribute("token")==null){
    //response.sendRedirect(request.getContextPath() + "/LogOut.jsp");

}
%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.4/jspdf.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.js"></script>

<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round|Open+Sans">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<style>
body {
    color: #404E67;
    background: #F5F7FA;
    font-family: 'Open Sans', sans-serif;
}
.table-wrapper {
    width: 800px;
    margin: 60px auto;
    background: #fff;
    padding: 20px;	
    box-shadow: 0 1px 1px rgba(0,0,0,.05);
}
.table-title {
    padding-bottom: 10px;
    margin: 0 0 10px;
}
.table-title h2 {
    margin: 6px 0 0;
    font-size: 22px;
}
.table-title .add-new {
    float: right;
    height: 30px;
    font-weight: bold;
    font-size: 12px;
    text-shadow: none;
    min-width: 100px;
    border-radius: 50px;
    line-height: 13px;
}
.table-title .add-new i {
    margin-right: 4px;
}
table.table tr th, table.table tr td {

    border-color:#e9e9e9;
}
table.table th i {
    font-size: 13px;
    margin: 10 5px;
    cursor: pointer;
}
table.table th:last-child {
    width: 200px;
}
table.table td a {
    cursor: pointer;
    display: inline-block;
    margin: 10 5px;
    min-width: 24px;
}    
table.table td a.add {
    color: #27C46B;
}
table.table td a.edit {
    color: #FFC107;
}
table.table td a.delete {
    color: #E34724;
}
table.table td i {
    font-size: 19px;
}
table.table td a.add i {
    font-size: 24px;
    margin-right: -1px;
    position: relative;
    top: 3px;
}    
table.table .form-control {
    height: 32px;
    line-height: 32px;
    box-shadow: none;
    border-radius: 2px;
}
table.table .form-control.error {
    border-color: #f50000;
}
table.table td .add {
    display: none;
}
body {
	background: linear-gradient(to bottom, #33ccff 0%, #ff99cc 100%);
}
</style>

</head>
<body onload="noBack();" 
	onpageshow="if (event.persisted) noBack();" onunload="">
<div  class="container-lg" >
    <div class="table-responsive">
        <div class="table-wrapper"  >
            
                <%try{
                ServletContext sc=request.getServletContext();
                //Student stud=(Student)sc.getAttribute("student-obj");
                //String exam_code=(String)sc.getAttribute("exam-code");
               // String date=(String)sc.getAttribute("exam-date");
                int resId=Integer.parseInt(request.getParameter("res_id")) ;
                int studId=Integer.parseInt(request.getParameter("stud_id")) ;
                resultDAO rd=new resultDAO();
                ResultSet rs=rd.getResult(resId, studId);
                if(rs.next()){
                	%>
                	<div id="invoice">
                	<div class="table-title">
                <div class="row">
                <img src="images/logo.png" width="100px" height="60px">
                    <div class="col-sm-12"><h2><center><b>RESULT DETAILS</b></center></h2></div>
                    <div class="col-sm-12"><b>Result Id :</b> <%=rs.getInt(1) %></div><hr>
                    
                </div>
            </div>
            <table class="table table-bordered">
                <thead>
                   
                </thead>
                	 <tbody>
                	 <tr>
                	 <th colspan="2">Exam Date</th>
                        <td colspan="2"><%=rs.getString(15) %></td>
                        

                    </tr>
                	 <tr>
                	 <th>Student Id</th>
                        <td><%=rs.getInt(2) %></td>
                        <th>Student Name</th>
                        <td><%=rs.getString(3) %></td>

                    </tr>     
                    <tr>
                        <th>Exam Code</th>
                        <td><%=rs.getString(4) %></td>
                        <th>Course Name</th>
                        <td><%=rs.getString(5) %></td>
                    </tr>
                    <tr >
                        <th colspan="2">No Of Total Questions</th>
                        <td colspan="2"><%=rs.getInt(8)%></td>


                    </tr>
                     
                    <tr> 
                    <th>Attempted</th>
                        <td><%=rs.getInt(9) %></td>
                        <th>Non-Attempted</th>
                        <td><%=rs.getInt(10) %></td>
                    </tr>
                    <tr>
                    <th>Corrected</th>
                        <td><%=rs.getInt(11) %></td>
                        <th>InCorrected</th>
                        <td><%=rs.getInt(12) %></td>
                  </tr>
                  <tr>
                    <th>Obtained Marks</th>
                        <td><%=rs.getInt(7) %></td>
                        <th>Total Marks</th>
                        <td><%=rs.getInt(6) %></td>
                  </tr>
                  <tr>
                    <th colspan="2">Percentage</th>
                    <td colspan="2"><%=rs.getInt(13) %> %</td>
                  </tr>
                  <tr>
                    <th colspan="2">Result</th>
                    <td colspan="2"><%=rs.getString(14) %></td>

                  </tr>
                 

                </tbody>
                	<% 
                }
                }catch(Exception e){
                	e.printStackTrace();
                }
                %>
               
            </table>
            </div>
            <button  class="btn btn-success" id="download"><i class="fa fa-download"></i> Download</button>
            <a href="StudentDashboard.jsp" class="btn btn-primary"><i class="fa fa-arrow-left"></i> Back</a>
        </div>
    </div>
</div>   

<script type="text/javascript">
window.onload = function () {
    document.getElementById("download")
        .addEventListener("click", () => {
            const invoice = this.document.getElementById("invoice");
            console.log(invoice);
            console.log(window);
            var opt = {
                margin: 1,
                filename: 'ThinkExam_Result.pdf',
                image: { type: 'jpeg', quality: 1 },
                html2canvas: { scale: 2 },
                jsPDF: { unit: 'in', format: 'letter', orientation: 'portrait' }
            };
            html2pdf().from(invoice).set(opt).save();
        })
}
</script>  
<script src="js/secure.js"></script>
</body>
</html>