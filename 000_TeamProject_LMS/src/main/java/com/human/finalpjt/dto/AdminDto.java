package com.human.finalpjt.dto;

public class AdminDto {
	private String a_id;
	private String a_pwd;
	private String a_name;
	
	public AdminDto() {}
	public AdminDto(String a_id, String a_pwd, String a_name) {
		super();
		this.a_id = a_id;
		this.a_pwd = a_pwd;
		this.a_name = a_name;
	}
	public String getA_id() {
		return a_id;
	}
	public void setA_id(String a_id) {
		this.a_id = a_id;
	}
	public String getA_pwd() {
		return a_pwd;
	}
	public void setA_pwd(String a_pwd) {
		this.a_pwd = a_pwd;
	}
	public String getA_name() {
		return a_name;
	}
	public void setA_name(String a_name) {
		this.a_name = a_name;
	}
}
