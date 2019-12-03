package com.human.finalpjt.dto;

import java.sql.Date;

public class StudentDto {
	private String s_id;
	private String s_pwd;
	private String s_name;
	private String s_addr;
	private String s_email;
	private String s_phone;
	private int s_grade;
	private String s_college;
	private String s_major;
	private String s_gender;
	private int s_birth;
	private String s_status;
	private String s_country;
	private int count;
	private String s_filename;
	private String requestperiod;
	private String requestreason;
	private String progress;
	private Date requestdate;
	
	public StudentDto() {}
	public StudentDto(String s_id, String s_pwd, String s_name, String s_addr, String s_email, String s_phone,
			int s_grade, String s_college, String s_major, String s_gender, int s_birth, String s_status,
			String s_country, int count,String s_filename,String requestperiod,String requestreason,String progress,Date requestdate) {
		super();
		this.s_id = s_id;
		this.s_pwd = s_pwd;
		this.s_name = s_name;
		this.s_addr = s_addr;
		this.s_email = s_email;
		this.s_phone = s_phone;
		this.s_grade = s_grade;
		this.s_college = s_college;
		this.s_major = s_major;
		this.s_gender = s_gender;
		this.s_birth = s_birth;
		this.s_status = s_status;
		this.s_country = s_country;
		this.count = count;
		this.s_filename = s_filename;
		this.requestperiod = requestperiod;
		this.requestreason = requestreason;
		this.progress = progress;
		this.requestdate = requestdate;
	}
	
	
	public Date getRequestdate() {
		return requestdate;
	}
	public void setRequestdate(Date requestdate) {
		this.requestdate = requestdate;
	}
	public String getRequestperiod() {
		return requestperiod;
	}
	public void setRequestperiod(String requestperiod) {
		this.requestperiod = requestperiod;
	}
	public String getRequestreason() {
		return requestreason;
	}
	public void setRequestreason(String requestreason) {
		this.requestreason = requestreason;
	}
	public String getProgress() {
		return progress;
	}
	public void setProgress(String progress) {
		this.progress = progress;
	}
	public String getS_id() {
		return s_id;
	}
	public void setS_id(String s_id) {
		this.s_id = s_id;
	}
	public String getS_pwd() {
		return s_pwd;
	}
	public void setS_pwd(String s_pwd) {
		this.s_pwd = s_pwd;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public String getS_addr() {
		return s_addr;
	}
	public void setS_addr(String s_addr) {
		this.s_addr = s_addr;
	}
	public String getS_email() {
		return s_email;
	}
	public void setS_email(String s_email) {
		this.s_email = s_email;
	}
	public String getS_phone() {
		return s_phone;
	}
	public void setS_phone(String s_phone) {
		this.s_phone = s_phone;
	}
	public int getS_grade() {
		return s_grade;
	}
	public void setS_grade(int s_grade) {
		this.s_grade = s_grade;
	}
	public String getS_college() {
		return s_college;
	}
	public void setS_college(String s_college) {
		this.s_college = s_college;
	}
	public String getS_major() {
		return s_major;
	}
	public void setS_major(String s_major) {
		this.s_major = s_major;
	}
	public String getS_gender() {
		return s_gender;
	}
	public void setS_gender(String s_gender) {
		this.s_gender = s_gender;
	}
	public int getS_birth() {
		return s_birth;
	}
	public void setS_birth(int s_birth) {
		this.s_birth = s_birth;
	}
	public String getS_status() {
		return s_status;
	}
	public void setS_status(String s_status) {
		this.s_status = s_status;
	}
	public String getS_country() {
		return s_country;
	}
	public void setS_country(String s_country) {
		this.s_country = s_country;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getS_filename() {
		return s_filename;
	}
	public void setS_filename(String s_filename) {
		this.s_filename = s_filename;
	}
	
	
	
	
}
