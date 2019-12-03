package com.human.finalpjt.dao;

import java.util.ArrayList;

import com.human.finalpjt.dto.EnrollDto;
import com.human.finalpjt.dto.ProfessorDto;
import com.human.finalpjt.dto.StudentDto;

public interface StudentDao {
//	public void studentInfoInput(int s_num,String s_name,int s_birth,String s_gender,String s_college,String s_major,String s_country,int s_grade,String status,String s_addr);
//	public void writeFile(int s_num,String s_file, String filename);
	
	public void StudentInfoInput(String s_id, String s_pwd, String s_name, String s_addr, String s_email,
	         String s_phone, int s_grade, String s_college, String s_major, String s_gender, String s_birth,
	         String s_country, String status);
	public void writeFile(String number,String s_file, String filename);
	public void StudentInfoUpdate(String s_id,String s_pwd);
	
	public int getSumOfMajorUnit(String s_id);
	public int getSumOfGeneralUnit(String s_id);
	
    public ArrayList<EnrollDto> show_eval(String s_id, int e_year, int e_semester);
    public void update_eval(Double avg_eval, String s_id, String c_id);
    
    public ArrayList<StudentDto> countStudentEachMajor();
    public ArrayList<ProfessorDto> countProfessorEachMajor();
    public String pickPicture(String s_id);
    public ArrayList<StudentDto> StudentList(String p_id);
    public int StudentNumCount(String depart);
}

