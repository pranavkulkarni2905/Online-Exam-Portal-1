<%@page import="java.sql.ResultSet"%>
<%@page import="com.exam.DAO.questionDAO"%>
<%@page import="com.exam.DAO.StartExamDAO"%>
<%@page import="com.exam.DAO.RequestDAO"%>
<%@page import="com.exam.DAO.resultDAO"%>
<%@page import="com.exam.DAO.examDAO"%>
<%@page import="com.exam.model.Student"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
<script src="js/secure.js"></script>
</head>
<body>
	<%
	StartExamDAO exd = new StartExamDAO();
	questionDAO qd = new questionDAO();
	ServletContext sc = request.getServletContext();
	Student stud = (Student) sc.getAttribute("student-obj");
	String exam_code = (String) sc.getAttribute("exam-code");
	int size = qd.getLength(stud.getStudId(), exam_code);
	ResultSet rs = exd.getCounter(stud.getStudId(), exam_code);
	int attempted = 0;
	int corrected = 0;
	int incorrected = 0;
	if (rs.next()) {
		attempted = rs.getInt(1);
		corrected = rs.getInt(2);
		// int non_attempted = rs.getInt(4);
		incorrected = rs.getInt(3);
	}
	int resultId = 0;
	ArrayList<Integer> list = new ArrayList<Integer>();
	for (int i1 = 1; i1 < 500000; i1++) {
		list.add(new Integer(i1));
	}
	Collections.shuffle(list);
	for (int i1 = 1; i1 <= 8000; i1++) {
		resultId = list.get(i1);
	}
	int sid = stud.getStudId();
	String sName = stud.getfName() + " " + stud.getlName();
	System.out.println(sid + sName);
	examDAO ed = new examDAO();
	System.out.println(exam_code);

	String cName = (String) sc.getAttribute("course-name");
	String date = (String) sc.getAttribute("exam-date");
	System.out.println(cName);
	double per = 0;
	int total_marks = 0;
	int non_attempt = 0;
	int obtained_marks = 0;
	try {
		total_marks = size * 2;
		obtained_marks = corrected * 2;
		non_attempt = size - attempted;
	    per = (obtained_marks * 100) / total_marks;
		System.out.println(total_marks + " " + per);
	} catch (ArithmeticException e) {
		e.printStackTrace();
	}
	String result = null;
	if (per >= 40) {
		result = "Pass";
	} else {
		result = "Fail";
	}
	resultDAO rd = new resultDAO();
	rd.insertResult(resultId, sid, sName, exam_code, cName, total_marks, obtained_marks, size, attempted, non_attempt,
			corrected, incorrected, per, result, date);
	sc.setAttribute("result-id", resultId);
	RequestDAO rd1 = new RequestDAO();
	rd1.updateExamCompletedStatus("Yes", sid, exam_code);
	exd.truncateAll(stud.getStudId(), exam_code);
	session.removeAttribute("exam-time");
	//int time=Integer.parseInt(request.getParameter("timer"));
	//System.out.println(time);
	//pw.print("<script>localStorage.clear();</script>");
	response.sendRedirect("ExamSummary.jsp");
	%>
	<script src="js/secure.js"></script>
</body>
</html>