package com.exam.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.exam.verify.ExistMail;
import com.exam.verify.SendMail;
import com.exam.verify.sendHtmlMail;

/**
 * Servlet implementation class ForgotPasswordServlet
 */
@WebServlet("/ForgotPasswordServlet")
public class ForgotPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ForgotPasswordServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String email = request.getParameter("email");
			ExistMail em = new ExistMail();
			boolean b = em.isAddressValid(email);
			if (b == true) {
				sendHtmlMail sm = new sendHtmlMail();
				String sub = "[ThinkExam] Password Reset E-mail";
				String msg = "<div style=\"width:100%; height:100%; margin-top: 10px;margin-left:10px; background-color: white;\">\r\n"
						+ "<div class=\"card\" style =\"width:100%; height:70%; margin:0 auto; background-color: black;\">\r\n"
						+ "    <header class=\"header\" style=\"background-color: black;\">\r\n"
						+ "   <img src=\"https://mdbootstrap.com/img/Mockups/Lightbox/Thumbnail/img%20(67).jpg\" height=\"200px\" width=\"50%\" style=\"margin-top: 15px; margin-left: 25%; color: black;align:center;\">\r\n"
						+ "   </header>\r\n"
						+ "     \r\n"
						+ "      <div class=\"cotainer\" style=\"height: 620px;background-color:black;color:white;\">\r\n"
						+ "      <p style=\"margin-left: 25%;\"><br>Hello, <br> Forgotte'n password.. Don't Worry<br><br>No need to worry,you can reset your ThinkExam password by clicking the button below.<br>You are receiving this email beacause you or someone else has requested a password reset for your account.<br><br>If you did not request a password reset you can safely ignore this email.</p>\r\n"
						+ "\r\n"
						+ "     <p style=\"margin-left: 25%;\"><a href=\"http://localhost:8007/Online_Exam_Portal/ResetPassword.jsp\"><button type=\"button\" class=\"button\" style=\"text-align: center; width:270px; height:50px;border: none;outline: 0;display: inline-block;padding: 5px;color:white;background-color:green;text-align: center;cursor: pointer;width: 35%;\">Reset Password</button></a></p><br>\r\n"
						+ "       \r\n"
						+ "         <p style=\"margin-left: 25%;\"> If you have any concerns ,please contact us at<br><br>\r\n"
						+ "          thinkexamportal@gmail.co<br><br></p><p style=\"margin-left: 25%;\">\r\n"
						+ "\r\n"
						+ "          Thanks,<br>\r\n"
						+ "          Team ThinkExam Portal</p>\r\n"
						+ "      </p>\r\n"
						+ "      </div>\r\n"
						+ "    </div>\r\n"
						+ "</div>";

				sm.sendMail(email, sub, msg);
				HttpSession session = request.getSession();
				session.setAttribute("e1", "We Have Sent a Email on "+email+" For Reset Password.");
				response.sendRedirect("Login.jsp");
			} else {
				HttpSession session = request.getSession();
				session.setAttribute("email", "Invalid Email-Id..Please Enter Valid One.");
				response.sendRedirect("Login.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
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
