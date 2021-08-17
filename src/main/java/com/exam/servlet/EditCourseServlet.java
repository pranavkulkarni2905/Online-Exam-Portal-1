package com.exam.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.exam.DAO.courseDAO;

/**
 * Servlet implementation class EditCourseServlet
 */
@WebServlet("/EditCourseServlet")
public class EditCourseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditCourseServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int courseCode=Integer.parseInt(request.getParameter("courseCode"));
		int ccode=Integer.parseInt(request.getParameter("ccode"));
		String cname=request.getParameter("cname");
		HttpSession session=request.getSession();
		courseDAO cd=new courseDAO();
		boolean b=cd.editCourse(courseCode, cname, ccode);
		if(b) {
			session.setAttribute("edit-course-success",true);
			response.sendRedirect("DisplayCourse.jsp");
		}
		else {
			session.setAttribute("edit-course-fail",false);
			response.sendRedirect("DisplayCourse.jsp");
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
