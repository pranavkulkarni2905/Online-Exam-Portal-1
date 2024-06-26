package com.exam.servlet;

import java.io.IOException;

import java.io.PrintWriter;
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
import com.exam.DAO.StartExamDAO;
import com.exam.DAO.examDAO;
import com.exam.DAO.questionDAO;
import com.exam.DAO.resultDAO;
import com.exam.model.Question;
import com.exam.model.Student;

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

			System.out.println("h1");
			// int jsSize=Integer.parseInt(request.getParameter("js-value"));
			// System.out.println("JS size value:"+jsSize);
			HttpSession session = request.getSession();
			ServletContext sc = request.getServletContext();
			Student stud = (Student) sc.getAttribute("student-obj");
			String exam_code = (String) sc.getAttribute("exam-code");

			StartExamDAO exd = new StartExamDAO();
			questionDAO qd = new questionDAO();
			int i = Integer.parseInt(request.getParameter("curr"));
			String ans = request.getParameter("ans");
			int size = qd.getLength(stud.getStudId(), exam_code);

			System.out.println(size);
			Question q = (Question) sc.getAttribute("question");
			System.out.println("h2");
			// int timer=Integer.parseInt(request.getParameter("myField")) ;
			// System.out.println("Timer:"+timer);
			// int que_id = q.getqId();
			// boolean b = exd.check_que(que_id);
			/*
			 * if(b) { //message
			 * session.setAttribute("answered","You have already attempted this question");
			 * response.sendRedirect("StartExam.jsp"); }
			 */

			System.out.println("h3");
			ResultSet rs = exd.getCounter(stud.getStudId(), exam_code);
			int attempted = 0;
			int corrected = 0;
			int incorrected = 0;
			if (rs.next()) {
				attempted = rs.getInt(1);
				corrected = rs.getInt(2);
				// int non_attempted = rs.getInt(4);
				incorrected = rs.getInt(3);
				System.out.println("corr" + q.getCorrect());
				if (ans == null) {

					System.out.println("i : " + i);
					int curr = i + 1;
					System.out.println(curr);// 2
					exd.update_currque(curr, stud.getStudId(), exam_code);
					response.sendRedirect("StartExam.jsp");

				} else {
					if (ans.equals(q.getCorrect())) {
						++attempted;
						++corrected;
						exd.updateCounter(attempted, corrected, incorrected, stud.getStudId(), exam_code);
						// exd.add_que(que_id);
						System.out.println("Correct : " + corrected);
					} else {
						// exd.add_que(que_id);
						++attempted;
						++incorrected;
						exd.updateCounter(attempted, corrected, incorrected, stud.getStudId(), exam_code);
					}
					exd.add_que(i, stud.getStudId(), exam_code);
				}
			}
			System.out.println("h4");

//			if(jsSize==size) {
//				i=size-1;
////			}
			if (i < size - 1)// 0<=2---1<=2---2<2
			{
				System.out.println("i : " + i);
				int curr = i + 1;
				System.out.println(curr);// 2
				exd.update_currque(curr, stud.getStudId(), exam_code);
				response.sendRedirect("StartExam.jsp");
			} else {
				// System.out.println("Timer in else : "+timer);
				int resultId = 0;
				ArrayList<Integer> list = new ArrayList<Integer>();
				for (int i1 = 1; i1 < 500000; i1++) {
					list.add(new Integer(i1));
				}
				Collections.shuffle(list);
				for (int i1 = 1; i1 <= 8000; i1++) {
					resultId = list.get(i1);
				}

				int sid = stud.getStudId();
				String sName = stud.getfName() + " " + stud.getlName();
				System.out.println(sid + sName);

				examDAO ed = new examDAO();
				System.out.println(exam_code);

				String cName = (String) sc.getAttribute("course-name");
				String date = (String) sc.getAttribute("exam-date");
				System.out.println(cName);
				int total_marks = size * 2;
				int obtained_marks = corrected * 2;
				int non_attempt = size - attempted;
				double per = (obtained_marks * 100) / total_marks;
				System.out.println(total_marks + " " + per);
				String result = null;
				if (per >= 40) {
					result = "Pass";
				} else {
					result = "Fail";
				}
				resultDAO rd = new resultDAO();
				rd.insertResult(resultId, sid, sName, exam_code, cName, total_marks, obtained_marks, size, attempted,
						non_attempt, corrected, incorrected, per, result, date);
				sc.setAttribute("result-id", resultId);
				RequestDAO rd1 = new RequestDAO();
				rd1.updateExamCompletedStatus("Yes", sid, exam_code);
				exd.truncateAll(stud.getStudId(), exam_code);
				session.removeAttribute("exam-time");
				// int time=Integer.parseInt(request.getParameter("timer"));
				// System.out.println(time);
				// PrintWriter pw=response.getWriter();
				// pw.print("<script>localStorage.clear();</script>");
				response.sendRedirect("ExamSummary.jsp");
			}

		} catch(IllegalStateException e) {
			
		}
		catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			// e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			// e.printStackTrace();
		} catch (SQLException e) {

		} catch (NullPointerException e) {
			// e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
