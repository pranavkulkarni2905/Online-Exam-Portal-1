package com.exam.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.exam.DAO.RequestDAO;
import com.exam.DAO.studentDAO;
import com.exam.model.Request;
import com.exam.model.Student;
import com.exam.verify.SendOtp;

/**
 * Servlet implementation class FacultyDeclineRequestServlet
 */
@WebServlet("/FacultyDeclineRequestServlet")
public class FacultyDeclineRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FacultyDeclineRequestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int reqId=Integer.parseInt(request.getParameter("req_id"));
			RequestDAO rd=new RequestDAO();
			rd.updateStatus("Declined", reqId);
			
			Request r = rd.getDataByReqId(reqId);
			studentDAO sd = new studentDAO();
			Student stud = sd.getDataById(r.getStudId());
			String mobNO = stud.getMobNo();
			String msg = "Ooops !!!\n Your Request Declined By Faculty (" + r.getFacId()
					+ ") for Exam Code '" + r.getExamCode() + "' and Course Name '" + r.getCourseName() + "'\n."
					+ new Date().toLocaleString() + "\nRegards,\nThinkExam Online Portal.";
			SendOtp s = new SendOtp();
			s.sendSms(msg, mobNO);
			
			
			HttpSession session=request.getSession();
			session.setAttribute("req-decline", "You Declined Request.");
			response.sendRedirect("FacultyNotification.jsp");
		} catch (NumberFormatException e) {
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
