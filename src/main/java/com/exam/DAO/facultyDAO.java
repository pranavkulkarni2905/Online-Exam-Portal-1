package com.exam.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;

import com.exam.model.Faculty;
import com.exam.model.Student;

public class facultyDAO {
	public boolean registerFaculty(Faculty f)
	{
		boolean b = false;
		int i = 0;
		int flag=0;
		Connection con = DBconnection.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("insert into exam_faculty values(?,?,?,?,?,?,?,?,?,?,?)");
			ps.setInt(1, f.getFacId());
			ps.setString(2, f.getFname());
			ps.setString(3, f.getLname());
			ps.setString(4, f.getEducation());
			ps.setString(5,f.getGender());
			ps.setString(6, String.format(f.getDob()));
			ps.setString(7, f.getPhoto());
			ps.setString(8, f.getEmail());
			ps.setString(9,f.getMobno());
			ps.setString(10,f.getPassword());
			ps.setInt(11, flag);
			i = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(i>0)
			b = true;
		return b;
	}
	public ResultSet getAllFaculty() {
		Connection con = DBconnection.getConnection();
		ResultSet rs=null;
		try {
			PreparedStatement ps =con.prepareStatement("select * from exam_faculty");
			rs=ps.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	public Faculty checkFaculty(String email,String pass) {
		Connection con=DBconnection.getConnection();
		Faculty fac=null;
		String ecryptedPass=Base64.getEncoder().encodeToString(pass.getBytes());
		System.out.println(ecryptedPass);
		try {
			PreparedStatement ps=con.prepareStatement("select * from exam_faculty where email=? and password=?");
			ps.setString(1, email);
			ps.setString(2, ecryptedPass);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				fac=new Faculty();
				fac.setFacId(rs.getInt(1));
				fac.setFname(rs.getString(2));
				fac.setLname(rs.getString(3));
				fac.setEducation(rs.getString(4));
				fac.setGender(rs.getString(5));
				fac.setDob(rs.getString(6));
				fac.setPhoto(rs.getString(7));
				fac.setEmail(rs.getString(8));
				fac.setMobno(rs.getString(9));
				fac.setPassword(rs.getString(10));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return fac;
	}
	public boolean checkFlag(String email) {
		boolean b=false;
		Connection con=DBconnection.getConnection();
		int i=0;
		try {
			PreparedStatement ps=con.prepareStatement("select * from exam_faculty where flag=1 and email=?");
			ps.setString(1, email);
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
	public Faculty getDataById(int id) {
		Connection con=DBconnection.getConnection();
		Faculty fac=null;
		try {
			PreparedStatement ps=con.prepareStatement("select * from exam_faculty where facId=?");
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				fac=new Faculty();
				fac.setFacId(rs.getInt(1));
				fac.setFname(rs.getString(2));
				fac.setLname(rs.getString(3));
				fac.setEducation(rs.getString(4));
				fac.setGender(rs.getString(5));
				fac.setDob(rs.getString(6));
				fac.setPhoto(rs.getString(7));
				fac.setEmail(rs.getString(8));
				fac.setMobno(rs.getString(9));
				fac.setPassword(rs.getString(10));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return fac;
	}
	public boolean updateProfile(String email, String mob, String dob, String edu, int facId) {
		boolean b=false;
		Connection con=DBconnection.getConnection();
		int i=0;
		try {
			PreparedStatement ps=con.prepareStatement("update exam_faculty set email=? , mobno=? , dob=? , education=? where facId=?");
			ps.setString(1, email);
			ps.setString(2, mob);
			ps.setString(3, dob);
			ps.setString(4, edu);
			ps.setInt(5, facId);
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

}