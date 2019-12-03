package com.human.finalpjt.dto;

import java.sql.Date;

public class LectureDto {
	private int lec_no;
	private String lec_week1;
	private String lec_week2;
	private String lec_week3;
	private String lec_week4;
	private String lec_week5;
	private String lec_week6;
	private String lec_week7;
	private String lec_week8;
	private String lec_week9;
	private String lec_week10;
	private String lec_week11;
	private String lec_week12;
	private String lec_week13;
	private String lec_week14;
	private String lec_week15;
	private String lec_book;
	
	private int lec_gradeno;
	private int lec_mid;
	private int lec_final;
	private int lec_homework;
	private int lec_active;
	private int lec_attendance;
	
	private int lec_dateno;
	private Date lec_middate;
	private Date lec_middatefrom;
	private Date lec_finaldate;
	private Date lec_finaldatefrom;
	
	public LectureDto() {}

	public LectureDto(int lec_no, String lec_week1, String lec_week2, String lec_week3, String lec_week4, String lec_week5,
			String lec_week6, String lec_week7, String lec_week8, String lec_week9, String lec_week10, String lec_week11, String lec_week12,
			String lec_week13, String lec_week14, String lec_week15, String lec_book, int lec_gradeno, int lec_mid, int lec_final,
			int lec_homework, int lec_active, int lec_attendance, int lec_dateno, Date lec_middate,
			Date lec_middatefrom, Date lec_finaldate, Date lec_finaldatefrom) {
		super();
		this.lec_no = lec_no;
		this.lec_week1 = lec_week1;
		this.lec_week2 = lec_week2;
		this.lec_week3 = lec_week3;
		this.lec_week4 = lec_week4;
		this.lec_week5 = lec_week5;
		this.lec_week6 = lec_week6;
		this.lec_week7 = lec_week7;
		this.lec_week8 = lec_week8;
		this.lec_week9 = lec_week9;
		this.lec_week10 = lec_week10;
		this.lec_week11 = lec_week11;
		this.lec_week12 = lec_week12;
		this.lec_week13 = lec_week13;
		this.lec_week14 = lec_week14;
		this.lec_week15 = lec_week15;
		this.lec_book = lec_book;
		this.lec_gradeno = lec_gradeno;
		this.lec_mid = lec_mid;
		this.lec_final = lec_final;
		this.lec_homework = lec_homework;
		this.lec_active = lec_active;
		this.lec_attendance = lec_attendance;
		this.lec_dateno = lec_dateno;
		this.lec_middate = lec_middate;
		this.lec_middatefrom = lec_middatefrom;
		this.lec_finaldate = lec_finaldate;
		this.lec_finaldatefrom = lec_finaldatefrom;
	}



	public int getLec_no() {
		return lec_no;
	}

	public void setLec_no(int lec_no) {
		this.lec_no = lec_no;
	}

	public String getLec_week1() {
		return lec_week1;
	}

	public void setLec_week1(String lec_week1) {
		this.lec_week1 = lec_week1;
	}

	public String getLec_week2() {
		return lec_week2;
	}

	public void setLec_week2(String lec_week2) {
		this.lec_week2 = lec_week2;
	}

	public String getLec_week3() {
		return lec_week3;
	}

	public void setLec_week3(String lec_week3) {
		this.lec_week3 = lec_week3;
	}

	public String getLec_week4() {
		return lec_week4;
	}

	public void setLec_week4(String lec_week4) {
		this.lec_week4 = lec_week4;
	}

	public String getLec_week5() {
		return lec_week5;
	}

	public void setLec_week5(String lec_week5) {
		this.lec_week5 = lec_week5;
	}

	public String getLec_week6() {
		return lec_week6;
	}

	public void setLec_week6(String lec_week6) {
		this.lec_week6 = lec_week6;
	}

	public String getLec_week7() {
		return lec_week7;
	}

	public void setLec_week7(String lec_week7) {
		this.lec_week7 = lec_week7;
	}

	public String getLec_week8() {
		return lec_week8;
	}

	public void setLec_week8(String lec_week8) {
		this.lec_week8 = lec_week8;
	}

	public String getLec_week9() {
		return lec_week9;
	}

	public void setLec_week9(String lec_week9) {
		this.lec_week9 = lec_week9;
	}

	public String getLec_week10() {
		return lec_week10;
	}

	public void setLec_week10(String lec_week10) {
		this.lec_week10 = lec_week10;
	}

	public String getLec_week11() {
		return lec_week11;
	}

	public void setLec_week11(String lec_week11) {
		this.lec_week11 = lec_week11;
	}

	public String getLec_week12() {
		return lec_week12;
	}

	public void setLec_week12(String lec_week12) {
		this.lec_week12 = lec_week12;
	}

	public String getLec_week13() {
		return lec_week13;
	}

	public void setLec_week13(String lec_week13) {
		this.lec_week13 = lec_week13;
	}

	public String getLec_week14() {
		return lec_week14;
	}

	public void setLec_week14(String lec_week14) {
		this.lec_week14 = lec_week14;
	}

	public String getLec_week15() {
		return lec_week15;
	}

	public void setLec_week15(String lec_week15) {
		this.lec_week15 = lec_week15;
	}

	public String getLec_book() {
		return lec_book;
	}

	public void setLec_book(String lec_book) {
		this.lec_book = lec_book;
	}

	public int getLec_gradeno() {
		return lec_gradeno;
	}

	public void setLec_gradeno(int lec_gradeno) {
		this.lec_gradeno = lec_gradeno;
	}

	public int getLec_mid() {
		return lec_mid;
	}

	public void setLec_mid(int lec_mid) {
		this.lec_mid = lec_mid;
	}

	public int getLec_final() {
		return lec_final;
	}

	public void setLec_final(int lec_final) {
		this.lec_final = lec_final;
	}

	public int getLec_homework() {
		return lec_homework;
	}

	public void setLec_homework(int lec_homework) {
		this.lec_homework = lec_homework;
	}

	public int getLec_active() {
		return lec_active;
	}

	public void setLec_active(int lec_active) {
		this.lec_active = lec_active;
	}

	public int getLec_attendance() {
		return lec_attendance;
	}

	public void setLec_attendance(int lec_attendance) {
		this.lec_attendance = lec_attendance;
	}

	public int getLec_dateno() {
		return lec_dateno;
	}

	public void setLec_dateno(int lec_dateno) {
		this.lec_dateno = lec_dateno;
	}

	public Date getLec_middate() {
		return lec_middate;
	}

	public void setLec_middate(Date lec_middate) {
		this.lec_middate = lec_middate;
	}

	public Date getLec_middatefrom() {
		return lec_middatefrom;
	}

	public void setLec_middatefrom(Date lec_middatefrom) {
		this.lec_middatefrom = lec_middatefrom;
	}

	public Date getLec_finaldate() {
		return lec_finaldate;
	}

	public void setLec_finaldate(Date lec_finaldate) {
		this.lec_finaldate = lec_finaldate;
	}

	public Date getLec_finaldatefrom() {
		return lec_finaldatefrom;
	}

	public void setLec_finaldatefrom(Date lec_finaldatefrom) {
		this.lec_finaldatefrom = lec_finaldatefrom;
	}
}
