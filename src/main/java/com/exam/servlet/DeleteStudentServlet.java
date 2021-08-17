package com.exam.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.exam.DAO.studentDAO;

@WebServlet("/DeleteStudentServlet")
public class DeleteStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeleteStudentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int studid=Integer.parseInt(request.getParameter("stud_id"));
			studentDAO sd = new studentDAO();
			HttpSession session=request.getSession();
			boolean b=sd.deleteStudent(studid);
			if(b) {
				session.setAttribute("delete-stud-success", true);
				response.sendRedirect("DisplayStudents.jsp");
			}
			else {
				session.setAttribute("delete-stud-fail", false);
				response.sendRedirect("DisplayStudents.jsp");
			}
		} catch (NumberFormatException | IOException e) {
			e.printStackTrace();
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
