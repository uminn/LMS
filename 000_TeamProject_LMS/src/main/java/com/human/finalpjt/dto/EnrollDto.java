package com.human.finalpjt.dto;

public class EnrollDto {
	private String c_id;
	private int c_id_no;
	private String c_major;
	private String c_name;
	private int c_unit;
	private String p_name;
	private int c_grade;
	private int t_max;
	private String t_day;
	private String t_time;
	private String t_room;
	private int t_year;
	private int t_semester;
	private String c_score;
	private String c_alpha;
	private double c_rank;
	private int t_lec_no;
	private int sNum;
	private Double e_avg_eval; 
	private String p_id;
	
	
	public EnrollDto() {}
	public EnrollDto(String c_id, int c_id_no, String c_major, String c_name, int c_unit, String p_name, int c_grade,
			int t_max, String t_day, String t_time, String t_room, int t_year, int t_semester, String c_score,
			String c_alpha, double c_rank, int t_lec_no, int sNum, Double e_avg_eval,String p_id) {
		super();
		this.c_id = c_id;
		this.c_id_no = c_id_no;
		this.c_major = c_major;
		this.c_name = c_name;
		this.c_unit = c_unit;
		this.p_name = p_name;
		this.c_grade = c_grade;
		this.t_max = t_max;
		this.t_day = t_day;
		this.t_time = t_time;
		this.t_room = t_room;
		this.t_year = t_year;
		this.t_semester = t_semester;
		this.c_score = c_score;
		this.c_alpha = c_alpha;
		this.c_rank = c_rank;
		this.t_lec_no = t_lec_no;
		this.sNum = sNum;
		this.e_avg_eval = e_avg_eval;
		this.p_id = p_id;
	}
	
	public String getC_id() {
		return c_id;
	}
	public void setC_id(String c_id) {
		this.c_id = c_id;
	}
	public int getC_id_no() {
		return c_id_no;
	}
	public void setC_id_no(int c_id_no) {
		this.c_id_no = c_id_no;
	}
	public String getC_major() {
		return c_major;
	}
	public void setC_major(String c_major) {
		this.c_major = c_major;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public int getC_unit() {
		return c_unit;
	}
	public void setC_unit(int c_unit) {
		this.c_unit = c_unit;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getC_grade() {
		return c_grade;
	}
	public void setC_grade(int c_grade) {
		this.c_grade = c_grade;
	}
	public int getT_max() {
		return t_max;
	}
	public void setT_max(int t_max) {
		this.t_max = t_max;
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
	public int getT_year() {
		return t_year;
	}
	public void setT_year(int t_year) {
		this.t_year = t_year;
	}
	public int getT_semester() {
		return t_semester;
	}
	public void setT_semester(int t_semester) {
		this.t_semester = t_semester;
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
	public int getT_lec_no() {
		return t_lec_no;
	}
	public void setT_lec_no(int t_lec_no) {
		this.t_lec_no = t_lec_no;
	}
	public int getsNum() {
		return sNum;
	}
	public void setsNum(int sNum) {
		this.sNum = sNum;
	}
	public Double getE_avg_eval() {
		return e_avg_eval;
	}
	public void setE_avg_eval(Double e_avg_eval) {
		this.e_avg_eval = e_avg_eval;
	}
	public String getP_id() {
		return p_id;
	}
	public void setP_id(String p_id) {
		this.p_id = p_id;
	}
}
