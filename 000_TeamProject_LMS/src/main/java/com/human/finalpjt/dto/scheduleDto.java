package com.human.finalpjt.dto;

import java.sql.Date;

public class scheduleDto {
	private String sch_no; /*(������ȣ) -> ���� ��¥*/
	private String sch_content; /*(���� ����)*/
	private Date sch_fromdate; /*(�� ��¥)*/
	private Date sch_todate; /* (�� ��¥) */
	
	public scheduleDto() {}
	
	scheduleDto(String sch_no, String sch_content, Date sch_fromdate, Date sch_todate){
		this.sch_no = sch_no;
		this.sch_content = sch_content;
		this.sch_fromdate = sch_fromdate;
		this.sch_todate = sch_todate;
	}
	public String getSch_no() {
		return sch_no;
	}
	public void setSch_no(String sch_no) {
		this.sch_no = sch_no;
	}
	public String getSch_content() {
		return sch_content;
	}
	public void setSch_content(String sch_content) {
		this.sch_content = sch_content;
	}
	public Date getSch_fromdate() {
		return sch_fromdate;
	}
	public void setSch_fromdate(Date sch_fromdate) {
		this.sch_fromdate = sch_fromdate;
	}
	public Date getSch_todate() {
		return sch_todate;
	}
	public void setSch_todate(Date sch_todate) {
		this.sch_todate = sch_todate;
	}
	
	
}
