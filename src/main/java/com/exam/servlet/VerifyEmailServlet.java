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


/**
 * Servlet implementation class VerifyEmailServlet
 */
@WebServlet("/VerifyEmailServlet")
public class VerifyEmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VerifyEmailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=null;
		HttpSession s1=request.getSession();
		commmonDAO cd=new commmonDAO();
		try {
			int studId=Integer.parseInt((String) s1.getAttribute("studId"))  ;
			boolean b=cd.verifyEmailStudent(studId);
			if(b) {
				session=request.getSession();
				session.setAttribute("verify-email",true);
				
			}
			else {
				session=request.getSession();
				session.setAttribute("verify-email-fail",false);
			}
		
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		try {
			int facId=Integer.parseInt((String) s1.getAttribute("facId"));
			System.out.println(facId);
			boolean b1=cd.verifyEmailFaculty(facId);
			if(b1) {
				session=request.getSession();
				session.setAttribute("verify-email",true);
				
			}else {
				session=request.getSession();
				session.setAttribute("verify-email-fail",false);
			}
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		response.sendRedirect("Login.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
