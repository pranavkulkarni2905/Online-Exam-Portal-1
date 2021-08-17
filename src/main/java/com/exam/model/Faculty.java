package com.exam.model;

public class Faculty {
	private int facId;
	private String fname;
	private String lname;
	private String education;
	private String gender;
	private String dob;
	private String photo;
	private String mobno;
	private String email;
	private String password;
	public Faculty() {
		
	}
	public Faculty(int facId, String fname, String lname, String education, String gender, String dob, String photo,
			String mobno, String email, String password) {
		super();
		this.facId = facId;
		this.fname = fname;
		this.lname = lname;
		this.education = education;
		this.gender = gender;
		this.dob = dob;
		this.photo = photo;
		this.mobno = mobno;
		this.email = email;
		this.password = password;
	}

	public int getFacId() {
		return facId;
	}
	public void setFacId(int facId) {
		this.facId = facId;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
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
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getMobno() {
		return mobno;
	}
	public void setMobno(String mobno) {
		this.mobno = mobno;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
