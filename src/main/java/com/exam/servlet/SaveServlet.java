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
			HttpSession session = request.getSession();
			ServletContext sc = request.getServletContext();
			StartExamDAO exd = new StartExamDAO();
			questionDAO qd = new questionDAO();
			int i = Integer.parseInt(request.getParameter("curr"));
			String ans = request.getParameter("ans");
			int size = qd.getLength();
			System.out.println(size);
			Question q = (Question) sc.getAttribute("question");
			//int que_id = q.getqId();
			//boolean b = exd.check_que(que_id);
			/*if(b)
			{
				//message
				session.setAttribute("answered","You have already attempted this question");
				response.sendRedirect("StartExam.jsp");
			}*/
			ResultSet rs = exd.getCounter();
			int attempted=0;
			int corrected=0;
			int incorrected=0;
			if (rs.next()) {
				 attempted = rs.getInt(1);
				 corrected = rs.getInt(2);
				// int non_attempted = rs.getInt(4);
				 incorrected = rs.getInt(3);
				System.out.println("corr" + q.getCorrect());
				if (ans==null) {
					
					System.out.println("i : " + i);
					int curr = i + 1;
					System.out.println(curr);//2
					exd.update_currque(curr);
					response.sendRedirect("StartExam.jsp");

				}
				else {
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
			} 
			else {
				int resultId = 0;
				ArrayList<Integer> list = new ArrayList<Integer>();
				for (int i1 = 1; i1 < 500000; i1++) {
					list.add(new Integer(i1));
				}
				Collections.shuffle(list);
				for (int i1 = 1; i1 <= 8000; i1++) {
					resultId = list.get(i1);
				}
				Student stud=(Student)sc.getAttribute("student-obj");
				int sid=stud.getStudId();
				String sName=stud.getfName()+" "+stud.getlName();
				System.out.println(sid+sName);
				String exam_code=(String)sc.getAttribute("exam-code");
				examDAO ed=new examDAO();
				System.out.println(exam_code);
				
				String cName = (String)sc.getAttribute("course-name");
				String date=(String)sc.getAttribute("exam-date");
				System.out.println(cName);
				int total_marks=size*2;
				int obtained_marks=corrected*2;
				int non_attempt=size-attempted;
				double per=(obtained_marks*100)/total_marks;
				System.out.println(total_marks+" "+per);
				String result=null;
				if(per>=40) {
					result="Pass";
				}else {
					result="Fail";
				}
				resultDAO rd=new resultDAO();
				rd.insertResult(resultId,sid,sName,exam_code,cName,total_marks,obtained_marks,size,attempted,non_attempt,corrected,incorrected,per,result,date);
				sc.setAttribute("result-id", resultId);	
				RequestDAO rd1=new RequestDAO();
				rd1.updateExamCompletedStatus("Yes",sid,exam_code);
				exd.truncateAll();
				session.removeAttribute("exam-time");
				response.sendRedirect("ExamSummary.jsp");
			}

		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
		} catch (SQLException e) {

		}catch(NullPointerException | IllegalStateException e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
