package com.human.finalpjt.dao;

import java.util.ArrayList;

import com.human.finalpjt.dto.StudentDto;

public interface AdminWorkDao {
	public ArrayList<String> requestList(String major, String id, String name, String period, String reason);
	public void requestUpdate(String period,String reason,String id);
	public ArrayList<StudentDto> showRequestList();
}
