package com.exam.model;


public class Exam {

	private String examCode;
	private String examName;
	private String examDate;
	private String examTime;
	private String cName;
	public Exam() {
		
	}
	public Exam(String examCode, String examName,  String examTime) {
		super();
		this.examCode = examCode;
		this.examName = examName;
		
		this.examTime = examTime;
	}
	public String getExamCode() {
		return examCode;
	}
	public void setExamCode(String examCode) {
		this.examCode = examCode;
	}
	public String getExamName() {
		return examName;
	}
	public void setExamName(String examName) {
		this.examName = examName;
	}
	public String getExamDate() {
		return examDate;
	}
	public void setExamDate(String string) {
		this.examDate = string;
	}
	public String getExamTime() {
		return examTime;
	}
	public void setExamTime(String examTime) {
		this.examTime = examTime;
	}
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	
	
}
