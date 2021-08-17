package com.exam.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.exam.DAO.facultyDAO;
import com.exam.DAO.studentDAO;

/**
 * Servlet implementation class EditFacultyProfileServlet
 */
@WebServlet("/EditFacultyProfileServlet")
public class EditFacultyProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditFacultyProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {
			int facId = Integer.parseInt(request.getParameter("fid"));
				String email=request.getParameter("email");
				String mob=request.getParameter("mob");
				String dob=request.getParameter("dob");
				String education=request.getParameter("education");
				
				
				
					facultyDAO fd=new facultyDAO();
					boolean b=fd.updateProfile(email,mob,dob,education,facId);
					if(b) {
						HttpSession session=request.getSession();
						session.setAttribute("profile-update-success", "Your Profile Updated Successfully..");
						//System.out.println("test1");
						response.sendRedirect("FacultyProfile.jsp");
						//System.out.println("test2");
					}
					else {
						HttpSession session=request.getSession();
						session.setAttribute("profile-update-fail", "Something Went Wrong On Server.");
						response.sendRedirect("FacultyProfile.jsp");
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
