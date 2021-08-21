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
	public void setValue()
	{
		con = DBconnection.getConnection();
		try {
			ps = con.prepareStatement("insert into exam_currentq values(?)");
			ps.setInt(1, 0);
			int i = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void update_currque(int curr)
	{
		con = DBconnection.getConnection();
		try {
			ps = con.prepareStatement("update exam_currentq set curr = ?");
			ps.setInt(1, curr);
			int i = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void setValue_counter()
	{
		con = DBconnection.getConnection();
		try {
			ps = con.prepareStatement("insert into exam_counter values(?,?,?)");
			ps.setInt(1, 0);
			ps.setInt(2, 0);
			ps.setInt(3, 0);
			int i = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void updateCounter(int attempt, int correct, int incorrect)
	{
		con = DBconnection.getConnection();
		try {
			ps = con.prepareStatement("update exam_counter set attempt = ? , correct = ?, incorrect = ?");
			ps.setInt(1, attempt);
			ps.setInt(2, correct);
			ps.setInt(3, incorrect);
			//ps.setInt(4, non_attempt);
			int i = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public ResultSet getCounter()
	{
		ResultSet rs = null;
		con = DBconnection.getConnection();
		try {
			ps = con.prepareStatement("select * from exam_counter");
			rs = ps.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	public void truncateAll()
	{
		int i = 0;
		con = DBconnection.getConnection();
		try {
			ps = con.prepareStatement("truncate table exam_counter");
			i = ps.executeUpdate();
			ps = con.prepareStatement("truncate table exam_currentq");
			i = ps.executeUpdate();
			ps = con.prepareStatement("truncate table exam_size");
			i = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void add_que(int que_id)
	{
		con = DBconnection.getConnection();
		try {
			ps = con.prepareStatement("insert into exam_queid values(?)");
			ps.setInt(1, que_id);
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
