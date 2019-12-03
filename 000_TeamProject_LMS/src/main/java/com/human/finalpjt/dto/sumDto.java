package com.human.finalpjt.dto;

public class sumDto {
	private int e_year;
	private int e_semester;
	private String c_name;
	private double sumhap;
	sumDto() {
	}
	public sumDto(int e_year, int e_semester, String c_name, double sumhap) {
		this.e_year = e_year;
		this.e_semester = e_semester;
		this.c_name = c_name;
		this.sumhap = sumhap;
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
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public double getSumhap() {
		return sumhap;
	}
	public void setSumhap(double sumhap) {
		this.sumhap = sumhap;
	}
	
	
}