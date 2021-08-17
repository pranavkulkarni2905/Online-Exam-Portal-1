<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<title>Verify Email | ThinkExam</title>
    <body>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
%>
        <head>
             <header class="header">
                   <img src="images/logo.png" width="150px" height="60px" style="margin-left: 150px; margin-top: 20px;margin-bottom: 50px; color: black;">
                 
             </header>
        
        
   <style>

.header{
      background-color: black;
      color: white;
      width:1555px;
      height:90px;
}  
.button {
  border: none;
  outline: 0;
  display: inline-block;
  padding: 5px;
  color:white;
  background-color:blue;
  text-align: center;
  cursor: pointer;
  width: 100%;

}
.top{
  position: absolute;
  top: 200px;
  left: 200px;
}


  
    </style>
                <div class="image">
                 <img src="images/signup-image.jpg" width="600px" height="550px" style="margin-left: 50%;"> 
                 <div class="top">
                <h1 style="color:maroon;">Your Email Is Verified!</h1>
                <h3 style="color:maroon;">Thank You For Verifying Your Email Address.</h3><br>
                <p><a href="VerifyEmailServlet"><button type="button" class="button" style="text-align: center; width:270px; height:50px;">Click Here To Access Your Courses</button></a></p>
                 </div>
                </div>
        
            </head>


    </body>

</html>