package com.exam.servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Collections;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.exam.DAO.facultyDAO;
import com.exam.DAO.studentDAO;
import com.exam.model.Faculty;
import com.exam.model.Student;
import com.exam.verify.ExistMail;
import com.exam.verify.sendHtmlMail;

/**
 * Servlet implementation class RegisterFacultyServlet
 */
@WebServlet("/RegisterFacultyServlet")
public class RegisterFacultyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public boolean isValid(String mobNo) {

		// The given argument to compile() method
		// is regular expression. With the help of
		// regular expression we can validate mobile
		// number.
		// 1) Begins with 0 or 91
		// 2) Then contains 7 or 8 or 9.
		// 3) Then contains 9 digits
		Pattern p = Pattern.compile("(0/91)?[7-9][0-9]{9}");

		// Pattern class contains matcher() method
		// to find matching between given number
		// and regular expression
		Matcher m = p.matcher(mobNo);
		return (m.find() && m.group().equals(mobNo));
	}

	public RegisterFacultyServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int facId = 0;
		ArrayList<Integer> list = new ArrayList<Integer>();
		for (int i = 1; i < 500000; i++) {
			list.add(new Integer(i));
		}
		Collections.shuffle(list);
		for (int i = 1; i <= 7000; i++) {
			facId = list.get(i);
		}

		try {
			String fname = request.getParameter("fname");
			String lname = request.getParameter("lname");
			String education = request.getParameter("educ");
			String gender = request.getParameter("gen");
			String dob = request.getParameter("dob");
			String photo = request.getParameter("photo");
			String mobno = request.getParameter("mobno");
			String email = request.getParameter("email");
			String password = request.getParameter("pass");
			String cnf_pass = request.getParameter("cnf_pass");

			HttpSession session = null;
			ExistMail em = new ExistMail();
			facultyDAO fd = new facultyDAO();
			ResultSet rs = fd.getAllFaculty();
			int flag = 0;
			boolean h = true;
			RequestDispatcher rd = request.getRequestDispatcher("Register_faculty.jsp");
			try {
				while (rs.next()) {
					if ((rs.getString(8).contentEquals(email)) || (rs.getString(9).contentEquals(mobno))) {
						session = request.getSession();
						h = false;
						session.setAttribute("fac-email-fail",
								"This Email or mobile no is already Registered.Please Enter valid email/mobile no");
						response.sendRedirect("Register_faculty.jsp");
					}
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			boolean f = em.isAddressValid(email);
			if (h) {
				if (password.contentEquals(cnf_pass)) {
					if (f == true) {
						if (isValid(mobno)) {
							String ecryptedPass = Base64.getEncoder().encodeToString(password.getBytes());
							Faculty fac = new Faculty(facId, fname, lname, education, gender, dob, photo, mobno, email,
									ecryptedPass);
							boolean b = fd.registerFaculty(fac);
							if (b) {
								session = request.getSession();
								String id = String.valueOf(facId);
								session.setAttribute("facId", id);
								sendHtmlMail sm = new sendHtmlMail();
								String sub = "[ThinkExam] Verify Your Email";
								String msg = "<div class=\"card\" style =\"width:100%; height:100%; margin-top: 50px;margin-left:10px; background-color: black;\">\r\n"
										+ "    <header class=\"header\" style=\"background-color: black;\">\r\n"
										+ "   <img src=\"https://mdbootstrap.com/img/Mockups/Lightbox/Thumbnail/img%20(67).jpg\" height=\"200px\" width=\"50%\" style=\"margin-top: 15px; margin-left: 25%; color: black;align:center;\">\r\n"
										+ "   </header>\r\n" + "     \r\n"
										+ "      <div class=\"cotainer\" style=\"height: 620px;background-color:black;color:white;\">\r\n"
										+ "      <p style=\"margin-left: 25%;\"><br>Hello Faculty, <br> Thank You For Using ThinkExam Portal<br><br>Before we get started please verify your email address.Please click on the link below to verify your email.</p>\r\n"
										+ "\r\n"
										+ "     <p style=\"margin-left: 25%;\"><a href=\"http://localhost:8283/Online_Exam_Portal1/VerifyEmail.jsp\"><button type=\"button\" class=\"button\" style=\"text-align: center; width:270px; height:50px;border: none;outline: 0;display: inline-block;padding: 5px;color:white;background-color:green;text-align: center;cursor: pointer;width: 35%;\">Click Here to Verify Your Email</button></a></p><br>\r\n"
										+ "         <p style=\"margin-left: 25%;\"> OR <br>copy and paste the following link in yourbrowser:<br><br><a href=\"#\">https://xxxxxxxxxxxxxxxxxxxxxxx</a><br><br></p>\r\n"
										+ "         <p style=\"margin-left: 25%;\"> If you have any concerns ,please contact us at<br><br>\r\n"
										+ "          thinkexamportal@gmail.co<br><br></p><p style=\"margin-left: 25%;\">Thank you for Regestered on ThinkExam Portal.Please Verify your email.<br>If you beleive you've received this messsage in error,<br>we apologize-feel free to ignore it.<br><br>\r\n"
										+ "\r\n" + "          Thanks,<br>\r\n"
										+ "          Team ThinkExam Portal</p>\r\n" + "      </p>\r\n"
										+ "      </div>\r\n" + "    </div>";

								sm.sendMail(email, sub, msg);
								// System.out.println("inserted");
								session = request.getSession();
								session.setAttribute("fac-reg-success",
										"Registered Successfully..We Have Sent an Email On " + email
												+ " .Plese Verify before Login.");
								response.sendRedirect("Register_faculty.jsp");
							} else {
								// System.out.println("not insert");
								session = request.getSession();
								session.setAttribute("fac-reg-fail", "Something went wrong on server.");
								response.sendRedirect("Register_faculty.jsp");
							}
						} else {
							session = request.getSession();
							session.setAttribute("fac-mob-inValid", "Invalid Mobile No..Please Enter Valid..!");
							response.sendRedirect("Register_faculty.jsp");
						}
					} else {
						session = request.getSession();
						session.setAttribute("fac-email-inValid", "Invalid Email Id..Please Enter Valid..!");
						response.sendRedirect("Register_faculty.jsp");
					}
				} else {
					session = request.getSession();
					session.setAttribute("password-notMatch", "Password Does Not Match...!!");
					response.sendRedirect("Register_faculty.jsp");
				}
			}
		} catch (Exception e) {
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
