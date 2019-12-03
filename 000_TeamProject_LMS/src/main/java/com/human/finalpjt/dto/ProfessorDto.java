package com.human.finalpjt.dto;

public class ProfessorDto {
	private String p_id;
	private String p_pwd;
	private String p_name;
	private String p_college;
	private String p_major;
	private String p_room;
	private String p_email;
	private int count;
	
	public ProfessorDto() {}
	
	public ProfessorDto(String p_id, String p_pwd, String p_name, String p_college, String p_major, String p_room,
			String p_email, int count) {
		super();
		this.p_id = p_id;
		this.p_pwd = p_pwd;
		this.p_name = p_name;
		this.p_college = p_college;
		this.p_major = p_major;
		this.p_room = p_room;
		this.p_email = p_email;
		this.count = count;
	}
	public String getP_id() {
		return p_id;
	}
	public void setP_id(String p_id) {
		this.p_id = p_id;
	}
	public String getP_pwd() {
		return p_pwd;
	}
	public void setP_pwd(String p_pwd) {
		this.p_pwd = p_pwd;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_college() {
		return p_college;
	}
	public void setP_college(String p_college) {
		this.p_college = p_college;
	}
	public String getP_major() {
		return p_major;
	}
	public void setP_major(String p_major) {
		this.p_major = p_major;
	}
	public String getP_room() {
		return p_room;
	}
	public void setP_room(String p_room) {
		this.p_room = p_room;
	}
	public String getP_email() {
		return p_email;
	}
	public void setP_email(String p_email) {
		this.p_email = p_email;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
	
	
	
}
