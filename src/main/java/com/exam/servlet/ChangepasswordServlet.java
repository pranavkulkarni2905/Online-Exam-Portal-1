package com.exam.servlet;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.exam.DAO.commmonDAO;
import com.exam.model.Student;

/**
 * Servlet implementation class ChangepasswordServlet
 */
@WebServlet("/ChangepasswordServlet")
public class ChangepasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ChangepasswordServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String password=request.getParameter("oldpassword");
			String newpassword=request.getParameter("password");
			String confirmPassword=request.getParameter("confirmPassword");
			HttpSession session=null;
			ServletContext sc=request.getServletContext();
			Student s=(Student)sc.getAttribute("student-obj");
			if(s.getPassword().equals(password))
			{
				if(newpassword.equals(confirmPassword)) 
				{
					commmonDAO cd=new commmonDAO();
					session=request.getSession();
					boolean b=cd.changePassword(newpassword,s.getEmail(),password);
					if(b) {
						session=request.getSession();
						session.setAttribute("pass-update-success", true);
						response.sendRedirect("Changepassword.jsp");
					}else {
						session=request.getSession();
						session.setAttribute("pass-update-fail", false);
						response.sendRedirect("Changepassword.jsp");
					}
				}else {
					session=request.getSession();
					session.setAttribute("pass-notMatch", "Password Does Not match");
					response.sendRedirect("Changepassword.jsp");
				}
			}
			else
			{
				session=request.getSession();
				session.setAttribute("oldpass", "Password Does Not match with oldpassword");
				response.sendRedirect("Changepassword.jsp");
			}
		}catch(NullPointerException np) {
			np.printStackTrace();
		}
		catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
