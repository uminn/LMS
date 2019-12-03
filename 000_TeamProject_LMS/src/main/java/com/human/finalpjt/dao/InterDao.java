package com.human.finalpjt.dao;

import java.util.ArrayList;

import com.human.finalpjt.dto.InterDto;
import com.human.finalpjt.dto.scheduleDto;
import com.human.finalpjt.dto.scoreSelDto;
import com.human.finalpjt.dto.searchdto;
import com.human.finalpjt.dto.sumDto;

public interface InterDao {
	public ArrayList<InterDto> Interlist();
	
	public ArrayList<InterDto> viewDao(String p_id, int e_year, int e_semester);
	
	public searchdto searchDao(String p_id);
	
	public void InsertDao(String s_id, String s_name, String c_name, String s_major);
	
	public ArrayList<scheduleDto> schlist();
	
	public ArrayList<scheduleDto> schlistAfterToday();
	   
	public void schInsert(String sch_fromdate, String sch_todate, String sch_content);
	
	public void schUpdate(int sch_no,String sch_fromdate, String sch_todate, String sch_content);
	
	public int count();
	
	public ArrayList<sumDto> sumDao(int e_year, int e_semester);
	
	public void UpdateDao(String c_score, String c_alpha, double c_rank, String s_id, String c_id );

	public ArrayList<scoreSelDto> scoreSelDao(String s_id, int e_year, int e_semester);

	
	
	

//bro.hj's method--------------------------------------------------------------
//	public ArrayList<InterDto2> viewDao2(String p_id);
//
//	public searchdto2 searchDao2(String p_id, int t_year, int t_semester);
//
//	public void InsertDao2(int n_year, String s_id, String s_name, String c_name, String s_major, String s_sum,
//			String alpha, String t_semester, String st_c_major, double st_rank);
//
//	public void UpdateDao2(String ssum, String alpha, String s_id);
//
//	public ArrayList<SelectDto> viewselDao2(String s_id);
//
//	public ArrayList<scoreSelDto2> scoreSelDao2(String s_id);
	
	
}
