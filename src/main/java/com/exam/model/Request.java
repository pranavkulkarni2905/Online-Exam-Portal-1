package com.exam.model;

public class Request {

	private int reqId;
	private String examCode;
	private int studId;
	private int facId;
	private String studName;
	private String courseName;
	private String status;
	public Request(){
		
	}
	public Request(int reqId, String examCode, int studId, int facId, String studName, String courseName,
			String status) {
		super();
		this.reqId = reqId;
		this.examCode = examCode;
		this.studId = studId;
		this.facId = facId;
		this.studName = studName;
		this.courseName = courseName;
		this.status = status;
	}
	public int getReqId() {
		return reqId;
	}
	public void setReqId(int reqId) {
		this.reqId = reqId;
	}
	public String getExamCode() {
		return examCode;
	}
	public void setExamCode(String examCode) {
		this.examCode = examCode;
	}
	public int getStudId() {
		return studId;
	}
	public void setStudId(int studId) {
		this.studId = studId;
	}
	public int getFacId() {
		return facId;
	}
	public void setFacId(int facId) {
		this.facId = facId;
	}
	public String getStudName() {
		return studName;
	}
	public void setStudName(String studName) {
		this.studName = studName;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
}
