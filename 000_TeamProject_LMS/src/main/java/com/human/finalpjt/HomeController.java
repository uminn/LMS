package com.human.finalpjt;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.naming.NamingException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
//import javax.xml.ws.Response;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.Gson;
import com.human.finalpjt.dao.AdminWorkDao;
import com.human.finalpjt.dao.EnrollDao;
import com.human.finalpjt.dao.InterDao;
import com.human.finalpjt.dao.LectureDao;
import com.human.finalpjt.dao.StudentDao;
import com.human.finalpjt.dao.loginDao;
import com.human.finalpjt.dao.noticeDao;
import com.human.finalpjt.dto.AdminDto;
import com.human.finalpjt.dto.ContentDto;
import com.human.finalpjt.dto.EnrollDto;
import com.human.finalpjt.dto.ProfessorDto;
import com.human.finalpjt.dto.StudentDto;
import com.human.finalpjt.dto.scheduleDto;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

//	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */

	@Autowired
	private SqlSession sqlSession;
	private HttpServletResponse response;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "home";
	}

	@RequestMapping("/main")
	public String main(HttpServletRequest hsr, Model model) throws ParseException {
		HttpSession session = hsr.getSession(); 
		String userType = (String) session.getAttribute("userType");
		String userID=null;
		String userPassword=null;
		loginDao logindao = sqlSession.getMapper(loginDao.class);
		
		if(userType==null) {
	         userID = hsr.getParameter("userID");
	         userPassword = hsr.getParameter("userPassword");
	         String splitID = userID.substring(0, 2);
	         
	         System.out.println("userID - "+userID+", userPassword - "+userPassword);
	         
	        try {
	            Double.parseDouble(splitID);
	            splitID = "no";
	            
	         } catch (NumberFormatException e) {
	        	 
	         }
	         //try {
           	System.out.println("splitID - "+splitID);
	            System.out.println("!!!!!!!!!?????????");
	            if(splitID.equals("no")) {
	                System.out.println("userID1 - "+userID+", userPassword1 - "+userPassword);
	                StudentDto result = logindao.login_verify1(userID,userPassword);
	                //System.out.println(result.equals("null"));
	                if(result!=(null)) {
	                	userType = "s";
	                	System.out.println("userType - "+userType);
	                }else {
	            		userType="alert";
	                    System.out.println("userType - "+userType);
	                    return "home";
	            	}
	            }else if(splitID.equals("cs")) {
	            	System.out.println("userID2 - "+userID+", userPassword2 - "+userPassword);
	            	ProfessorDto result = logindao.login_verify2(userID,userPassword);
	            	//System.out.println(result.equals("null"));
	            	if(result!=(null)) {
	            		userType = "p";
	            		System.out.println("userType - "+userType);
	            	}else {
	            		userType="alert";
	                    System.out.println("userType - "+userType);
	                    return "home";
	            	}
	            }else if(splitID.equals("ad")) {
	            	System.out.println("userID3 - "+userID+", userPassword3 - "+userPassword);
	            	AdminDto result = logindao.login_verify3(userID,userPassword);
	            	//System.out.println(result.equals("null")); //***문제의 처리부분***
	            	if(result!=null) {
	            		userType = "a";
	            		System.out.println("userType - "+userType);
	            	}else { 
	            		userType="alert"; System.out.println("userType - "+userType); 
	            		return "home"; 
	            	}
					 
	            }
           /*}catch(NullPointerException e) {
           		userType="alert";
                   System.out.println("userType - "+userType);
                   return "home";
           }*/
	      }else {
	         userID=(String) session.getAttribute("userID");
	      }
		
		//mainpage notice setting
		noticeDao dao2 = sqlSession.getMapper(noticeDao.class);
		ArrayList<ContentDto> numberPaging = dao2.numberPaging(1,5);
	
		
		
		//mainpage school schedule setting
		EnrollDao dao = sqlSession.getMapper(EnrollDao.class);
		InterDao dao1 = sqlSession.getMapper(InterDao.class);
		StudentDao dao3 = sqlSession.getMapper(StudentDao.class);
		ArrayList<scheduleDto> schlist = dao1.schlistAfterToday();
		ArrayList<String> dday = new ArrayList<String>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date todayAtMidnight = new Date();
		//try {
			todayAtMidnight = sdf.parse(sdf.format(new Date()));
		//} catch (ParseException e) {
			// TODO 자동 생성된 catch 블록
		//	e.printStackTrace();
		//}
		System.out.println(todayAtMidnight);
		for (int i = 0; i < schlist.size(); i++) {
			long calDate = todayAtMidnight.getTime() - schlist.get(i).getSch_fromdate().getTime();
			long diffDay = calDate / (24 * 60 * 60 * 1000);
			System.out.println(diffDay);
			if (diffDay == 0) {
				dday.add("D-Day");
			} else if (diffDay > 0) {
				dday.add("D+" + diffDay);
			} else {
				dday.add("D" + diffDay);
			}
		}
		
		
		// usertype check and send each mainpage
		if (userType.equals("alert")) {
			model.addAttribute("mismatch", userType);
			return "home";
		} else {
			session.setAttribute("thisYear", 2019);
			session.setAttribute("thisSemester",2);
			session.setAttribute("userID",userID);
			session.setAttribute("userType",userType);
			if(userType.equals("s")) {
				session.setAttribute("sinfo",dao.getStudentInfo(userID));
				model.addAttribute("schlist",schlist);
				model.addAttribute("noticelist", numberPaging);
				model.addAttribute("dday", dday);
				return "student_main";
			}else if(userType.equals("p")) {
				session.setAttribute("pinfo",dao.getProfessorInfo(userID));
				model.addAttribute("schlist",schlist);
				model.addAttribute("noticelist", numberPaging);
				model.addAttribute("dday", dday);
				return "professor_main";
			}else if(userType.equals("a")) {
				session.setAttribute("ainfo",dao.getAdminInfo(userID));
				session.setAttribute("possibleMajorStudent", dao.possibleMajorStudent());
				session.setAttribute("StudentEachMajor",dao3.countStudentEachMajor());
				session.setAttribute("possibleMajorProfessor", dao.possibleMajorProfessor());
				session.setAttribute("ProfessorEachMajor",dao3.countProfessorEachMajor());
				return "admin_main";
			}
			return "home";
		}
	}

	/************************************************************************************************************/
	/*
	 * @RequestMapping("/list") // �Խñ� ���(select) public String list(Model model)
	 * { InterDao dao = sqlSession.getMapper(InterDao.class);
	 * model.addAttribute("list", dao.Interlist()); return "list"; }
	 */

	/************************************************************************************************************/
	/*
	 * @RequestMapping("/writer_page") // �Խñ� ����ϱ� ������ public String
	 * writer_page() { return "/writer_page"; }
	 * 
	 * @RequestMapping("/write") // �Խñ� ���(insert) public String
	 * write(MultipartHttpServletRequest mtfRequest, HttpServletRequest req, Model
	 * model) { model.addAttribute("request", req); List<MultipartFile> fileList =
	 * mtfRequest.getFiles("bfile"); String src = mtfRequest.getParameter("src");
	 * String safeFile = null; String originFileName = null; String path =
	 * "D:/springboard/src/main/webapp/resources/file/"; for (MultipartFile mf :
	 * fileList) { originFileName = mf.getOriginalFilename(); // ���� ���� �� long
	 * fileSize = mf.getSize(); // ���� ������
	 * 
	 * System.out.println("originFileName : " + originFileName);
	 * System.out.println("fileSize : " + fileSize);
	 * 
	 * safeFile = path + System.currentTimeMillis() + originFileName;
	 * 
	 * try { mf.transferTo(new File(safeFile)); } catch (IllegalStateException e) {
	 * // TODO Auto-generated catch block e.printStackTrace(); } catch (IOException
	 * e) { // TODO Auto-generated catch block e.printStackTrace(); } } noticeDao
	 * dao = sqlSession.getMapper(noticeDao.class);
	 * dao.write(req.getParameter("btitle"), req.getParameter("bcontent"), safeFile,
	 * originFileName, req.getParameter("bname")); return "redirect:list"; }
	 */

	

	/************************************************************************************************************/

//	@RequestMapping("/p_score") // ������ �󼼺��� (select)
//	public String p_score(HttpServletRequest hsr, Model model) {
//		model.addAttribute("request", hsr);
//		InterDao dao = sqlSession.getMapper(InterDao.class);
//		String p_id = hsr.getParameter("p_id");
//		InterDao dao2 = dao; // insert
//		model.addAttribute("ps", dao.viewDao(p_id));
//		model.addAttribute("se", dao.searchDao(p_id));
//		return "professor_score";
//	}
	@RequestMapping("/p_score") // ������ �󼼺��� (select)
	public String p_score(HttpServletRequest hsr, Model model) {
		model.addAttribute("request", hsr);
		InterDao dao = sqlSession.getMapper(InterDao.class);
		String p_id = hsr.getParameter("p_id");
		System.out.println("PID : " + p_id);
		HttpSession session = hsr.getSession();
		int e_year = (Integer) session.getAttribute("nYear");
		int month = (Integer) session.getAttribute("month");
		int e_semester = 0;
		
		if (month >= 2 && month <= 6) {
			e_semester = 1;
			model.addAttribute("ps", dao.viewDao(p_id, e_year, e_semester));
		} else {
			e_semester = 2;
			model.addAttribute("ps", dao.viewDao(p_id, e_year, e_semester));
		}
		/*
		 * int e_year = (Integer) session.getAttribute("thisYear"); int e_semester =
		 * (Integer) session.getAttribute("thisSemester"); model.addAttribute("ps",
		 * dao.viewDao(p_id, e_year, e_semester));
		 */
		System.out.println("변수들 : "+ p_id+"/"+e_year+"/"+e_semester);
		System.out.println("p_score get result : "+dao.viewDao(p_id, e_year, e_semester));
		System.out.println("길이 : "+dao.viewDao(p_id, e_year, e_semester).size());
		return "professor_score";
	}
	@RequestMapping(value = "/p_scoreinput", method = RequestMethod.GET)
	   public String p_scoreinput(HttpServletRequest hsr, Model model) {
	      model.addAttribute("request", hsr);
	      InterDao dao = sqlSession.getMapper(InterDao.class);
	      String p_id = hsr.getParameter("p_id");

	      System.out.println("PID : " + p_id);
	      HttpSession session = hsr.getSession();
	      int e_year = (Integer) session.getAttribute("nYear");
	      int month = (Integer) session.getAttribute("month");
	      int e_semester = 0;
	      
	      System.out.println("연월 학기 확인 : 연 - "+e_year+", 월 - "+month+", 학기 - "+e_semester);
	      if (month >= 2 && month <= 6) {
	         e_semester = 1;
	         model.addAttribute("ps", dao.viewDao(p_id, e_year, e_semester));
	      } else {
	         e_semester = 2;
	         model.addAttribute("ps", dao.viewDao(p_id, e_year, e_semester));
	      }

	      return "professor_scoreinput";
	   }
	@RequestMapping(value = "/student_grade", method = RequestMethod.GET)
	   public String student_grade(HttpServletRequest hsr, Model model) {
	      model.addAttribute("request", hsr);
	      InterDao dao = sqlSession.getMapper(InterDao.class);
	      HttpSession session = hsr.getSession();
	      String s_id = hsr.getParameter("s_id");
	      int e_year = (Integer) session.getAttribute("nYear");
	      int month = (Integer) session.getAttribute("month");
	      int e_semester = 0;
	      if (month >= 2 && month <= 6) {
	         e_semester = 1;
	         model.addAttribute("st", dao.scoreSelDao(s_id, e_year, e_semester));
	         model.addAttribute("sum",dao.sumDao(e_year,e_semester));
	      } else {
	         e_semester = 2;
	         model.addAttribute("st", dao.scoreSelDao(s_id, e_year, e_semester));
	         model.addAttribute("sum",dao.sumDao(e_year,e_semester));
	      }
	      System.out.println("SDSD3 : " + e_semester);
	      return "student_grade";
	   }
	// 회원가입
	@ResponseBody
	   @RequestMapping(value = "/Update", method = RequestMethod.GET)
	   public void Update(HttpServletRequest request, HttpServletResponse response) {

	      InterDao dao = sqlSession.getMapper(InterDao.class);
	      String c_score = request.getParameter("c_score");
	   
	      String c_alpha = request.getParameter("c_alpha");
	      
	      double c_rank = Double.parseDouble(request.getParameter("c_rank"));

	      String s_id = request.getParameter("s_id");
	      
	      String c_id = request.getParameter("c_id");
	      dao.UpdateDao(c_score, c_alpha,c_rank,s_id,c_id);
	      

	   }

	/************************************************************************************************************/
	/*
	 * @RequestMapping("/modify_page") //�Խ��� ���� public String
	 * modify_page(HttpServletRequest hsr, Model model) { int bno =
	 * Integer.parseInt(hsr.getParameter("bno")); noticeDao dao =
	 * sqlSession.getMapper(noticeDao.class); model.addAttribute("modify",
	 * dao.viewDao(bno)); return "/modify_page"; }
	 * 
	 * @RequestMapping("/modify") public String modify(HttpServletRequest hsr, Model
	 * model) { model.addAttribute("request", hsr); noticeDao dao =
	 * sqlSession.getMapper(noticeDao.class); int bno =
	 * Integer.parseInt(hsr.getParameter("bno")); dao.modify(bno,
	 * hsr.getParameter("btitle"), hsr.getParameter("bcontent"),
	 * hsr.getParameter("bfilename"), hsr.getParameter("bname"));
	 * 
	 * return "redirect:list"; }
	 */

	@RequestMapping(value = "/admin_stinfo", method = RequestMethod.GET)
	public String admin_stinfo(HttpServletRequest request, HttpServletResponse response) {
		return "admin_stinfo";
	}

	@ResponseBody
	@RequestMapping(value = "/admin_stinfo1", method = RequestMethod.GET)
	public void admin_stinfo1(HttpServletRequest request, HttpServletResponse response)
			throws IOException, NamingException, SQLException {
		System.out.println("depart [" + request.getParameter("sdepartment") + "]");
		System.out.println("year [" + request.getParameter("year") + "]");

		String depart = request.getParameter("sdepartment");
		String year = request.getParameter("year");
		PrintWriter out = response.getWriter();
		String data = null;
		StudentDao dao = sqlSession.getMapper(StudentDao.class);
		System.out.println("cutDepart - "+depart.substring(1));
		String cutDepart = depart.substring(1);
		int count = dao.StudentNumCount(cutDepart);
		System.out.println("count result = "+count);
		int counts1 = count + 1;

		System.out.println("counts " + counts1);

		if (counts1 < 10) {
			System.out.println("depart1 " + depart);
			System.out.println("year1 " + year);
			data = year + 0 + depart.substring(0,1) + 0 + counts1;
			System.out.println("data1 : " + data);
		} else if (counts1 >= 10) {
			System.out.println("depart2 " + depart);
			System.out.println("year2 " + year);
			data = year + 0 + depart.substring(0,1) + counts1;
			System.out.println("data2 : " + data);

		}
		out.print(data);
	}

	@RequestMapping("/student_enroll_main") //
	public String student_enroll_main(HttpServletRequest hsr, Model model) {

		return "student_enroll_main";
	}

	@RequestMapping("/student_enroll_apply") //
	public String student_enroll_apply(HttpServletRequest hsr, Model model) {
		HttpSession session = hsr.getSession();
		String sid = (String) session.getAttribute("userID");
		System.out.println("세션에서 받아온 sid :" + sid);

		String completion = hsr.getParameter("completion");
		String depart = null;
		int grade = 0;
		if (completion == null) {
			completion = "";
			depart = "";
		} else {
			depart = hsr.getParameter("depart");
			grade = Integer.parseInt(hsr.getParameter("grade"));
		}
		System.out.println(completion + "/" + depart + "/" + grade);
		System.out.println(completion);
		EnrollDao dao = sqlSession.getMapper(EnrollDao.class);
		ArrayList<EnrollDto> edto = dao.showList(2019, 2, completion, depart, grade);
		ArrayList<EnrollDto> edto2 = dao.showMyApply(sid, 2019, 2);
		System.out.println("강의 갯수" + edto.size());

		model.addAttribute("sinfo", dao.getStudentInfo(sid));
		model.addAttribute("teachList", edto);
		model.addAttribute("howmanyTeach", edto.size());
		model.addAttribute("possibleMajor", dao.possibleMajorStudent());
		model.addAttribute("myApplyList", edto2);
		model.addAttribute("howmanyApply", edto2.size());
		model.addAttribute("sumMyApplyUnit", dao.sumMyApplyUnit(sid, 2019, 2));
		/* System.out.println("어떤 수업 듣는사람수 : "+ edto.get(0).getsNum()); */
		/* System.out.println("수업같이듣는 사람수 : "+ edto2.get(0).getsNum()); */
		return "student_enroll_apply";
	}

	@RequestMapping("/insertMyApply")
	public String insertMyApply(HttpServletRequest hsr, Model model) {
		HttpSession session = hsr.getSession();
		String sid = (String) session.getAttribute("userID");

		EnrollDao dao = sqlSession.getMapper(EnrollDao.class);
		try {
			dao.insertMyApply(sid, hsr.getParameter("cid"), 1, 2019, 2);
		} catch (Exception e) {
		}

		return "redirect:../student_enroll_apply";
	}

	@RequestMapping("/deleteMyApply")
	public String deleteMyApply(HttpServletRequest hsr, Model model) {
		HttpSession session = hsr.getSession();
		String sid = (String) session.getAttribute("userID");

		EnrollDao dao = sqlSession.getMapper(EnrollDao.class);
		dao.deleteMyApply(sid, 2019, 2, hsr.getParameter("cid"));

		return "redirect:../student_enroll_apply";
	}

	@RequestMapping("/student_enroll_view")
	public String student_enroll_view(HttpServletRequest hsr, Model model) {
		HttpSession session = hsr.getSession();
		String sid = (String) session.getAttribute("userID");
		System.out.println("세션에서 받아온 sid :" + sid);

		String completion = hsr.getParameter("completion");
		String depart = null;
		int grade = 0;
		if (completion == null) {
			completion = "";
			depart = "";
		} else {
			depart = hsr.getParameter("depart");
			grade = Integer.parseInt(hsr.getParameter("grade"));
		}
		System.out.println(completion + "/" + depart + "/" + grade);
		System.out.println(completion);
		EnrollDao dao = sqlSession.getMapper(EnrollDao.class);
		ArrayList<EnrollDto> edto = dao.showList(2019, 2, completion, depart, grade);
		ArrayList<String> pid = dao.showList2(2019, 2, completion, depart, grade);
		ArrayList<EnrollDto> edto2 = dao.showMyApply(sid, 2019, 2);
		ArrayList<EnrollDto> edto3 = dao.showAllMyApply(sid); 
		System.out.println("강의 갯수" + edto.size());
		System.out.println("view pid - "+pid);
		model.addAttribute("sinfo", dao.getStudentInfo(sid));
		model.addAttribute("teachList", edto);
		model.addAttribute("forAJAX",pid);
		model.addAttribute("howmanyTeach", edto.size());
		model.addAttribute("possibleMajor", dao.possibleMajorStudent());
		model.addAttribute("myApplyList", edto2);
		model.addAttribute("howmanyApply", edto2.size());
		model.addAttribute("sumMyApplyUnit", dao.sumMyApplyUnit(sid, 2019, 2));
		model.addAttribute("allMyApplyList",edto3);
		return "student_enroll_view";
	}

	/*
	 * @RequestMapping("/student_evaluation") public String
	 * student_evaluation(HttpServletRequest hsr, Model model) { HttpSession session
	 * = hsr.getSession(); String s_id =(String) session.getAttribute("userID"); int
	 * thisYear =(Integer) session.getAttribute("thisYear"); int thisSemester
	 * =(Integer) session.getAttribute("thisSemester"); EnrollDao dao =
	 * sqlSession.getMapper(EnrollDao.class); ArrayList<EnrollDto> lecList =
	 * dao.showMyApply(s_id, thisYear, thisSemester); model.addAttribute("lecList",
	 * lecList); return "student_evaluation"; }
	 */

	@RequestMapping("/student_info")
	public String student_info(HttpServletRequest hsr, Model model) {
		HttpSession session = hsr.getSession();
		String sid = (String) session.getAttribute("userID");
		EnrollDao dao = sqlSession.getMapper(EnrollDao.class);
		StudentDao StudentDao = sqlSession.getMapper(StudentDao.class);
		model.addAttribute("picture",StudentDao.pickPicture(sid));
		model.addAttribute("sinfo", dao.getStudentInfo(sid));
		
		
		return "student_info";
	}

	@RequestMapping("/student_last")
	public String student_last(HttpServletRequest hsr, Model model) {
		HttpSession session = hsr.getSession();
		String s_id =(String) session.getAttribute("userID");
		StudentDao dao = sqlSession.getMapper(StudentDao.class);
		int sumOfMajor = dao.getSumOfMajorUnit(s_id);
		int sumOfGeneral = dao.getSumOfGeneralUnit(s_id);
		
		model.addAttribute("som", sumOfMajor);
		model.addAttribute("sog", sumOfGeneral);
		return "student_last";
	}

	@RequestMapping("/student_timetable")
	public String student_timetable(HttpServletRequest hsr, Model model) {
		return "student_timetable";
	}

	@ResponseBody
	@RequestMapping("/searchTimetable")
	public void searchTimetable(HttpServletRequest hsr, HttpServletResponse response) throws IOException {
		System.out.println("searchTimetable()");
		HttpSession session = hsr.getSession();
		String sid = (String) session.getAttribute("userID");
		EnrollDao dao = sqlSession.getMapper(EnrollDao.class);
		ArrayList<EnrollDto> edto = dao.showMyApply(sid, Integer.parseInt(hsr.getParameter("year")),
				Integer.parseInt(hsr.getParameter("semester")));
		System.out.println("가져온 강의수 : "+edto.size());
		Gson gson = new Gson();
		String jsonPlace = gson.toJson(edto);

		PrintWriter out = response.getWriter();
		out.print(jsonPlace);
	}

//	@RequestMapping("/admin_schedule") 
//	public String admin_schedule(HttpServletRequest hsr, Model model) {	
//		return "admin_schedule";
//	}
	@RequestMapping("/admin_schedule")
	public String admin_scheduleform(Model model) {
		InterDao dao = sqlSession.getMapper(InterDao.class);
		model.addAttribute("count", dao.count());
		System.out.println("count[" + dao.count() + "]");
		ArrayList<scheduleDto> schlist = dao.schlist();
		model.addAttribute("schlist", schlist);
		System.out.println("첫번째 날짜 : " + schlist.get(0).getSch_fromdate());
		ArrayList<String> dday = new ArrayList<String>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date todayAtMidnight = new Date();
		try {
			todayAtMidnight = sdf.parse(sdf.format(new Date()));
		} catch (ParseException e) {
			// TODO 자동 생성된 catch 블록
			e.printStackTrace();
		}
		System.out.println(todayAtMidnight);
		for (int i = 0; i < schlist.size(); i++) {
			long calDate = todayAtMidnight.getTime() - schlist.get(i).getSch_fromdate().getTime();
			long diffDay = calDate / (24 * 60 * 60 * 1000);
			System.out.println(diffDay);
			if (diffDay == 0) {
				dday.add("D-Day");
			} else if (diffDay > 0) {
				dday.add("D+" + diffDay);
			} else {
				dday.add("D" + diffDay);
			}

		}
		model.addAttribute("dday", dday);


		return "admin_schedule";
	}

	@RequestMapping("/schinsert")
	public String schinsert(HttpServletRequest req, Model model) {
		InterDao dao = sqlSession.getMapper(InterDao.class);
		String fromDate = req.getParameter("sch_fromdate");
		String toDate = req.getParameter("sch_todate");
		String schContent = req.getParameter("sch_content");
		System.out.println("schedule info check : fromDate [ " + fromDate + " ], toDate [ " + toDate + " ]");
		if (fromDate.equals("") || toDate.equals("")) {
			System.out.println("Pass~");
		} else {
			dao.schInsert(fromDate, toDate, schContent);
		}
		return "redirect:admin_schedule";
	}
	
	

	@RequestMapping("/writer_page1")//게시글 등록하기 페이지
	public String writer_page(HttpServletRequest request, Model model) {
//		noticeDao dao = sqlSession.getMapper(noticeDao.class);
		
		return "/writer_page";
	}
	
	@RequestMapping("/write") //게시글 등록(insert)
	public String write(MultipartHttpServletRequest mtfRequest, HttpServletRequest request, Model model) {
//		model.addAttribute("request", req);
		List<MultipartFile> fileList = mtfRequest.getFiles("bfile");
		System.out.println("write fileList : "+fileList);
		noticeDao dao = sqlSession.getMapper(noticeDao.class);
		int selSequence = dao.selectSequence();
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		model.addAttribute("pageNum",pageNum);
		
		System.out.println("selSequence : "+selSequence);
		System.out.println("fileList check 1 - "+fileList);
		/*
		 * String src = mtfRequest.getParameter("src"); 
		 * System.out.println(src);
		 */
		String safeFile = null;
		String originFileName = null;
		String path = "D:/springboard/src/main/webapp/resources/file/";
		
		dao.write(selSequence,request.getParameter("btitle"), 
				request.getParameter("bcontent"),
				request.getParameter("bname"));
		
		for (MultipartFile mf : fileList) {
			originFileName = mf.getOriginalFilename(); // 원본 파일 명
//			long fileSize = mf.getSize(); // 파일 사이즈

			System.out.println("originFileName : " + originFileName);
//			System.out.println("fileSize : " + fileSize);
			
			if(originFileName.equals("")) {
				//dao.writeFile(selSequence,null, null);
				System.out.println("파일 없어서 생략");
			}else {
				safeFile = path + System.currentTimeMillis() + originFileName;
				System.out.println("safeFile check : "+safeFile);
				dao.writeFile(selSequence,safeFile, originFileName);
			}
			
			try {
				mf.transferTo(new File(safeFile));
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("저장할 파일이 없습니다.");
			}
		}
		model.addAttribute("count",dao.count());
		model.addAttribute("list", dao.list());
		model.addAttribute("pagingCount",dao.pagingCount());
		model.addAttribute("pageNum",pageNum);
		
		return "redirect:numberPaging";
	}
	/************************************************************************************************************/
	
	@RequestMapping("/view") // 페이지 상세보기 (select)
	public String view(HttpServletRequest hsr, Model model) {
		
		noticeDao dao = sqlSession.getMapper(noticeDao.class);
		
		int bno = Integer.parseInt(hsr.getParameter("bno"));
		
		
		model.addAttribute("bno", bno);
		System.out.println("페이지 상세보기 모델값 : "+model.addAttribute("bno", bno));
		
		ArrayList<String> filename = dao.loadFileName(bno);
		ArrayList<String> path = dao.pathSearch(bno);
		
		dao.upHit(bno); // 조회수 증가 (update)
		
		
			model.addAttribute("detail", dao.viewDao(bno));
			for(int i=0; i<path.size();i++) {
				path.set(i, path.get(i).replace("D:/springboard/src/main/webapp/","")) ; /*.replace("D:/springboard/src/main/webapp/resources/file/","")*/
				filename.set(i, filename.get(i)) ;
			}
			model.addAttribute("pathname",filename);
			model.addAttribute("path",path);
			System.out.println("view path : "+path);
			System.out.println("view pathname : "+filename);
			
		return "view";
	}
	/************************************************************************************************************/
	@RequestMapping("/modify_page") //게시판 수정
	public String modify_page(HttpServletRequest hsr, Model model) {
		
		noticeDao dao = sqlSession.getMapper(noticeDao.class);
		int bno = Integer.parseInt(hsr.getParameter("bno"));
		int fileCount = dao.fileCount(bno);
		model.addAttribute("fileCount",fileCount);
		System.out.println("fileCount : "+fileCount);
		
		ArrayList<String> filename = dao.loadFileName(bno);
		ArrayList<Integer> rownum = dao.rownums(bno);
		ArrayList<String> modifyPath = dao.pathSearch(bno);
		ContentDto modify = dao.viewDao(bno);
		
		model.addAttribute("count",dao.count());
		model.addAttribute("rownum",rownum);
		model.addAttribute("modifyFilenameLoad",filename);
		model.addAttribute("modifyPath",modifyPath);
		model.addAttribute("modify", modify);
		model.addAttribute("bno", bno);
		System.out.println("modify : "+modify);
		System.out.println("modifyFilename : "+filename);
		System.out.println("modifyPath : "+modifyPath);
		System.out.println("bno : "+bno);
		System.out.println("!!!!!!!!!!!!!!!!");
		
		return "/modify_page";
	}
	
	
	@RequestMapping("/modify")
	public String modify(MultipartHttpServletRequest mtfRequest, HttpServletRequest hsr, Model model) {
		model.addAttribute("request", hsr);
		System.out.println("?????????????");
		noticeDao dao = sqlSession.getMapper(noticeDao.class);
		
		List<MultipartFile> fileList = mtfRequest.getFiles("bfile");
		System.out.println("fileList : "+fileList);
		
		int bno = Integer.parseInt(hsr.getParameter("bno"));
		int pageNum = 1;
		
		String safeFile = null;
		String originFileName = null;
		String path = "D:/springboard/src/main/webapp/resources/file/";

		for (MultipartFile mf : fileList) {
			originFileName = mf.getOriginalFilename(); // 원본 파일 명
			long fileSize = mf.getSize(); // 파일 사이즈

			System.out.println("originFileName : " + originFileName);
			System.out.println("fileSize : " + fileSize);
			safeFile = path + System.currentTimeMillis() + originFileName;
			System.out.println("safeFile1 : " + safeFile);
			try {
				mf.transferTo(new File(safeFile));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			//dao.deleteFile(bno);
			//*******************************//
			if(originFileName.equals("")) {
				//dao.modifyFile(bno,null, null);
				System.out.println("파일 없어서 생략");
			}else {
				safeFile = path + System.currentTimeMillis() + originFileName;
				System.out.println("safeFile check2 : "+safeFile);
				dao.writeFile(bno,safeFile, originFileName);
			}
		}
		
		dao.modify(bno, hsr.getParameter("btitle"), hsr.getParameter("bcontent"), hsr.getParameter("bname"));
		model.addAttribute("count",dao.count());
		model.addAttribute("list", dao.list());
		model.addAttribute("pagingCount",dao.pagingCount());
		model.addAttribute("pageNum",pageNum);
		
		return "redirect:numberPaging";
	}
	/************************************************************************************************************/
	@RequestMapping("/delete")
	public String delete(HttpServletRequest hsr, Model model) {
		model.addAttribute("request", hsr);
		noticeDao dao = sqlSession.getMapper(noticeDao.class);
		
		int pageNum = 1;
		int bno = Integer.parseInt(hsr.getParameter("bno"));
		dao.delete(bno);
		dao.deleteFile(bno);
		int count = dao.count();
		System.out.println("delete count : "+count);
		
		model.addAttribute("count",count);
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("pagingCount",dao.pagingCount());

		return "redirect:numberPaging";
	}
	/***************************************************************************************************************/
	@RequestMapping("/filedownload")
	@ResponseStatus(HttpStatus.OK)	// Thymeleaf 사용시 이것을 사용해야 에러가 발생하지 않음
	public void fileDownloadOnWebBroweser(HttpServletRequest req, HttpServletResponse res, Model model) throws Exception  {
	//		model.addAttribute("request", req);
		File f=null;
		String path_re = null;
		
		noticeDao dao = sqlSession.getMapper(noticeDao.class);
		System.out.println("download bno check : "+req.getParameter("bno"));
		int bno =  Integer.parseInt(req.getParameter("bno"));
		String filenameReceive = req.getParameter("filenameToss");
		
		System.out.println("check filenameReceive : "+filenameReceive);
		/* int bno = Integer.parseInt(req.getParameter("bno")); */
		System.out.println("fileDownload bno : "+bno);    //13 46
		ArrayList<String> filename = dao.pathSearch2(filenameReceive);
		System.out.println("filename : "+filename);
		System.out.println("file 1 : "+filename.get(0).substring(59));
		//System.out.println("file 2 : "+filename.get(1).replace("D:/springboard/src/main/webapp/resources/file/",""));
		//System.out.println("file 3 : "+filename.get(2).replace("D:/springboard/src/main/webapp/resources/file/",""));
		for(int i=0;i<filename.size();i++) {
			if(filenameReceive.equals(filename.get(i).substring(59))) {
				path_re= filename.get(i); //.replace("D:/springboard/src/main/webapp/resources/file/","")
				System.out.println("download path : "+path_re);
				f = new File(path_re);
				System.out.println("check f : "+f);
			}
		}
		
	
	    String downloadName = null;
	    String browser = req.getHeader("User-Agent");
	    
	    //파일 인코딩
	    if(browser.contains("Chrome")){
	    	//브라우저 확인 파일명 encode  		             
	    	downloadName = URLEncoder.encode(f.getName(), "UTF-8").replaceAll("\\+", "%20");		             
	    }else {
	    	downloadName = new String(f.getName().getBytes("UTF-8"), "ISO-8859-1");
	    }        
	    System.out.println("downloadName : "+downloadName);
	    
	    res.setHeader("Content-Disposition", "attachment;filename=\"" + downloadName +"\"");             
	    res.setContentType("application/octer-stream");
	    res.setHeader("Content-Transfer-Encoding", "binary;");
	
	    try {
	    	FileInputStream fis = new FileInputStream(f);
	        ServletOutputStream sos = res.getOutputStream();
	
		    byte[] b = new byte[2048];
		    int data = 0;
	
		    while((data=(fis.read(b, 0, b.length))) != -1){
		    	sos.write(b, 0, data);		             
		    }
		    sos.flush();
	    } catch(Exception e) {
	      throw e;
	    }
	  }
	/* 게시판 파일삭제*/
	@ResponseBody
	@RequestMapping(value="deleteFile", method=RequestMethod.GET)
	public void deleteFile(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		noticeDao dao = sqlSession.getMapper(noticeDao.class);
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		int rownums = Integer.parseInt(request.getParameter("rownum"));
		System.out.println("check result bno [ "+bno+" ], rownum [ "+rownums+" ]");
		
		ArrayList<String> bfilename = dao.loadFileName(bno);
		System.out.println("bfilename check : "+bfilename.get(rownums-1));
		dao.deleteFileInModify(bno, bfilename.get(rownums-1));
	}
	
	/* 번호 페이징*/
	@RequestMapping(value="numberPaging", method=RequestMethod.GET)
	public String buttonPaging(HttpServletRequest request,HttpServletResponse response,Model model) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
		noticeDao dao = sqlSession.getMapper(noticeDao.class);
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
		System.out.println("buttonPaging controll check");
		System.out.println("button Page button check : "+pageNum);
		
		int firstNum = (1+(pageNum*10)-10);
		int secondNum =(10+(pageNum*10)-10);
		int pagingCount = dao.pagingCount();
		int count = dao.count();
		
		System.out.println("count/10 : "+(count/10));
		System.out.println("dao.pagingCount : "+dao.pagingCount());
		System.out.println("1page firstNum : "+firstNum);
		ArrayList<ContentDto> numberPaging = dao.numberPaging(firstNum,secondNum);
		
		System.out.println("pageNum : "+pageNum);
		System.out.println("numberPaging : "+numberPaging);
		System.out.println("numberPaing fristNum : "+firstNum+", secondNum : "+secondNum);
		
		//String outPrint = "<a id='next' href='numberPaging?pageNum="+(pageNum)+"'>next</a>";
		
		/*
		 * if(pageNum <= pagingCount) { System.out.println("왜 되는거야?");
		 * model.addAttribute("pagingCount",pagingCount); }else {
		 * System.out.println("빵꾸똥꾸"); }
		 */
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("list", numberPaging);
		model.addAttribute("count",count);
		model.addAttribute("pagingCount",pagingCount);
		System.out.println("count : "+dao.count());
		
		return "list";
	}
	
	/* 게시판 검색 */
	@ResponseBody
	@RequestMapping(value="searchAJAX",method=RequestMethod.GET)
	public void searchAJAX(HttpServletRequest request,HttpServletResponse response,Model model) throws IOException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
		noticeDao dao = sqlSession.getMapper(noticeDao.class);
		PrintWriter out = response.getWriter();
		
		String selectVal = request.getParameter("selectVal");
		String searchVal1 = request.getParameter("searchVal1");
		String searchVal2 = request.getParameter("searchVal2");
		String searchVal3 = request.getParameter("searchVal3");
		ArrayList<ContentDto> boardSearchList = null;
		int boardSearchCount = 0;
		
		System.out.println("selectVal : "+selectVal);
		System.out.println("searchVal1 : "+searchVal1);
		System.out.println("searchVal1 : "+searchVal2);
		System.out.println("searchVal1 : "+searchVal3);
		
		if(selectVal.equals("searchTitleAndContent")) {
			String searchVal4 = searchVal1;
			String searchVal5 = searchVal2;
			String searchVal6 = searchVal3;
			//전체
			if(searchVal2==null && searchVal3 == null) {
				boardSearchList = dao.boardSearch1("%" +searchVal1+"%","%" +searchVal4+"%");
				boardSearchCount = dao.boardSearch1_1("%" +searchVal1+"%","%" +searchVal4+"%");
			}else if(searchVal3 == null) {
				boardSearchList = dao.boardSearch11("%" +searchVal1+"%","%" +searchVal2+"%","%" +searchVal4+"%","%" +searchVal5+"%");
				boardSearchCount = dao.boardSearch2_1("%" +searchVal1+"%","%" +searchVal2+"%","%" +searchVal4+"%","%" +searchVal5+"%");
			}else {
				boardSearchList = dao.boardSearch111("%" +searchVal1+"%","%" +searchVal2+"%","%" +searchVal3+"%","%" +searchVal4+"%","%" +searchVal5+"%","%" +searchVal6+"%");
				boardSearchCount = dao.boardSearch3_1("%" +searchVal1+"%","%" +searchVal2+"%","%" +searchVal3+"%","%" +searchVal4+"%","%" +searchVal5+"%","%" +searchVal6+"%");
			}
		}else if(selectVal.equals("searchTitle")){
			//제목
			if(searchVal2==null && searchVal3 == null) {
				boardSearchList = dao.boardSearch2("%" +searchVal1+"%");
				boardSearchCount = dao.boardSearch1_2("%" +searchVal1+"%");
			}else if(searchVal3 == null) {
				boardSearchList = dao.boardSearch22("%" +searchVal1+"%", "%" +searchVal2+"%");
				boardSearchCount = dao.boardSearch2_2("%" +searchVal1+"%", "%" +searchVal2+"%");
			}else {
				boardSearchList = dao.boardSearch222("%" +searchVal1+"%", "%" +searchVal2+"%", "%" +searchVal3+"%");
				boardSearchCount = dao.boardSearch3_2("%" +searchVal1+"%", "%" +searchVal2+"%", "%" +searchVal3+"%");
			}
		}else if(selectVal.equals("searchContent")){
			//내용
			if(searchVal2==null && searchVal3 == null) {
				boardSearchList = dao.boardSearch3("%" +searchVal1+"%");
				boardSearchCount = dao.boardSearch1_3("%" +searchVal1+"%");
			}else if(searchVal3 == null) {
				boardSearchList = dao.boardSearch33("%" +searchVal1+"%", "%" +searchVal2+"%");
				boardSearchCount = dao.boardSearch2_3("%" +searchVal1+"%", searchVal2);
			}else {
				boardSearchList = dao.boardSearch333("%" +searchVal1+"%", "%" +searchVal2+"%", "%" +searchVal3+"%");
				boardSearchCount = dao.boardSearch3_3("%" +searchVal1+"%", "%" +searchVal2+"%", "%" +searchVal3+"%");
			}
		}
		System.out.println("boardSearchList size : "+boardSearchList);
		System.out.println("boardSearchCount count : "+boardSearchCount);
		
		Gson gson = new Gson();
        String search = gson.toJson(boardSearchList);
        System.out.println("json : "+search);
        
        model.addAttribute("list",boardSearchList);
        model.addAttribute("count",boardSearchCount);
		out.print(search);
		
		//return "searchList";
	}
	//10.3 added
	@RequestMapping(value = "/studentInfoInput",method = RequestMethod.POST)
    public String admin_stinfoInput(MultipartHttpServletRequest mtf,HttpServletRequest request, HttpServletResponse response) throws IllegalStateException, IOException {
                            
       StudentDao dao = sqlSession.getMapper(StudentDao.class);
       MultipartFile files = mtf.getFile("sfile");
       String s_name = request.getParameter("s_name");
       String s_college = request.getParameter("s_university");
       String s_birth = request.getParameter("s_birth");
       String s_gender = request.getParameter("s_gender");
       String s_country = request.getParameter("s_country");
       String s_addr = request.getParameter("s_address");
       String s_id = request.getParameter("s_id");
       String s_major = request.getParameter("depart");
       int s_grade = Integer.parseInt(request.getParameter("level"));
       String status = request.getParameter("s_status");
       String s_phone = request.getParameter("s_mobile");
       String s_email = request.getParameter("s_email");
       String s_pwd = s_birth;
       //List<MultipartFile> fileList = mtfRequest.getFiles("sfile");
       
       String safeFile = null;
       String originFileName = null;
       String path = "C:/Users/HU-101-27/eclipse-workspace/000_TeamProject_LMS/src/main/webapp/resources/images/";
       
       dao.StudentInfoInput(s_id,s_pwd,s_name, s_addr,s_email,s_phone,s_grade, s_college, s_major, s_gender,s_birth, s_country, status);
       
       originFileName = files.getOriginalFilename(); // �썝蹂� �뙆�씪 紐�
       System.out.println("originFileName : " + originFileName);
       if(originFileName.equals("")) {
           System.out.println("파일없어서 생략");
       }else {
           String imageFile=originFileName.substring((originFileName.length()-4));
           if(imageFile.equals(".png")) {
              originFileName = s_id+".png";
           }else
           if(imageFile.equals(".jpg")) {
              originFileName = s_id+".jpg";
           }else
           if(imageFile.equals("Jpeg")) {
              originFileName = s_id+".Jpeg";
           }else
           if(imageFile.equals(".gif")) {
              originFileName = s_id+".gif";
           }
           safeFile = path + originFileName;
           System.out.println("safeFile1 : " + safeFile);
           files.transferTo(new File(safeFile));
           safeFile = path + originFileName;
           System.out.println("safeFile check2 : "+safeFile);
           dao.writeFile(s_id,safeFile, originFileName);
       }
       
       return "admin_main";
    }
	   @RequestMapping("/student_edit1")
	   public String student_edit1(HttpServletRequest request, Model model) {
	      HttpSession session = request.getSession();
	      String sid = (String) session.getAttribute("userID");
	      EnrollDao dao = sqlSession.getMapper(EnrollDao.class);
	      System.out.println("sid "+sid);
	      model.addAttribute("sinfo", dao.getStudentInfo(sid));
	      return "student_edit";
	   }
	   
	   @RequestMapping("/student_editer")
	   public String student_edit(MultipartHttpServletRequest mtf,HttpServletRequest request, Model model) throws IllegalStateException, IOException {
	      StudentDao dao = sqlSession.getMapper(StudentDao.class);
	      HttpSession session = request.getSession();
	      MultipartFile files = mtf.getFile("sfile");
	      String s_pwd = request.getParameter("password");
	      String s_id = (String) session.getAttribute("userID");
	      String safeFile = null;
	      String originFileName = null;
	      String path = "C:/Users/HU-101-27/eclipse-workspace/000_TeamProject_LMS/src/main/webapp/resources/images/";
	      dao.StudentInfoUpdate(s_id,s_pwd);
	      
	      System.out.println("!!!!!");
	      originFileName = files.getOriginalFilename(); // �썝蹂� �뙆�씪 紐�
	       System.out.println("originFileName : " + originFileName);
	       if(originFileName.equals("")) {
	           System.out.println("파일없어서 생략");
	       }else {
	    	   File f = new File(path+originFileName);
	 	       f.delete();
	           String imageFile=originFileName.substring((originFileName.length()-4));
	           if(imageFile.equals(".png")) {
	              originFileName = s_id+".png";
	           }else
	           if(imageFile.equals(".jpg")) {
	              originFileName = s_id+".jpg";
	           }else
	           if(imageFile.equals("Jpeg")) {
	              originFileName = s_id+".Jpeg";
	           }else
	           if(imageFile.equals(".gif")) {
	              originFileName = s_id+".gif";
	           }
	           safeFile = path + originFileName;
	           System.out.println("safeFile1 : " + safeFile);
	           files.transferTo(new File(safeFile));
	           safeFile = path + originFileName;
	           System.out.println("safeFile check2 : "+safeFile);
	           dao.writeFile(s_id,safeFile, originFileName);
	       }
	       
	      System.out.println("edit check");
	      return "student_main";
	   }
	   /********************************** 지도학생 목록 ****************************************************/
	   
	   @RequestMapping("professor_studentInfomation")
	   public String professor_studentInfomation(HttpServletRequest request,Model model) {
		   StudentDao dao = sqlSession.getMapper(StudentDao.class);
		   HttpSession session = request.getSession();
		   String p_id = (String) session.getAttribute("userID");
		   System.out.println("p_id - "+p_id);
		   ArrayList<StudentDto> studentList = dao.StudentList(p_id);
		   System.out.println("studentList - "+studentList);
		   model.addAttribute("studentList",studentList);
		   
		   return "professor_studentInfo";
	   }
	
	   /********************************** 교수님 강의계획서 영역 ************************************************/
		@RequestMapping("professor_lectureplan")
		public String professor_lecture(HttpServletRequest hsr, Model model) {
			HttpSession session = hsr.getSession();
			LectureDao dao = sqlSession.getMapper(LectureDao.class);

			String p_id = (String) session.getAttribute("userID");
			int t_year = (Integer) session.getAttribute("thisYear");
			int t_semester = (Integer) session.getAttribute("thisSemester");
			System.out.println("t_year["+t_year+"]");
			System.out.println("t_semester["+t_semester+"]");
			
			int lec_no = dao.get_lecnum(p_id, t_year, t_semester);
			System.out.println("세션에서 받아온 sid :" + p_id);
			
			model.addAttribute("p", dao.show_lecinfo(p_id,t_semester));
			model.addAttribute("lec_list", dao.show_leclist(lec_no));// SELECT 결과
			model.addAttribute("lec_no", lec_no);

			return "professor_lectureplan";
		}
		@RequestMapping("lec_write")
		public String professor_lecture_write(HttpServletRequest hsr, Model model) {
			HttpSession session = hsr.getSession();
			String p_id = (String) session.getAttribute("userID");
			int t_year = (Integer) session.getAttribute("thisYear");
			int t_semester = (Integer) session.getAttribute("thisSemester");
			System.out.println("t_year["+t_year+"]");
			System.out.println("t_semester["+t_semester+"]");
			
			LectureDao dao = sqlSession.getMapper(LectureDao.class);
			int lec_no = dao.get_lecnum(p_id, t_year, t_semester);
			System.out.println("lec_no["+lec_no+"]");
			int lec_mid1 = 0;
			int lec_final1 = 0;
			int lec_homework1 = 0;
			int lec_active1 = 0;
			int lec_attendance1 = 0;
			
			String lec_week1 = hsr.getParameter("lec_week1");
			String lec_week2 = hsr.getParameter("lec_week2");
			String lec_week3 = hsr.getParameter("lec_week3");
			String lec_week4 = hsr.getParameter("lec_week4");
			String lec_week5 = hsr.getParameter("lec_week5");
			String lec_week6 = hsr.getParameter("lec_week6");
			String lec_week7 = hsr.getParameter("lec_week7");
			String lec_week8 = hsr.getParameter("lec_week8");
			String lec_week9 = hsr.getParameter("lec_week9");
			String lec_week10 = hsr.getParameter("lec_week10");
			String lec_week11 = hsr.getParameter("lec_week11");
			String lec_week12 = hsr.getParameter("lec_week12");
			String lec_week13 = hsr.getParameter("lec_week13");
			String lec_week14 = hsr.getParameter("lec_week14");
			String lec_week15 = hsr.getParameter("lec_week15");
			String lec_book = hsr.getParameter("lec_book");
			/*******************************************************************/
			String lec_mid = hsr.getParameter("lec_mid");
			String lec_final = hsr.getParameter("lec_final");
			String lec_homework = hsr.getParameter("lec_homework");
			String lec_active = hsr.getParameter("lec_active");
			String lec_attendance = hsr.getParameter("lec_attendance");
			
			System.out.println("lec_mid["+lec_mid+"]");
			System.out.println("lec_final["+lec_final+"]");
			System.out.println("lec_homework["+lec_homework+"]");
			System.out.println("lec_active["+lec_active+"]");
			System.out.println("lec_attendance["+lec_attendance+"]");
			
			if(!lec_mid.equals("")) {
				lec_mid1 = Integer.parseInt(lec_mid);
				System.out.println("lec_mid1["+lec_mid1+"]");
			}
			if(!lec_final.equals("")) {
				lec_final1 = Integer.parseInt(lec_final);
				System.out.println("lec_final1["+lec_final1+"]");
			}
			if(!lec_homework.equals("")) {
				lec_homework1 = Integer.parseInt(lec_homework);
				System.out.println("lec_homework1["+lec_homework1+"]");
			}
			if(!lec_active.equals("")) {
				lec_active1 = Integer.parseInt(lec_active);
				System.out.println("lec_active1["+lec_active1+"]");
			}
			if(!lec_attendance.equals("")) {
				lec_attendance1 = Integer.parseInt(lec_attendance);
				System.out.println("lec_attendance1["+lec_attendance1+"]");
			}
			/*******************************************************************/
			String lec_middate = hsr.getParameter("lec_middate");
			String lec_middatefrom = hsr.getParameter("lec_middatefrom");
			String lec_finaldate = hsr.getParameter("lec_finaldate");
			String lec_finaldatefrom = hsr.getParameter("lec_finaldatefrom");
			String lec_type = hsr.getParameter("lec_type");
			System.out.println("lec_type["+lec_type+"]");
			if(lec_type.equals("true")) {
				dao.modify_lecweek(lec_no,lec_week1,lec_week2,lec_week3,lec_week4,lec_week5,lec_week6,lec_week7,lec_week8,lec_week9,lec_week10,lec_week11,lec_week12,lec_week13,lec_week14,lec_week15,lec_book);
				dao.modify_lecgrade(lec_no,lec_mid1, lec_final1, lec_homework1, lec_active1, lec_attendance1);
				dao.modify_lecdate(lec_no,lec_middate, lec_middatefrom, lec_finaldate, lec_finaldatefrom);
			} else {
				dao.insert_lecweek(lec_no,lec_week1,lec_week2,lec_week3,lec_week4,lec_week5,lec_week6,lec_week7,lec_week8,lec_week9,lec_week10,lec_week11,lec_week12,lec_week13,lec_week14,lec_week15,lec_book);
				dao.insert_lecgrade(lec_no,lec_mid1, lec_final1, lec_homework1, lec_active1, lec_attendance1);
				dao.insert_lecdate(lec_no,lec_middate, lec_middatefrom, lec_finaldate, lec_finaldatefrom);
			}
			return "redirect: professor_lectureplan";
		}
		/********************************** 학생 강의평가 영역 ************************************************/
		   @RequestMapping("/student_evaluation")
		   public String student_evaluation(HttpServletRequest hsr, Model model) {
			   	model.addAttribute("request", hsr);
				StudentDao dao = sqlSession.getMapper(StudentDao.class);
				String s_id = hsr.getParameter("s_id");

				System.out.println("s_id["+s_id+"]");
				HttpSession session = hsr.getSession();
				int e_year = (Integer) session.getAttribute("nYear");
				int month = (Integer) session.getAttribute("month");
				int e_semester = 0;
				
				if (month >= 2 && month <= 6) {
					e_semester = 1;
				    model.addAttribute("eval", dao.show_eval(s_id, e_year, e_semester));
				} else {
					e_semester = 2;
					model.addAttribute("eval", dao.show_eval(s_id, e_year, e_semester));
				}
				System.out.println("변수들 : " + s_id + "/" + e_year + "/" + e_semester);
				System.out.println("길이 : " + dao.show_eval(s_id, e_year, e_semester).size());
				
				for(int i=0;i<dao.show_eval(s_id, e_year, e_semester).size();i++) {
					System.out.println("show eval의 교수이름값 : " + dao.show_eval(s_id, e_year, e_semester).get(i).getP_name());
					System.out.println("show eval의 avg값 : " + dao.show_eval(s_id, e_year, e_semester).get(i).getE_avg_eval());
				}
				
				return "student_evaluation";
		   }
		   
		   @RequestMapping(value = "/student_evaluationinput", method = RequestMethod.GET)
		   public String student_evaluationinput(HttpServletRequest hsr, Model model) {
			   model.addAttribute("request", hsr);
			   StudentDao dao = sqlSession.getMapper(StudentDao.class);
			   String s_id = hsr.getParameter("s_id");
			   String c_id = hsr.getParameter("c_id");
				
			   model.addAttribute("s_id",s_id);
			   model.addAttribute("c_id",c_id);
						
			   System.out.println("s_id in input["+s_id+"]");
			   System.out.println("c_id in input["+c_id+"]");
				
			   HttpSession session = hsr.getSession();
			   int e_year = (Integer) session.getAttribute("nYear");
			   int month = (Integer) session.getAttribute("month");
			   int e_semester = 0;
				
			   if (month >= 2 && month <= 6) {
				   e_semester = 1;
				   model.addAttribute("eval", dao.show_eval(s_id, e_year, e_semester));
			   } else {
				   e_semester = 2;
				   model.addAttribute("eval", dao.show_eval(s_id, e_year, e_semester));
			   }
			   return "student_evaluationinput";
		   }
		   @RequestMapping("/student_eval_update")
			public String student_eval_update(HttpServletRequest hsr, Model model) {
			   System.out.println("student_eval_update()");
				model.addAttribute("request", hsr);
				StudentDao dao = sqlSession.getMapper(StudentDao.class);
				String s_id = hsr.getParameter("s_id");
				String c_id = hsr.getParameter("c_id");
				
				double avg_eval = Double.parseDouble(hsr.getParameter("avg_eval"));
				System.out.println("avg_eval in update["+avg_eval+"]");
				double parse_avg = Double.parseDouble(String.format("%.2f",avg_eval));
				
//				DecimalFormat format = new DecimalFormat(".##");
//				String str123 = format.format(avg_eval);
//				System.out.println("BEFORE1 / str123 : " + str123);
//				
//				str123 = str123.substring(0,3);
//				
//				System.out.println("BEFORE / str123 : " + str123);
//				
//				str123 = str123.substring(0, 1) + "." + str123.substring(1, str123.length());
//				
//				System.out.println("AFTER / str123 : " + str123);
				
				System.out.println("s_id in update["+s_id+"]");
				System.out.println("c_id in update["+c_id+"]");
				System.out.println("parse_eval in update["+parse_avg+"]");
				
				HttpSession session = hsr.getSession();
				int e_year = (Integer) session.getAttribute("nYear");
				int month = (Integer) session.getAttribute("month");
				int e_semester = 0;
				
				if (month >= 2 && month <= 6) {
					e_semester = 1;
				    dao.update_eval(parse_avg,s_id,c_id);
				} else {
					e_semester = 2;
					dao.update_eval(parse_avg,s_id,c_id);
				}
				return "student_evaluationinput";
			}
		
	@ResponseBody
	@RequestMapping(value="/modifySchedule",method=RequestMethod.GET)
	public void modifySchedule(HttpServletRequest hsr, Model model) throws IOException {
		System.out.println("modifySchedule()");
		int sch_no = Integer.parseInt(hsr.getParameter("sch_no")) ;
		String sch_fromdate=hsr.getParameter("fromdate");
		String sch_todate=hsr.getParameter("todate");
		String sch_content=hsr.getParameter("sch_content");
		System.out.println("스케쥴변경값들 : "+sch_no+"/"+sch_fromdate+"/"+sch_todate+"/"+sch_content);
		InterDao dao = sqlSession.getMapper(InterDao.class);
		dao.schUpdate(sch_no,sch_fromdate,sch_todate,sch_content);
		System.out.println("스케쥴 변경완료");

	}
	
	@RequestMapping("student_lectureplan")
	public String student_lectureplan(HttpServletRequest request,Model model) {
		
		LectureDao dao = sqlSession.getMapper(LectureDao.class);
		int month = Integer.parseInt(request.getParameter("month"));
		String p_id = request.getParameter("p_id");
		System.out.println("check month > "+month);
		System.out.println("student lecture p_id - "+p_id);
		int t_semester = 0;
		try {
			if('1' <= month && month >= '6') {
				t_semester = 1;
			}else {
				t_semester = 2;
			}
		}catch(Exception e) {
			System.out.println("fail");
		}
		
		System.out.println("student lecture p - ");
		model.addAttribute("p", dao.show_lecinfo(p_id,t_semester));
		
		return "student_lectureplan";
	}
	
	//관리자 휴학신청페이지 맵핑
	@RequestMapping(value="/admin_requestList",method=RequestMethod.GET)
	public String requestList(HttpServletRequest request,Model model,HttpServletResponse response) throws IOException {
		AdminWorkDao dao = sqlSession.getMapper(AdminWorkDao.class);
		ArrayList<StudentDto> requestList = dao.showRequestList();
		
		model.addAttribute("requestList",requestList);
		
		return "admin_requestList";
	}
	
	//휴학신청
	@RequestMapping(value="/request",method=RequestMethod.POST)
	public void request(HttpServletRequest request,Model model,HttpServletResponse response) throws IOException {
		
		AdminWorkDao dao = sqlSession.getMapper(AdminWorkDao.class);
		
		PrintWriter out = response.getWriter();
		String name = request.getParameter("name");
		String major = request.getParameter("major");
		String id = request.getParameter("id");
		String period = null;
		String reason = null;
		System.out.println("HC check : name - "+name+", major - "+major+", id - "+id);
		
		dao.requestList(major,id,name,period,reason);
		out.print("name - "+name+", major - "+major+", id - "+id);
	}
	
	@RequestMapping(value="/requestUpdate",method=RequestMethod.POST)
	public void requestUpdate(HttpServletRequest request,Model model,HttpServletResponse response) throws IOException {
		
		AdminWorkDao dao = sqlSession.getMapper(AdminWorkDao.class);
		
		String id = request.getParameter("id");
		String period = request.getParameter("period");
		String reason = request.getParameter("reason");
		System.out.println("requestUpdate check : id - "+id+", period - "+period+", reason - "+reason);
		dao.requestUpdate(period,reason,id);
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest hsr, Model model) {
		HttpSession session = hsr.getSession();
		session.invalidate();
		session=null;
		
		HttpSession session1 = hsr.getSession();
		String pleaseNull = (String) session1.getAttribute("userType");
		System.out.println("userType will be null : "+pleaseNull);
		return "logout";
	}

	
}
