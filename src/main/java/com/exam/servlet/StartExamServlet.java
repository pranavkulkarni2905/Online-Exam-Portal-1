package com.exam.servlet;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.exam.DAO.StartExamDAO;
import com.exam.DAO.questionDAO;
import com.exam.model.Question;

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

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String exam_code = request.getParameter("exam_code");
		questionDAO qd = new questionDAO();
		Question que[] = qd.getQueByCid(exam_code);
		int size = que.length;
		qd.setLength(size);
		ServletContext sc = request.getServletContext();
		sc.setAttribute("exam-code",exam_code);
		StartExamDAO std = new StartExamDAO();
		std.setValue();
		std.setValue_counter();
		sc.setAttribute("que",que);
		response.sendRedirect("StartExam.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
