package com.human.finalpjt.dto;

import java.sql.Date;

public class ContentDto {
	private int bno; /*�Խù� no��*/
	private String btitle; /*����*/
	private String bcontent; /*�Խù� ����*/
	private String bfile; /*���ϰ��*/
	private String bfilename; /*���� �̸�*/
	private String bname; /*�ۼ���*/
	private Date bdate; /*�ۼ�����*/
	private int bhit; /*��ȸ��*/
	
	public ContentDto(){}
	
	ContentDto(int bno, String btitle, String bcontent, String bfile, String bfilename,String bname, Date bdate, int bhit){
		this.bno = bno;
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.bfile = bfile;
		this.bfilename = bfilename;
		this.bname = bname;
		this.bdate = bdate;
		this.bhit = bhit;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getBtitle() {
		return btitle;
	}

	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}

	public String getBcontent() {
		return bcontent;
	}

	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	
	public String getBfile() {
		return bfile;
	}

	public void setBfile(String bfile) {
		this.bfile = bfile;
	}

	public String getBfilename() {
		return bfilename;
	}

	public void setBfilename(String bfilename) {
		this.bfilename = bfilename;
	}

	public String getBname() {
		return bname;
	}

	public void setBname(String bname) {
		this.bname = bname;
	}

	public Date getBdate() {
		return bdate;
	}

	public void setBdate(Date bdate) {
		this.bdate = bdate;
	}

	public int getBhit() {
		return bhit;
	}

	public void setBhit(int bhit) {
		this.bhit = bhit;
	}
}
