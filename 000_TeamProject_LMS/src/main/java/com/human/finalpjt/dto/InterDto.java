package com.human.finalpjt.dto;

public class InterDto {
	private String s_id;
	private String s_name;
	private String s_major;
	private String c_major;
	private String c_id;
	private String c_name;
	private int e_year;
	private int e_semester;
	private String t_day;
	private String t_time;
	private String t_room;
	private String c_score;
	private String c_alpha;
	private double c_rank;
	
	
	InterDto(){}


	public InterDto(String s_id, String s_name, String s_major, String c_major, String c_id, String c_name, int e_year,
			int e_semester, String t_day, String t_time, String t_room, String c_score, String c_alpha,
			double c_rank) {
		this.s_id = s_id;
		this.s_name = s_name;
		this.s_major = s_major;
		this.c_major = c_major;
		this.c_id = c_id;
		this.c_name = c_name;
		this.e_year = e_year;
		this.e_semester = e_semester;
		this.t_day = t_day;
		this.t_time = t_time;
		this.t_room = t_room;
		this.c_score = c_score;
		this.c_alpha = c_alpha;
		this.c_rank = c_rank;
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


	public String getS_major() {
		return s_major;
	}


	public void setS_major(String s_major) {
		this.s_major = s_major;
	}


	public String getC_major() {
		return c_major;
	}


	public void setC_major(String c_major) {
		this.c_major = c_major;
	}


	public String getC_id() {
		return c_id;
	}


	public void setC_id(String c_id) {
		this.c_id = c_id;
	}


	public String getC_name() {
		return c_name;
	}


	public void setC_name(String c_name) {
		this.c_name = c_name;
	}


	public int getE_year() {
		return e_year;
	}


	public void setE_year(int e_year) {
		this.e_year = e_year;
	}


	public int getE_semester() {
		return e_semester;
	}


	public void setE_semester(int e_semester) {
		this.e_semester = e_semester;
	}


	public String getT_day() {
		return t_day;
	}


	public void setT_day(String t_day) {
		this.t_day = t_day;
	}


	public String getT_time() {
		return t_time;
	}


	public void setT_time(String t_time) {
		this.t_time = t_time;
	}


	public String getT_room() {
		return t_room;
	}


	public void setT_room(String t_room) {
		this.t_room = t_room;
	}


	public String getC_score() {
		return c_score;
	}


	public void setC_score(String c_score) {
		this.c_score = c_score;
	}


	public String getC_alpha() {
		return c_alpha;
	}


	public void setC_alpha(String c_alpha) {
		this.c_alpha = c_alpha;
	}


	public double getC_rank() {
		return c_rank;
	}


	public void setC_rank(double c_rank) {
		this.c_rank = c_rank;
	}


}