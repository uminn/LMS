package com.human.finalpjt.dao;

import com.human.finalpjt.dto.EnrollDto;
import com.human.finalpjt.dto.LectureDto;

public interface LectureDao {
	//lecture info view
	public EnrollDto show_lecinfo(String p_id,int t_semester);
		
	public void insert_lecweek(int lec_no, String lec_week1,String lec_week2,String lec_week3,String lec_week4,String lec_week5,
						String lec_week6,String lec_week7,String lec_week8,String lec_week9,String lec_week10,
						String lec_week11,String lec_week12,String lec_week13,String lec_week14,String lec_week15,
						String lec_book);
	
	public void insert_lecgrade(int lec_no,int lec_mid,int lec_final,int lec_homework,int lec_active,int lec_attendance);
	
	public void insert_lecdate(int lec_no,String lec_middate,String lec_middatefrom,String lec_finaldate,String lec_finaldatefrom);
	
	public LectureDto show_leclist(int lec_no);
	
	public int get_lecnum(String p_id, int t_year, int t_semester);
	
	public void modify_lecweek(int lec_no, String lec_week1,String lec_week2,String lec_week3,String lec_week4,String lec_week5,
			String lec_week6,String lec_week7,String lec_week8,String lec_week9,String lec_week10,
			String lec_week11,String lec_week12,String lec_week13,String lec_week14,String lec_week15,
			String lec_book);
	
	public void modify_lecgrade(int lec_no,int lec_mid,int lec_final,int lec_homework,int lec_active,int lec_attendance);
	
	public void modify_lecdate(int lec_no,String lec_middate,String lec_middatefrom,String lec_finaldate,String lec_finaldatefrom);
}
