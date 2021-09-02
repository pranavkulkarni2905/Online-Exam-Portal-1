package com.exam.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.exam.model.Request;

public class RequestDAO {
	Connection con = null;
	PreparedStatement ps = null;
	public boolean addRequest(String e_code,int stud_id, int facId, int reqId,String studName,String cName,String eName,String date)
	{
		boolean b = false;
		String status="Enroll";
		String Exam_completed="No";
		con = DBconnection.getConnection();
		try {
			ps = con.prepareStatement("insert into exam_requests values(?,?,?,?,?,?,?,?,?,?,?)");
			ps.setInt(1, reqId);
			ps.setString(2, e_code);
			ps.setInt(3, stud_id);
			ps.setInt(4, facId);
			ps.setInt(5, 0);
			ps.setString(6, studName);
			ps.setString(7, cName);
			ps.setString(8, status);
			ps.setString(9, eName);
			ps.setString(10, date);
			ps.setString(11, Exam_completed);
			int i = ps.executeUpdate();
			if(i>0)
				b = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return b;
	}
	public ResultSet getAllData() {
		con=DBconnection.getConnection();
		ResultSet rs=null;
		try {
			ps=con.prepareStatement("select * from exam_requests");
			rs=ps.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	public ResultSet getDataByStatusFilter(String str, int id) {
		con=DBconnection.getConnection();
		ResultSet rs=null;
		try {
			ps=con.prepareStatement("select * from exam_requests where status=? and facid=?");
			ps.setString(1, str);
			ps.setInt(2, id);
			rs=ps.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	public ResultSet getDataByStatusFilter2(String str, int id) {
		con=DBconnection.getConnection();
		ResultSet rs=null;
		try {
			ps=con.prepareStatement("select distinct studid,cname  from exam_requests where status=? and facid=?");
			ps.setString(1, str);
			ps.setInt(2, id);
			rs=ps.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	public ResultSet getDataByStudId(String str, int id) {
		con=DBconnection.getConnection();
		ResultSet rs=null;
		try {
			ps=con.prepareStatement("select * from exam_requests where status=? and studid=?");
			ps.setString(1, str);
			ps.setInt(2, id);
			rs=ps.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	public ResultSet getDataOfCompletedExamByStudId(String str, int id,String complete) {
		con=DBconnection.getConnection();
		ResultSet rs=null;
		try {
			ps=con.prepareStatement("select * from exam_requests where status=? and studid=? and exam_completed=?");
			ps.setString(1, str);
			ps.setInt(2, id);
			ps.setString(3, complete);
			rs=ps.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	public ResultSet getDataByStudId2(String str, int id) {
		con=DBconnection.getConnection();
		String complete="No";
		ResultSet rs=null;
		try {
			ps=con.prepareStatement("select * from exam_requests where status=? and studid=? and flag=0 and exam_completed=?");
			ps.setString(1, str);
			ps.setInt(2, id);
			ps.setString(3, complete);
			rs=ps.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	public ResultSet getDataByFlag(int flag, int id,String str) {
		con=DBconnection.getConnection();
		ResultSet rs=null;
		try {
			ps=con.prepareStatement("select * from exam_requests where flag=? and studid=? and exam_completed=?");
			ps.setInt(1, flag);
			ps.setInt(2, id);
			ps.setString(3, str);
			rs=ps.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	public Request getDataByReqId(int id) {
		con=DBconnection.getConnection();
		ResultSet rs=null;
		Request r =null;
		try {
			ps=con.prepareStatement("select * from exam_requests where req_id=?");
			ps.setInt(1, id);
			rs=ps.executeQuery();
			if(rs.next()) {
				r=new Request();
				r.setReqId(rs.getInt(1));
				r.setExamCode(rs.getString(2));
				r.setStudId(rs.getInt(3));
				r.setFacId(rs.getInt(4));
				r.setStudName(rs.getString(6));
				r.setCourseName(rs.getString(7));
				r.setStatus(rs.getString(8));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return r;
	}
	public boolean updateStatus(String string,int id) {
		boolean b=false;
		con=DBconnection.getConnection();
		try {
			ps=con.prepareStatement("update exam_requests set status=? where req_id=?");
			ps.setString(1, string);
			ps.setInt(2, id);
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
	public boolean updateExamCompletedStatus(String string,int sid,String examCode) {
		boolean b=false;
		con=DBconnection.getConnection();
		try {
			ps=con.prepareStatement("update exam_requests set exam_completed=? where studid=? and e_code=?");
			ps.setString(1, string);
			ps.setInt(2, sid);
			ps.setString(3, examCode);
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
	public boolean updateFlag(int flag,int id) {
		boolean b=false;
		con=DBconnection.getConnection();
		try {
			ps=con.prepareStatement("update exam_requests set flag=? where req_id=?");
			ps.setInt(1, flag);
			ps.setInt(2, id);
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
	public int requestCounter(String str, int id) {
		con=DBconnection.getConnection();
		ResultSet rs=null;
		int count=0;
		try {
			ps=con.prepareStatement("select count(*) from exam_requests where status=? and studid=?");
			ps.setString(1, str);
			ps.setInt(2, id);
			rs=ps.executeQuery();
			if(rs.next())
				count=rs.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
	public int notificationCounter(String str, int id) {
		con=DBconnection.getConnection();
		ResultSet rs=null;
		int count=0;
		try {
			ps=con.prepareStatement("select count(*) from exam_requests where status=? and facid=?");
			ps.setString(1, str);
			ps.setInt(2, id);
			rs=ps.executeQuery();
			if(rs.next())
				count=rs.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
	public int examCompletedCounter(String str, int id) {
		con=DBconnection.getConnection();
		ResultSet rs=null;
		int count=0;
		try {
			ps=con.prepareStatement("select count(*) from exam_requests where exam_completed=? and studid=?");
			ps.setString(1, str);
			ps.setInt(2, id);
			rs=ps.executeQuery();
			if(rs.next())
				count=rs.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}

}
