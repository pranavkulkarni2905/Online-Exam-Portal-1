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
import com.exam.model.Question;

/**
 * Servlet implementation class NextServlet
 */
@WebServlet("/NextServlet")
public class NextServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public NextServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try
		{
			//HttpSession session = request.getSession();
			ServletContext sc = request.getServletContext();
			StartExamDAO exd = new StartExamDAO();
			questionDAO qd = new questionDAO();
			int i = Integer.parseInt(request.getParameter("curr"));
			int size = qd.getLength();
			System.out.println(size);
			Question q = (Question) sc.getAttribute("question");
			//int que_id = q.getqId();
			if (i<size-1)//0<=2---1<=2---2<2
			{
				System.out.println("i : " + i);
				int curr = i + 1;
				System.out.println(curr);//2
				exd.update_currque(curr);
				response.sendRedirect("StartExam.jsp");
			} else {
				response.sendRedirect("StartExam.jsp");
			}
		} catch (Exception e) {

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
