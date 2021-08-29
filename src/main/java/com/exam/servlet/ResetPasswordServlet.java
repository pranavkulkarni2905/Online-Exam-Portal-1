package com.exam.servlet;

import java.io.IOException;
import java.util.Base64;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.exam.DAO.commmonDAO;
import com.exam.DAO.studentDAO;

/**
 * Servlet implementation class ResetPasswordServlet
 */
@WebServlet("/ResetPasswordServlet")
public class ResetPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResetPasswordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String password=request.getParameter("password");
			String ecryptedPass=Base64.getEncoder().encodeToString(password.getBytes());
			String confirmPassword=request.getParameter("confirmPassword");
			HttpSession session=null;
			if(password.contentEquals(confirmPassword)) {
				commmonDAO cd=new commmonDAO();
				session=request.getSession();
				ServletContext sc=request.getServletContext();
				String email=(String)sc.getAttribute("forgot-email");
				//String email=(String)session.getAttribute("e1");
				boolean b=cd.resetPassword(ecryptedPass,email);
				if(b) {
					session=request.getSession();
					session.setAttribute("pass-update-success", true);
					response.sendRedirect("Login.jsp");
				}else {
					session=request.getSession();
					session.setAttribute("pass-update-fail", false);
					response.sendRedirect("Login.jsp");
				}
			}else {
				session=request.getSession();
				session.setAttribute("pass-notMatch", "Password Does Not match");
				response.sendRedirect("ResetPassword.jsp");
			}
		}catch(NullPointerException np) {
			np.printStackTrace();
		}
		catch (IOException e) {
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
