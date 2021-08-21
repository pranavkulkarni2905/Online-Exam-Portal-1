package com.exam.servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.exam.DAO.StartExamDAO;
import com.exam.DAO.questionDAO;
import com.exam.model.Question;

@WebServlet("/SaveServlet")
public class SaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SaveServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			ServletContext sc = request.getServletContext();
			StartExamDAO exd = new StartExamDAO();
			questionDAO qd = new questionDAO();
			int i = Integer.parseInt(request.getParameter("curr"));
			String ans = request.getParameter("ans");
			int size = qd.getLength();
			System.out.println(size);
			Question q = (Question) sc.getAttribute("question");
			int que_id = q.getqId();
			boolean b = exd.check_que(que_id);
			/*if(b)
			{
				//message
				session.setAttribute("answered","You have already attempted this question");
				response.sendRedirect("StartExam.jsp");
			}*/
			ResultSet rs = exd.getCounter();

			if (rs.next()) {
				int attempted = rs.getInt(1);
				int corrected = rs.getInt(2);
				// int non_attempted = rs.getInt(4);
				int incorrected = rs.getInt(3);
				System.out.println("corr" + q.getCorrect());
				if (!ans.equals(null)) {
					if (ans.equals(q.getCorrect())) {
						++attempted;
						++corrected;
						exd.updateCounter(attempted, corrected, incorrected);
						//exd.add_que(que_id);
						System.out.println("Correct : " + corrected);
					} else {
						//exd.add_que(que_id);
						++attempted;
						++incorrected;
						exd.updateCounter(attempted, corrected, incorrected);
					}

				}
			}
			if (i<size-1)//0<=2---1<=2---2<2
			{
				System.out.println("i : " + i);
				int curr = i + 1;
				System.out.println(curr);//2
				exd.update_currque(curr);
				response.sendRedirect("StartExam.jsp");
			} else {
				exd.truncateAll();
				response.sendRedirect("StudentDashboard.jsp");
			}

		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
		} catch (SQLException e) {

		}catch(NullPointerException e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
