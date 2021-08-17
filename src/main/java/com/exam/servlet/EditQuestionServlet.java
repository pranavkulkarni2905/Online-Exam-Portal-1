package com.exam.servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.exam.DAO.courseDAO;
import com.exam.DAO.questionDAO;
import com.exam.model.Faculty;
import com.exam.model.Question;

/**
 * Servlet implementation class EditQuestionServlet
 */
@WebServlet("/EditQuestionServlet")
public class EditQuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditQuestionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int qid=Integer.parseInt(request.getParameter("qid"));
		
		String question=request.getParameter("question");
		String opt1=request.getParameter("opt1");
		String opt2=request.getParameter("opt2");
		String opt3=request.getParameter("opt3");
		String opt4=request.getParameter("opt4");
		String correct=request.getParameter("correct");
//		
//		ServletContext sc = request.getServletContext();
//		
//		Faculty f = (Faculty) sc.getAttribute("faculty-obj");
//		int facId = f.getFacId();
		
//		int cid=0;
//		courseDAO cd=new courseDAO();
//		ResultSet rs=cd.getAllData();
//		try {
//			while(rs.next()) {
//				if(rs.getString(2).contentEquals(cName)) {
//					cid=rs.getInt(1);
//					System.out.println(cid);
//				}
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
		if(correct.contentEquals("Option 1")) {
			correct=opt1;
		}else if(correct.contentEquals("Option 2")) {
			correct=opt2;
		}else if(correct.contentEquals("Option 3")) {
			correct=opt3;
		}else if(correct.contentEquals("Option 4")) {
			correct=opt4;
		}
		
		questionDAO qd=new questionDAO();
		boolean b=qd.updateQuestion(qid,question,opt1,opt2,opt3,opt4,correct);
		HttpSession session = request.getSession();
		if(b) {
			session.setAttribute("question-edit-success", true);
			response.sendRedirect("DisplayQuestion.jsp");
		}
		else {
			session.setAttribute("question-edit-fail", false);
			response.sendRedirect("DisplayQuestion.jsp");
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
