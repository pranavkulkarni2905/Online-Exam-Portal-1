package com.exam.model;

public class Course {
           private int courseid;
           private String coursename;  
           private String date;
           private Faculty f;
           public Course() {
        	   
           }
		public Course(int courseid, String coursename, Faculty f) {
			super();
			this.courseid = courseid;
			this.coursename = coursename;
			this.setF(f);
		}
		public int getCourseid() {
			return courseid;
		}
		public void setCourseid(int courseid) {
			this.courseid = courseid;
		}
		public String getCoursename() {
			return coursename;
		}
		public void setCoursename(String coursename) {
			this.coursename = coursename;
		}
		public Faculty getF() {
			return f;
		}
		public void setF(Faculty f) {
			this.f = f;
		}
		public String getDate() {
			return date;
		}
		public void setDate(String date) {
			this.date = date;
		}
           
}
