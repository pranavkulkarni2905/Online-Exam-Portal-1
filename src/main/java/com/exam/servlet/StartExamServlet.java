package com.exam.servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.Arrays;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.exam.DAO.StartExamDAO;
import com.exam.DAO.examDAO;
import com.exam.DAO.questionDAO;
import com.exam.model.Question;
import com.exam.model.Student;

/**
 * Servlet implementation class StartExamServlet
 */
@WebServlet("/StartExamServlet")
public class StartExamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public StartExamServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ServletContext sc=request.getServletContext();
		Student s=(Student)sc.getAttribute("student-obj");
		String exam_code = request.getParameter("exam_code");
		HttpSession session = request.getSession();
		examDAO ed = new examDAO();
		ResultSet rs = ed.getAllData();
		String course_name = null;
		String time = null;
		String date = null;
		try {
			while (rs.next()) {
				if (rs.getString(1).equals(exam_code)) {
					course_name = rs.getString(5);
					time = rs.getString(4);
					date = rs.getString(3);
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

		
			sc.setAttribute("course-name", course_name);
			sc.setAttribute("exam-code", exam_code);
			sc.setAttribute("exam-date", date);
			questionDAO qd = new questionDAO();
			Question que[] = qd.getQueByCid(exam_code);
			int size = que.length;
			 Random r = new Random();
	         
		       //code for shuffle array
		        for (int i = size-1; i > 0; i--) {
		             
		            
		            int j = r.nextInt(i+1);
		            
		            Question temp = que[i];
		            que[i] = que[j];
		            que[j] = temp;
		        }
		        // Prints the random array
		        System.out.println(Arrays.toString(que));
			qd.setLength(size,s.getStudId(),exam_code);
			session.setAttribute("exam-time", time);
			StartExamDAO std = new StartExamDAO();
			std.setValue(s.getStudId(),exam_code);
			std.setValue_counter(s.getStudId(),exam_code);
			sc.setAttribute("que", que);

			response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.

			response.setHeader("Pragma", "no-cache"); // HTTP 1.0.

			response.setDateHeader("Expires", 0); // Proxies.

			response.sendRedirect("StartExam.jsp");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
