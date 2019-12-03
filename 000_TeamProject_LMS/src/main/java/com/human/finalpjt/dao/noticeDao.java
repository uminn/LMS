package com.human.finalpjt.dao;

import java.util.ArrayList;
import java.util.Date;

import com.human.finalpjt.dto.ContentDto;

public interface noticeDao {
	/*�Խ��� ���*/
	public ArrayList<ContentDto> list();
	/*�Խ��� ��� ����*/
	public int count();
	/*�Խ��� �� ���*/
	public void write(int selSequence,String btitle, String bcontent, String bname);
	/*�Խ��� �� ���� ���*/
	public void writeFile(int bno,String bfile, String bfilename);
	/*�Խ��� ����*/
	public void modify(int bno, String btitle, String bcontent,String name);
	public void modifyFile(int bno,String bfile,String bfilename);
	/*�Խ��� �� �б�*/
	public ContentDto viewDao(int bno);
	/*�� ��ȸ�� ���� */
	public void upHit(int bno);
	/*�Խ��� ���� ������ ��*/
	public ArrayList<String> pathSearch(int bno);
	
	/*�Խ��ǿ��� ���� �ٿ�ε��� ��*/
	public ArrayList<String> pathSearch2(String bfilename);
	
	/*�Խ��� ����*/
	public void delete(int bno);
	public void deleteFile(int bno);
	/*�Խ��� �������ư*/
	public void boardAJAX(int bno, String btitle, String bcontent, String bname, Date bdate, int bhit);
	/*�Խ��� ��ȣ ������*/
	public int selectSequence();
	public ArrayList<String> loadFileName(int bno);

	/***********�߰� �� ��****************/
	/*���� ���̵�*/
	public ArrayList<Integer> rownums(int bno);
	/*������ ���� ����*/
	//public ArrayList<String> pickRownum(int bno,int rownums);
	public void deleteFileInModify(int bno,String bfilename);
	public int fileCount(int bno);
	public ArrayList<ContentDto> paging(int from,int to);
	
	/* ��ȣ ����¡*/
	public ArrayList<ContentDto> numberPaging(int firstNum,int secondNum);
	/* ��ȣ����¡ ī��Ʈ*/
	public int pagingCount();
	
	/* �Խ��� �˻�*/ //��ü
	public ArrayList<ContentDto> boardSearch1(String searchVal1,String searchVal4);
	public int boardSearch1_1(String searchVal1,String searchVal4);
	public ArrayList<ContentDto> boardSearch11(String searchVal1,String searchVal2,String searchVal4,String searchVal5);
	public int boardSearch2_1(String searchVal1,String searchVal2,String searchVal4,String searchVal5);
	public ArrayList<ContentDto> boardSearch111(String searchVal1,String searchVal2,String searchVal3,String searchVal4,String searchVal5,String searchVal6);
	public int boardSearch3_1(String searchVal1,String searchVal2,String searchVal3,String searchVal4,String searchVal5,String searchVal6);
	
	/* �Խ��� �˻�*/ // ����
	public ArrayList<ContentDto> boardSearch2(String searchVal1);
	public int boardSearch1_2(String searchVal1);
	public ArrayList<ContentDto> boardSearch22(String searchVal1,String searchVal2);
	public int boardSearch2_2(String searchVal1,String searchVal2);
	public ArrayList<ContentDto> boardSearch222(String searchVal1,String searchVal2,String searchVal3);
	public int boardSearch3_2(String searchVal1,String searchVal2,String searchVal3);
	
	/* �Խ��� �˻�*/ // ����
	public ArrayList<ContentDto> boardSearch3(String searchVal1);
	public int boardSearch1_3(String searchVal1);
	public ArrayList<ContentDto> boardSearch33(String searchVal1,String searchVal2);
	public int boardSearch2_3(String searchVal1,String searchVal2);
	public ArrayList<ContentDto> boardSearch333(String searchVal1,String searchVal2,String searchVal3);
	public int boardSearch3_3(String searchVal1,String searchVal2,String searchVal3);
}

