package com.human.finalpjt.dao;

import com.human.finalpjt.dto.AdminDto;
import com.human.finalpjt.dto.ProfessorDto;
import com.human.finalpjt.dto.StudentDto;

public interface loginDao {
	public StudentDto login_verify1(String id,String pwd);
	public ProfessorDto login_verify2(String id,String pwd);
	public AdminDto login_verify3(String id,String pwd);
}