package com.exam.servlet;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.exam.DAO.StartExamDAO;
import com.exam.DAO.questionDAO;
import com.exam.model.Student;

/**
 * Servlet implementation class PaginationServlet
 */
@WebServlet("/PaginationServlet")
public class PaginationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public PaginationServlet() {
		super();
		// TODO Auto-generated constructor stub
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StartExamDAO exd = new StartExamDAO();
		HttpSession session = request.getSession();
		ServletContext sc = request.getServletContext();
		Student stud=(Student)sc.getAttribute("student-obj");
		String exam_code=(String)sc.getAttribute("exam-code");
		System.out.println("In servlet...");
		//questionDAO qd = new questionDAO();
		//int size = qd.getLength();
		//int curr = Integer.parseInt(request.getParameter("curr"));
		int curr = exd.getCurr_que();
		int que = Integer.parseInt(request.getParameter("que"));
		System.out.println("curr : "+curr+"que : "+que);
		boolean b = exd.check_que(que-1);
		if(b)
		{
			//message
			session.setAttribute("answered","You have already attempted that question");
			response.sendRedirect("StartExam.jsp");
		}else {
			if(curr == que-1)
				response.sendRedirect("StartExam.jsp");
			if(curr<que-1) {
				while(curr<que-1)
				{
					curr = curr + 1;
				}
				System.out.println(curr);
			}else {
				while(curr>que-1)
				{
					curr = curr - 1;
				}
				System.out.println(curr);
			}
			exd.update_currque(curr,stud.getStudId(),exam_code);
			response.sendRedirect("StartExam.jsp"); 
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
