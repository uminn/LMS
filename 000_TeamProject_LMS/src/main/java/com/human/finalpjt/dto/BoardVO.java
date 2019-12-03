package com.human.finalpjt.dto;
import java.sql.Timestamp;

public class BoardVO {
	private int num;
	private String name;
	private String title;
	private String content;
	private int readcount;
	private Timestamp writedate;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public Timestamp getWritedate() {
		return writedate;
	}
	public void setWritedate(Timestamp writedate) {
		this.writedate = writedate;
	}
	
	private String c_id;
	private int c_id_no;
	private String c_name;
	private int c_unit;
	private int c_grade;
	private String c_major;
	
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
	public int getC_grade() {
		return c_grade;
	}
	public void setC_grade(int c_grade) {
		this.c_grade = c_grade;
	}
	public String getC_major() {
		return c_major;
	}
	public void setC_major(String c_major) {
		this.c_major = c_major;
	}
	
	private int squence;

	public int getSquence() {
		return squence;
	}
	public void setSquence(int squence) {
		this.squence = squence;
	}

}
