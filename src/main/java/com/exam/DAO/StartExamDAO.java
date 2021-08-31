package com.exam.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class StartExamDAO {
	Connection con = null;
	PreparedStatement ps = null;
	public int getCurr_que()
	{
		int i = 0;
		con = DBconnection.getConnection();
		try {
			ps = con.prepareStatement("select * from exam_currentq");
			ResultSet rs = ps.executeQuery();
			if(rs.next());
				i = rs.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	public void setValue(int StudId,String examcode)
	{
		con = DBconnection.getConnection();
		try {
			ps = con.prepareStatement("insert into exam_currentq values(?,?,?)");
			ps.setInt(1, 0);
			ps.setInt(2, StudId);
			ps.setString(3, examcode);
			int i = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void update_currque(int curr,int StudId,String examcode)
	{
		con = DBconnection.getConnection();
		try {
			ps = con.prepareStatement("update exam_currentq set curr = ? where e_code=? and studId=?");
			ps.setInt(1, curr);
			ps.setInt(2, StudId);
			ps.setString(3, examcode);
			int i = ps.executeUpdate();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void setValue_counter(int StudId,String examcode)
	{
		con = DBconnection.getConnection();
		try {
			ps = con.prepareStatement("insert into exam_counter values(?,?,?,?,?)");
			ps.setInt(1, 0);
			ps.setInt(2, 0);
			ps.setInt(3, 0);
			ps.setInt(4, StudId);
			ps.setString(5, examcode);
			int i = ps.executeUpdate();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void updateCounter(int attempt, int correct, int incorrect,int StudId,String examcode)
	{
		con = DBconnection.getConnection();
		try {
			ps = con.prepareStatement("update exam_counter set attempt = ? , correct = ?, incorrect = ? where e_code=? and studId=?");
			ps.setInt(1, attempt);
			ps.setInt(2, correct);
			ps.setInt(3, incorrect);
			ps.setInt(4, StudId);
			ps.setString(5, examcode);
			//ps.setInt(4, non_attempt);
			int i = ps.executeUpdate();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public ResultSet getCounter(int StudId,String examcode)
	{
		ResultSet rs = null;
		con = DBconnection.getConnection();
		try {
			ps = con.prepareStatement("select * from exam_counter where e_code=? and studId=?");
			ps.setString(1, examcode);
			ps.setInt(2, StudId);
			rs = ps.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	public void truncateAll(int Studid,String examcode)
	{
		int i = 0;
		con = DBconnection.getConnection();
		try {
			ps = con.prepareStatement("delete from  exam_counter where e_code=? and studId=?");
			ps.setString(1, examcode);
			ps.setInt(2,Studid);
			i = ps.executeUpdate();
			ps = con.prepareStatement("delete from  exam_currentq where e_code=? and studId=?");
			ps.setString(1, examcode);
			ps.setInt(2,Studid);
			i = ps.executeUpdate();
			ps = con.prepareStatement("delete from  exam_size where e_code=? and studId=?");
			ps.setString(1, examcode);
			ps.setInt(2,Studid);
			i = ps.executeUpdate();
			ps = con.prepareStatement("delete from  exam_queid where e_code=? and studId=?");
			ps.setString(1, examcode);
			ps.setInt(2,Studid);
			i = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void add_que(int que_id,int StudId,String examcode)
	{
		con = DBconnection.getConnection();
		try {
			ps = con.prepareStatement("insert into exam_queid values(?,?,?)");
			ps.setInt(1, que_id);
			ps.setInt(2, StudId);
			ps.setString(3, examcode);
			int i = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public boolean check_que(int que_id)
	{
		boolean b = false;
		ResultSet rs = null;
		con = DBconnection.getConnection();
		try {
			ps = con.prepareStatement("select * from exam_queid");
			rs = ps.executeQuery();
			while(rs.next())
			{
				if(que_id==rs.getInt(1))
				{
					b = true;
					break;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return b;
	}
}
