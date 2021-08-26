package com.exam.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.exam.DAO.examDAO;
import com.exam.model.Exam;

/**
 * Servlet implementation class EditExamServlet
 */
@WebServlet("/EditExamServlet")
public class EditExamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EditExamServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			String e_code = request.getParameter("examcode");
			String e_name = request.getParameter("examname");
			//String cname = request.getParameter("cname");
			String e_date = request.getParameter("date");
			String e_time = request.getParameter("optradio");
			examDAO ed = new examDAO();
			Exam e = new Exam();
			e.setExamCode(e_code);
			e.setExamName(e_name);
			//e.setcName(cname);
			e.setExamDate(e_date);
			e.setExamTime(e_time);
			System.out.println("In servlet");
			boolean b = ed.editExam(e);
			if(b)
			{
				session.setAttribute("exam-edit-success",true);
				response.sendRedirect("SetExam.jsp");
			}else {
				session.setAttribute("exam-edit-fail",false);
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
