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

import com.exam.DAO.RequestDAO;
import com.exam.DAO.examDAO;
import com.exam.model.Faculty;
import com.exam.model.Student;

/**
 * Servlet implementation class RequestExamServlet
 */
@WebServlet("/RequestExamServlet")
public class RequestExamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RequestExamServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int reqId = 0;
			ArrayList<Integer> list = new ArrayList<Integer>();
			for (int i = 1; i < 50000; i++) {
				list.add(new Integer(i));
			}
			Collections.shuffle(list);
			for (int i = 1; i <= 4000; i++) {
				reqId = list.get(i);
			}

			String exam_code = request.getParameter("e_code");

			String cName = null;
			int facId = 0;
			String examName=null;
			String date=null;
			examDAO ed = new examDAO();
			ResultSet rs = ed.getAllData();
			try {
				while (rs.next()) {
					if (exam_code.equals(rs.getString(1))) {
						cName = rs.getString(5);
						facId = rs.getInt(6);
						examName=rs.getString(2);
						date=rs.getString(3);
					}
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			HttpSession session = request.getSession();
			ServletContext sc = request.getServletContext();
			RequestDAO red = new RequestDAO();

			Student s = (Student) sc.getAttribute("student-obj");

			int studId = s.getStudId();
			String studName = s.getfName() + " " + s.getlName();
			boolean bool = false;
			ResultSet rs1 = red.getAllData();
			try {
				while (rs1.next()) {
					if (rs1.getString(2).equals(exam_code) && rs1.getInt(3) == studId) {
						bool = true;
						session.setAttribute("request-already-sent", true);
						response.sendRedirect("RequestExam.jsp");
					}
				}
			} catch (SQLException e) {
				
				e.printStackTrace();
			}

			if (bool == false) {
				boolean b = red.addRequest(exam_code, studId, facId, reqId, studName, cName,examName,date);

				if (b) {
					session.setAttribute("request-success", true);
					session.setAttribute("req-id", reqId);
					red.updateStatus("Sent", reqId);
					response.sendRedirect("RequestExam.jsp");
				} else {
					session.setAttribute("request-fail", false);
					response.sendRedirect("RequestExam.jsp");
				}
			}
		} catch (IOException | NullPointerException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}