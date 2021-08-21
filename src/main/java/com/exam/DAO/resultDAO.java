package com.exam.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class resultDAO {

	Connection con=null;
	PreparedStatement ps=null;
	
	public boolean insertResult(int resultId, int sid, String sName, String exam_code, String cName, int total_marks,
			int obtained_marks, int size, int attempted, int non_attempt, int corrected, int incorrected, double percentage,
			String result) {
		boolean b = false;
		con=DBconnection.getConnection();
		try {
			ps=con.prepareStatement("insert into exam_result values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			ps.setInt(1,resultId);
			ps.setInt(2,sid);
			ps.setString(3, sName);
			ps.setString(4, exam_code);
			ps.setString(5, cName);
			ps.setInt(6, total_marks);
			ps.setInt(7, obtained_marks);
			ps.setInt(8, size);
			ps.setInt(9, attempted);
			ps.setInt(10, non_attempt);
			ps.setInt(11, corrected);
			ps.setInt(12, incorrected);
			ps.setDouble(13, percentage);
			ps.setString(14, result);
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
}
