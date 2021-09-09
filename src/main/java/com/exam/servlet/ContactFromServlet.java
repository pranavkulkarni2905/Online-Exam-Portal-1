package com.exam.servlet;

import java.io.IOException;

import javax.net.ssl.SSLException;
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
 * Servlet implementation class ContactFromServlet
 */
@WebServlet("/ContactFromServlet")
public class ContactFromServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ContactFromServlet() {
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
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String msg_subject = request.getParameter("msg_subject");
			String msg = request.getParameter("message");

			HttpSession session = request.getSession();

			String sub = "New Mail On Contact Form By " + name;
			String content = "\nName : " + name + "\n\nEmail : " + email + "\n\nSubject : " + msg_subject + "\n\nMessage : "
					+ msg;
			ExistMail em = new ExistMail();
			if (em.isAddressValid(email)) {
				SendMail s = new SendMail();
				s.sendEmail("exam.webportal12@gmail.com", sub, content);
				session.setAttribute("msg-sent", true);
				response.sendRedirect("Index.jsp");

			} else {
				session.setAttribute("invalid-email-addr", false);
				response.sendRedirect("Index.jsp");
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
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
