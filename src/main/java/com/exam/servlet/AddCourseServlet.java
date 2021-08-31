package com.exam.servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.exam.DAO.courseDAO;
import com.exam.model.Course;
import com.exam.model.Faculty;

@WebServlet("/AddCourseServlet")
public class AddCourseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddCourseServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		ServletContext sc = request.getServletContext();
		boolean bool = true;
		Faculty f = (Faculty) sc.getAttribute("faculty-obj");
		int facId = f.getFacId();

		courseDAO cd = new courseDAO();
		ResultSet rs = cd.getAllData();

		int courseid = 0;
		try {
			courseid = Integer.parseInt(request.getParameter("ccode"));
		} catch (NumberFormatException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String coursename = request.getParameter("cname");

		try {
			while (rs.next()) {
				if (courseid == rs.getInt(1)) {
					bool = false;
					session.setAttribute("cid-repeat", "Course Code is Already Exist.Please Enter Another .");
					response.sendRedirect("addcourse.jsp");
				}
				if (coursename.equals(rs.getString(2))) {
					bool = false;
					session.setAttribute("cname-repeat", "Course Name is Already Exist.Please Enter Another .");
					response.sendRedirect("addcourse.jsp");
				}

			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException | IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if (bool) {
			Course a = new Course(courseid, coursename, f);
			
			boolean b = cd.Addcourses(a, facId);
			int count=0;
			if (b) {
				
				sc.setAttribute("course-count", count++);
				session.setAttribute("course-add-success", true);
				response.sendRedirect("addcourse.jsp");

			} else {
				session.setAttribute("course-add-fail", false);
				response.sendRedirect("addcourse.jsp");
			}
		}
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
