package com.human.finalpjt.dao;

import java.util.ArrayList;

import com.human.finalpjt.dto.AdminDto;
import com.human.finalpjt.dto.EnrollDto;
import com.human.finalpjt.dto.ProfessorDto;
import com.human.finalpjt.dto.StudentDto;

public interface EnrollDao {
	public ArrayList<EnrollDto> showList(int year, int semester,String completion,String depart,int grade);
	public ArrayList<String> showList2(int year, int semester,String completion,String depart,int grade);
	public ArrayList<String> possibleMajorStudent();
	public ArrayList<String> possibleMajorProfessor();
	public ArrayList<EnrollDto> showMyApply(String sid, int year, int semester);
	public ArrayList<EnrollDto> showAllMyApply(String sid);
	public void insertMyApply(String sid,String cid, int cidno, int year, int semester);
	public void deleteMyApply(String sid, int year, int semester, String cid);
	public int sumMyApplyUnit(String sid, int year, int semester);
	public StudentDto getStudentInfo(String sid);
	public ProfessorDto getProfessorInfo(String pid);
	public AdminDto getAdminInfo(String aid);
}
