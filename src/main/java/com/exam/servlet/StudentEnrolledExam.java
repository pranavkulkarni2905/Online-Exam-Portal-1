package com.exam.servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.exam.DAO.RequestDAO;
import com.exam.DAO.examDAO;
import com.exam.model.Student;

/**
 * Servlet implementation class StudentEnrolledExam
 */
@WebServlet("/StudentEnrolledExam")
public class StudentEnrolledExam extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentEnrolledExam() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		ServletContext sc=request.getServletContext();
		Student stud=(Student)sc.getAttribute("student-obj");
		
		
		RequestDAO rd=new RequestDAO();
		ResultSet rs=rd.getDataByStudId("Accepted", stud.getStudId());
		try {
			while(rs.next()) {
				
//					SimpleDateFormat ft=new SimpleDateFormat("dd/MM/yyyy");
//					Date now=new Date();
				//DateTimeFormatter df=DateTimeFormatter.ofPattern(")
				LocalDate now=LocalDate.now();
					System.out.println(now);
					//Date date2=new SimpleDateFormat("dd/MM/yyyy").parse(today);
					//Date date1=new SimpleDateFormat("dd/MM/yyyy").parse(rs.getString(10));
					//int num=date1.compareTo(today);
					LocalDate date1=LocalDate.parse(rs.getString(10));
					System.out.println(date1);
					
					if(date1.isBefore(now)){
						rd.updateFlag(1, rs.getInt(1));
					}
				}
				
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	
		response.sendRedirect("StudentEnrolledExam.jsp");
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
