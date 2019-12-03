package com.human.finalpjt.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.human.finalpjt.dto.score_dto;

public class grade_dao {
	/*
	 * String name=null; //과목명 String name_code = null; //과목코드 String day = null;
	 * //수업일시 String room = null; // 강의실
	 */
	DataSource ds=null;
	public grade_dao() {
	      try {
	    	  
	          Context cxt = new InitialContext();
	          ds = (DataSource) cxt.lookup("java:comp/env/jdbc/Oracle11g");
	          System.out.println(ds);
	       } catch (NamingException e) {
	          // TODO Auto-generated catch block
	          e.printStackTrace();
	       }
		}
	
	public ArrayList<score_dto> p_grade(String p_id){
		ArrayList <score_dto> p_list = new ArrayList<score_dto>();
		Connection conn = null;
		PreparedStatement ps=null;
		ResultSet rs = null;
		
		String sql=null;
		
		try {
			conn=ds.getConnection();
			sql ="select a.s_id as s_id, a.s_name as s_name, b.c_name as c_name from student a, course b where c_id in(select c.c_id from teach c, professor d where c.p_id = d.p_id and c.p_id =?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, p_id);

			rs = ps.executeQuery();
			
			if(rs.next()) {
				
				String s_id =rs.getString("s_id");
				String s_name =rs.getString("s_name");
				String c_name =rs.getString("c_name");
				score_dto sdto = new score_dto(s_id,s_name,c_name);
				
				p_list.add(sdto);
//				p_list.add(new score_dto(s_id));
//				p_list.add(c_name);		
			}
		}
		
		catch(Exception e) {
			
		
	}
		finally {
			try {
				ps.close();
				conn.close();
				rs.close();
			}catch(Exception e) {
				e.printStackTrace();
			}			
		}
		return p_list;
		
	}
}
