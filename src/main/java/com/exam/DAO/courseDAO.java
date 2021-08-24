package com.exam.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.exam.model.Course;
import com.exam.model.Question;

public class courseDAO {
	Connection con = null;
	PreparedStatement ps = null;
	public boolean Addcourses(Course a,int facId)
	{
		boolean b = false;
		Timestamp date=new Timestamp(new Date().getTime());
		con = DBconnection.getConnection();
		try {
			ps = con.prepareStatement("insert into exam_addcourses values(?,?,?,?)");
			ps.setInt(1,a.getCourseid());
			ps.setString(2,a.getCoursename());
			ps.setTimestamp(3, date);
			ps.setInt(4, facId);
			int i = ps.executeUpdate();
			if(i>0)
				b = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return b;
	}
	public ResultSet getAllData(){
		con=DBconnection.getConnection();
		ResultSet rs=null;
		try {
			ps=con.prepareStatement("select * from exam_addcourses order by add_date ");
			 rs=ps.executeQuery();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
		
	}
	public Course getDataById(int id) {
		Course c=null;
		con=DBconnection.getConnection();
		try {
			ps=con.prepareStatement("select * from exam_addcourses where coursecode=?");
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				c=new Course();
				c.setCourseid(rs.getInt(1));
				c.setCoursename(rs.getString(2));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return c;
	}
	public boolean editCourse(int cid,String cname,int id) {
		boolean b=false;
		con=DBconnection.getConnection();
		try {
			ps=con.prepareStatement("update exam_addcourses set coursecode=? , coursename=? where coursecode=?");
			ps.setInt(1, id);
			ps.setString(2, cname);
			ps.setInt(3, cid);
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
	public boolean deleteCourse(int id) {
		boolean b=false;
		con=DBconnection.getConnection();
		try {
			ps=con.prepareStatement("delete from exam_addcourses where coursecode=?");
			ps.setInt(1, id);
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
	public List<Course> getAllDataById(int id){
		con=DBconnection.getConnection();
		Course q=null;
		List<Course> lst=new ArrayList<Course>();
		try {
			ps=con.prepareStatement("select * from exam_addcourses where facid=?");
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				q=new Course();
				q.setCourseid(rs.getInt(1));
				q.setCoursename(rs.getString(2));
				q.setDate(rs.getString(3));
				
				lst.add(q);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return lst;
	}
	public int courseCounter(int facId) {
		con=DBconnection.getConnection();
		int count=0;
		try {
			ps=con.prepareStatement("select count(*) from exam_addcourses where facid=?");
			ps.setInt(1, facId);
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
