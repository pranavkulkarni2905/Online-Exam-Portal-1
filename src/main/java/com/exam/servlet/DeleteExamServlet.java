package com.exam.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.exam.DAO.examDAO;

/**
 * Servlet implementation class DeleteExamServlet
 */
@WebServlet("/DeleteExamServlet")
public class DeleteExamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public DeleteExamServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			String examcode = request.getParameter("exam_code");
			examDAO ed = new examDAO();
			boolean b = ed.deleteExam(examcode);
			if(b)
			{
				session.setAttribute("exam-delete-success", true);
				response.sendRedirect("SetExam.jsp");
			}else {
				session.setAttribute("exam-delete-fail", false);
				response.sendRedirect("SetExam.jsp");
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
