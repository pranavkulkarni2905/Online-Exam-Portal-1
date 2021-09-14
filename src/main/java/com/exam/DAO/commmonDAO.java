package com.exam.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.PseudoColumnUsage;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.exam.model.Student;

public class commmonDAO {

	Connection con=null;
	PreparedStatement ps=null;

	public boolean resetPassword(String password,String email) {
		boolean b=false;
		con=DBconnection.getConnection();
		int i=0;
		try {
			ps=con.prepareStatement("update exam_student set password=? where email=?");
			ps.setString(1, password);
			ps.setString(2, email);
			i = ps.executeUpdate();
			if(i>0) {
				b=true;
			}else {
				ps=con.prepareStatement("update exam_faculty set password=? where email=?");
				ps.setString(1, password);
				ps.setString(2, email);
				i = ps.executeUpdate();
				if(i>0) {
					b=true;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return b;
	}

	public boolean verifyEmailStudent(int studId) {
		boolean b=false;
		con=DBconnection.getConnection();
		int i=0;
		try {
			ps=con.prepareStatement("update exam_student set flag=1 where studId=?");
			ps.setInt(1, studId);
			i = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(i>0) {
			b=true;
		}
		return b;
	}

	public boolean verifyEmailFaculty(int facId) {
		boolean b=false;
		con=DBconnection.getConnection();
		int i=0;
		try {
			ps=con.prepareStatement("update exam_faculty set flag=1 where facId=?");
			ps.setInt(1, facId);
			i = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(i>0) {
			b=true;
		}
		return b;
	}
	public boolean changePassword(String password,String email,String oldpassword) 
	{
		boolean b=false;
		con=DBconnection.getConnection();
		int i=0;
		try {
			ps=con.prepareStatement("update exam_student set password=? where password=? and email=?");
			ps.setString(1,password);
			ps.setString(3,email);
			ps.setString(2,oldpassword);
			i = ps.executeUpdate();
			if(i>0) {
				b=true;
			}else 
			{
				ps=con.prepareStatement("update exam_faculty set password=? where password=? and email=?");
				ps.setString(1,password);
				ps.setString(3,email);
				ps.setString(2,oldpassword);
				i = ps.executeUpdate();
				if(i>0) {
					b=true;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return b;
	}
	

}
