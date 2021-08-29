package com.exam.DAO;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;

import javax.servlet.http.Part;

import com.exam.model.Student;

public class studentDAO {

	Connection con=null;
	PreparedStatement ps=null;
	public boolean registerStudent(Student stud) {
		con=DBconnection.getConnection();
		int flag=0;
		boolean b=false;
		int i=0;
		try {
			ps=con.prepareStatement("insert into exam_student values(?,?,?,?,?,?,?,?,?,?,?,?)");
			ps.setInt(1, stud.getStudId());
			ps.setString(2, stud.getfName());
			ps.setString(3, stud.getlName());
			ps.setString(4, stud.getCity());
			ps.setString(5, stud.getState());
			ps.setString(6, stud.getGender());
			ps.setString(7, String.format(stud.getDob()));
			//FileInputStream fis = new FileInputStream(image);
			ps.setString(8, stud.getPhoto());
			ps.setString(9, stud.getEmail());
			ps.setString(10, stud.getMobNo());
			ps.setString(11, stud.getPassword());
			ps.setInt(12, flag);
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
	public ResultSet getAllStudents() {
		con=DBconnection.getConnection();
		ResultSet rs=null;
		try {
			ps=con.prepareStatement("select * from exam_student");
			rs=ps.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	public Student checkStudent(String email,String pass) {
		con=DBconnection.getConnection();
		Student stud=null;
	//	String decryptPass=new String(Base64.getMimeDecoder().decode(pass));
		String ecryptedPass=Base64.getEncoder().encodeToString(pass.getBytes());
		System.out.println(ecryptedPass);
		try {
			ps=con.prepareStatement("select * from exam_student where email=? and password=?");
			ps.setString(1, email);
			ps.setString(2, ecryptedPass);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				stud=new Student();
				stud.setStudId(rs.getInt(1));
				stud.setfName(rs.getString(2));
				stud.setlName(rs.getString(3));
				stud.setCity(rs.getString(4));
				stud.setState(rs.getString(5));
				stud.setGender(rs.getString(6));
				stud.setDob(rs.getString(7));
				stud.setPhoto(rs.getString(8));
				stud.setEmail(rs.getString(9));
				stud.setMobNo(rs.getString(10));
				stud.setPassword(rs.getString(11));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return stud;
	}
	public boolean checkFlag(String email) {
		boolean b=false;
		con=DBconnection.getConnection();
		int i=0;
		try {
			ps=con.prepareStatement("select * from exam_student where flag=1 and email=?");
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
	public Student getDataById(int id) {
		con=DBconnection.getConnection();
		Student stud=null;
		try {
			ps=con.prepareStatement("select * from exam_student where studId=?");
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				stud=new Student();
				stud.setStudId(rs.getInt(1));
				stud.setfName(rs.getString(2));
				stud.setlName(rs.getString(3));
				stud.setCity(rs.getString(4));
				stud.setState(rs.getString(5));
				stud.setGender(rs.getString(6));
				stud.setDob(rs.getString(7));
				stud.setPhoto(rs.getString(8));
				stud.setEmail(rs.getString(9));
				stud.setMobNo(rs.getString(10));
				stud.setPassword(rs.getString(11));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return stud;
	}
	public boolean updateProfile(String email, String mob, String dob, String city, String state, int studId) {
		boolean b=false;
		con=DBconnection.getConnection();
		int i=0;
		try {
			ps=con.prepareStatement("update exam_student set email=? , mobno=? , dob=? , city=? , state=? where studId=?");
			ps.setString(1, email);
			ps.setString(2, mob);
			ps.setString(3, dob);
			ps.setString(4, city);
			ps.setString(5, state);
			ps.setInt(6, studId);
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
	public ResultSet getAllData(){
		con=DBconnection.getConnection();
		ResultSet rs=null;
		try {
			ps=con.prepareStatement("select * from exam_student order by studid");
			 rs=ps.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	public boolean deleteStudent(int studid) {
		boolean b=false;
		con=DBconnection.getConnection();
		try {
			ps=con.prepareStatement("delete from exam_student where studid=?");
			ps.setInt(1, studid);
			int i=ps.executeUpdate();
			if(i>0) {
				b=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return b;
	}
	public int studCounter() {
		con=DBconnection.getConnection();
		int count=0;
		try {
			ps=con.prepareStatement("select count(*) from exam_student");
			ResultSet rs=ps.executeQuery();
			if(rs.next())
				count=rs.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
}
