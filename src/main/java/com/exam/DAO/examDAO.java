package com.exam.DAO;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;

import com.exam.model.Exam;
import com.exam.model.Faculty;

public class examDAO {
Connection con=null;
PreparedStatement ps=null;
	public boolean addExam(Exam e,int facId,String cName,int cId, String facName,String date) {
		boolean b=false;
		
		con=DBconnection.getConnection();
		try {
			
			ps=con.prepareStatement("insert into exam_setexam values(?,?,?,?,?,?,?,?)");
			ps.setString(1, e.getExamCode());
			ps.setString(2, e.getExamName());
			ps.setString(3, date);
			ps.setString(4, e.getExamTime());
			ps.setString(5, cName);
			ps.setInt(6, facId);
			ps.setInt(7, cId);
			ps.setString(8, facName);
			int i=ps.executeUpdate();
			if(i>0) {
				b=true;
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} 
		return b;
	}
	public ResultSet getAllData() {
		con=DBconnection.getConnection();
		ResultSet rs=null;
		try {
			ps=con.prepareStatement("select * from exam_setexam");
			rs = ps.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	public List<Exam> getAllDataByFacId(int id){
		List<Exam> lst=new ArrayList<Exam>();
		Exam e=null;
		con=DBconnection.getConnection();
		try {
			ps=con.prepareStatement("select * from exam_setexam where facid=?");
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				e=new Exam();
				e.setExamCode(rs.getString(1));
				e.setExamName(rs.getString(2));
				e.setExamDate(rs.getString(3));
				e.setExamTime(rs.getString(4));
				e.setcName(rs.getString(5));
				lst.add(e);
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return lst;
	}
}
