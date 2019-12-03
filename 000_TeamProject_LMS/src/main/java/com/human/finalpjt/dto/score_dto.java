package com.human.finalpjt.dto;

public class score_dto {
	private String s_id;
	private String s_name;
	private String c_name;
	
	public score_dto() {
		
	}
	public score_dto(String s_id, String s_name, String c_name) {
		this.s_id = s_id;
		this.s_name = s_name;
		this.c_name = c_name;
	}
	
	public String getS_id() {
		return s_id;
	}
	
	public void setS_id(String s_id) {
		this.s_id = s_id;
	}
	
	public String getS_name() {
		return s_name;
	}
	


	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	
	public String getC_name() {
		return c_name;
	}
	
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	
	@Override
	public String toString() {
		return "score_dto [s_id=" + s_id + ", s_name=" + s_name + ", c_name=" + c_name + "]";
	}

	
	
	
}
