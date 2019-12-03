package com.human.finalpjt.dto;

public class scoreSelDto {
	private int e_year; //년도
	private int e_semester; //학기
	private String c_id; //교과코드
	private String c_name; //교과명
	private String s_major; //개설확과
	private String c_score; //실점
	private String c_alpha; //알파
	private double c_rank; //등급

	scoreSelDto() {
	}

	public scoreSelDto(int e_year, int e_semester, String c_id, String c_name, String s_major, String c_score,
			String c_alpha, double c_rank) {
		this.e_year = e_year;
		this.e_semester = e_semester;
		this.c_id = c_id;
		this.c_name = c_name;
		this.s_major = s_major;
		this.c_score = c_score;
		this.c_alpha = c_alpha;
		this.c_rank = c_rank;
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

	public String getS_major() {
		return s_major;
	}

	public void setS_major(String s_major) {
		this.s_major = s_major;
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