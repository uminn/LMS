package com.human.finalpjt.dto;

public class searchdto {
	private String p_id;
	private String c_name;
	private String c_id;
	private String con_sum;
	private String t_room;

	searchdto(){}

	public searchdto(String p_id, String c_name, String c_id, String con_sum, String t_room) {
		this.p_id = p_id;
		this.c_name = c_name;
		this.c_id = c_id;
		this.con_sum = con_sum;
		this.t_room = t_room;
	}

	public String getP_id() {
		return p_id;
	}

	public void setP_id(String p_id) {
		this.p_id = p_id;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}

	public String getC_id() {
		return c_id;
	}

	public void setC_id(String c_id) {
		this.c_id = c_id;
	}

	public String getCon_sum() {
		return con_sum;
	}

	public void setCon_sum(String con_sum) {
		this.con_sum = con_sum;
	}

	public String getT_room() {
		return t_room;
	}

	public void setT_room(String t_room) {
		this.t_room = t_room;
	}

	
	
}