package com.exam.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.exam.model.Question;

public class questionDAO {

	Connection con=null;
	PreparedStatement ps=null;
	
	public boolean addQuestion(Question q,int cid,String cName,int facId) {
		boolean b=false;
		con=DBconnection.getConnection();
		int i=0;
		try {
			ps=con.prepareStatement("insert into exam_question values(?,?,?,?,?,?,?,?,?,?)");
			ps.setInt(1, q.getqId());
			ps.setString(2, q.getqName());
			ps.setString(3, q.getOpt1());
			ps.setString(4, q.getOpt2());
			ps.setString(5, q.getOpt3());
			ps.setString(6, q.getOpt4());
			ps.setString(7, q.getCorrect());
			ps.setInt(8, cid);
			ps.setString(9, cName);
			ps.setInt(10, facId);
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
	public ResultSet getAllData() {
		ResultSet rs=null;
		con=DBconnection.getConnection();
		try {
			ps=con.prepareStatement("select * from exam_question ");
			rs=ps.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	public List<Question> getAllDataById(int id){
		con=DBconnection.getConnection();
		Question q=null;
		List<Question> lst=new ArrayList<Question>();
		try {
			ps=con.prepareStatement("select * from exam_question where facid=?");
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				q=new Question();
				q.setqId(rs.getInt(1));
				q.setqName(rs.getString(2));
				q.setOpt1(rs.getString(3));
				q.setOpt2(rs.getString(4));
				q.setOpt3(rs.getString(5));
				q.setOpt4(rs.getString(6));
				q.setCorrect(rs.getString(7));
				q.setcName(rs.getString(9));
				lst.add(q);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return lst;
	}
	public List<Question> filterData(String result){
		con=DBconnection.getConnection();
		Question q=null;
		List<Question> lst=new ArrayList<Question>();
		try {
			ps=con.prepareStatement("select * from exam_question where question like '%" + result + "%' or answer like '%" + result + "%' or coursename like '%" + result + "%' or ques_id like '%" + result + "%' ");
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				q=new Question();
				q.setqId(rs.getInt(1));
				q.setqName(rs.getString(2));
				q.setOpt1(rs.getString(3));
				q.setOpt2(rs.getString(4));
				q.setOpt3(rs.getString(5));
				q.setOpt4(rs.getString(6));
				q.setCorrect(rs.getString(7));
				q.setcName(rs.getString(9));
				lst.add(q);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return lst;
	}
	public Question getDataByQuesId(int id) {
		Question q=null;
		con=DBconnection.getConnection();
		try {
			ps=con.prepareStatement("select * from exam_question where ques_id=?");
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				q=new Question();
				q.setqId(rs.getInt(1));
				q.setqName(rs.getString(2));
				q.setOpt1(rs.getString(3));
				q.setOpt2(rs.getString(4));
				q.setOpt3(rs.getString(5));
				q.setOpt4(rs.getString(6));
				q.setCorrect(rs.getString(7));
				q.setcName(rs.getString(9));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return q;
	}
	public boolean updateQuestion(int qid, String question, String opt1, String opt2, String opt3, String opt4,
			String correct) {
		boolean b=false;
		con=DBconnection.getConnection();
		try {
			ps=con.prepareStatement("update exam_question set question=?,opt1=?,opt2=?,opt3=?,opt4=?,answer=? where ques_id=?");
			ps.setString(1, question);
			ps.setString(2, opt1);
			ps.setString(3, opt2);
			ps.setString(4, opt3);
			ps.setString(5, opt4);
			ps.setString(6, correct);
			ps.setInt(7, qid);
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
	public boolean deleteQuestion(int id) {
		boolean b=false;
		con=DBconnection.getConnection();
		try {
			ps=con.prepareStatement("delete from exam_question where ques_id=?");
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
	public void setLength(int size,int StudId,String examcode)
	{
		con = DBconnection.getConnection();
		try {
			ps = con.prepareStatement("insert into exam_size values(?,?,?)");
			ps.setInt(1, size);
			ps.setInt(2, StudId);
			ps.setString(3, examcode);
			int i = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public int getLength(int StudId,String examcode)
	{
		int size = 0;
		con=DBconnection.getConnection();
		try {
			ps = con.prepareStatement("select * from exam_size where e_code=? and studId=?");
			ps.setString(1, examcode);
			ps.setInt(2, StudId);
			ResultSet rs = ps.executeQuery();
			
			if(rs.next())
				size = rs.getInt(1);
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return size;
	}
	public Question[] getQueByCid(String exam_code)
	{
		con = DBconnection.getConnection();
		examDAO ed = new examDAO();
		ResultSet rs = null;
		Question que[] = null;
		int course_code = ed.getCourseId(exam_code);
		try {
			ps = con.prepareStatement("select count(*) from exam_question where coursecode = ?");
			ps.setInt(1,course_code);
			rs = ps.executeQuery();
			rs.next();
			int size = rs.getInt(1);
			que = new Question[size]; 
			ps = con.prepareStatement("select * from exam_question where coursecode = ?");
			ps.setInt(1,course_code);
			rs = ps.executeQuery();
			int i = 0;
			while(rs.next())
			{
				//System.out.println("i : "+i);
				que[i] = new Question(rs.getInt(1), rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5), rs.getString(6), rs.getString(7));
				i++;
				System.out.println("Question added...");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return que;
	}
	public int quesCounter(int facId) {
		con=DBconnection.getConnection();
		int count=0;
		try {
			ps=con.prepareStatement("select count(*) from exam_question where facid=?");
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
