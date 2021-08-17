package com.exam.model;

import java.awt.Image;
import java.util.Date;

import javax.servlet.http.Part;


public class Student {
	
	private int studId;
	private String fName;
	private String lName;
	private String city;
	private String state;
	private String gender;
	private String dob;
	private String photo;
	private String email;
	private String mobNo;
	private String password;
	public Student() {
		
	}
	public Student(int studId, String fName, String lName, String city, String state, String gender, String dob,
			String photo,String email, String mobNo, String password) {
		super();
		this.studId = studId;
		this.fName = fName;
		this.lName = lName;
		this.city = city;
		this.state = state;
		this.gender = gender;
		this.dob = dob;
		this.photo=photo;
		this.email = email;
		this.mobNo = mobNo;
		this.password = password;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public int getStudId() {
		return studId;
	}
	public void setStudId(int studId) {
		this.studId = studId;
	}
	public String getfName() {
		return fName;
	}
	public void setfName(String fName) {
		this.fName = fName;
	}
	public String getlName() {
		return lName;
	}
	public void setlName(String lName) {
		this.lName = lName;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMobNo() {
		return mobNo;
	}
	public void setMobNo(String mobNo) {
		this.mobNo = mobNo;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
}
