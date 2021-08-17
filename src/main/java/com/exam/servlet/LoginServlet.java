package com.exam.servlet;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.exam.DAO.facultyDAO;
import com.exam.DAO.studentDAO;
import com.exam.model.Faculty;
import com.exam.model.Student;
import com.exam.verify.VerifyRecaptcha;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		// get reCAPTCHA request param
		String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
		System.out.println(gRecaptchaResponse);
		boolean verify = VerifyRecaptcha.verify(gRecaptchaResponse);
		
		studentDAO sd = new studentDAO();
		facultyDAO fd = new facultyDAO();
		Student stud = sd.checkStudent(email, password);
		if(verify) {
		if (stud != null) {
			boolean b = sd.checkFlag(email);
			if (b && verify) {
				ServletContext sc=request.getServletContext();
				sc.setAttribute("student-obj", stud);
				session.setAttribute("stud-obj", stud);
				System.out.println(stud.getfName());
				response.sendRedirect("StudentDashboard.jsp");
				} else {
				session.setAttribute("not-verify", false);
				response.sendRedirect("Login.jsp");
			}
		} else {
			Faculty fac  = fd.checkFaculty(email, password);
			if (fac != null) {
				boolean b1 = fd.checkFlag(email);
				if (b1 && verify) {
					ServletContext sc=request.getServletContext();
					sc.setAttribute("faculty-obj", fac);
					session.setAttribute("fac-obj", fac);
					response.sendRedirect("FacultyDashboard.jsp");
				} else {
					session.setAttribute("not-verify", false);
					response.sendRedirect("Login.jsp");
				}
			} else {
				session.setAttribute("login-fail", "Invalid Email or Password..!");
				response.sendRedirect("Login.jsp");
				
			}
			
		}
		}else {
			session.setAttribute("captacha-fail", "You Missed The Captcha..!!");
			response.sendRedirect("Login.jsp");
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
