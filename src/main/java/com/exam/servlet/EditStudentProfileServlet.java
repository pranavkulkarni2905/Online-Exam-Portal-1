package com.exam.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.exam.DAO.studentDAO;

/**
 * Servlet implementation class EditStudentProfileServlet
 */
@WebServlet("/EditStudentProfileServlet")
public class EditStudentProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditStudentProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			int studId = Integer.parseInt(request.getParameter("sid"));
				String email=request.getParameter("email");
				String mob=request.getParameter("mob");
				String dob=request.getParameter("dob");
				String city=request.getParameter("city");
				String state=request.getParameter("state");
				
				
					studentDAO sd=new studentDAO();
					boolean b=sd.updateProfile(email,mob,dob,city,state,studId);
					if(b) {
						HttpSession session=request.getSession();
						session.setAttribute("profile-update-success", "Your Profile Updated Successfully..");
						//System.out.println("test1");
						response.sendRedirect("StudentProfile.jsp");
						//System.out.println("test2");
					}
					else {
						HttpSession session=request.getSession();
						session.setAttribute("profile-update-fail", "Something Went Wrong On Server.");
						response.sendRedirect("StudentProfile.jsp");
					}
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
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
