package com.eagle.men_in_black.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tiles.request.Request;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.events.EventException;

import com.eagle.men_in_black.model.FileModel;
import com.eagle.men_in_black.model.ServiceDto;
import com.eagle.men_in_black.service.ServiceSvc;
import com.google.gson.Gson;

@Controller
public class ServiceController {
	Logger loger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private ServiceSvc serviceSvc;

	// 고객센터 메인(공지사항)
	@RequestMapping("servicenotice.mib")
	public ModelAndView servicenotice(HttpServletRequest res, HttpServletResponse rep) {

		ModelAndView mav = new ModelAndView("service/notice");

		String PAGE_NUM = (res.getParameter("PAGE_NUM") == null || res.getParameter("PAGE_NUM") == "") ? "1"
				: res.getParameter("PAGE_NUM");
		String PAGE_SIZE = (res.getParameter("PAGE_SIZE") == null || res.getParameter("PAGE_SIZE") == "") ? "10"
				: res.getParameter("PAGE_SIZE");

		HashMap<String, String> map = new HashMap<>();
		map.put("PAGE_SIZE", PAGE_SIZE);
		map.put("PAGE_NUM", PAGE_NUM);

		List<ServiceDto> noticelist = serviceSvc.do_service_main(map);

		mav.addObject("noticelist", noticelist);

		return mav;

	}

	// 고객센터 공지사항(디테일)
	@RequestMapping("servicedetail.mib")
	public ModelAndView servicedetail(HttpServletRequest res, HttpServletResponse rep) {
		// view 에서 보낸 seq 받기
		int seq = Integer.parseInt(res.getParameter("seq"));

		ModelAndView mav = new ModelAndView("service/noticedetail");
		ServiceDto dto = serviceSvc.do_service_detail(seq);
		mav.addObject("detail", dto);
		return mav;

	}

	// 공지사항쓰기(관리자)
	@RequestMapping(value = "servicereg.mib", method = RequestMethod.POST)
	public ModelAndView noticeincert(MultipartHttpServletRequest res) {

		ModelAndView mav = new ModelAndView("service/notice");

		// DB에 글등록
		String editor = res.getParameter("editor");
		String noticetitle = res.getParameter("noticetitle");

		HashMap<String, String> writemap = new HashMap<>();
		writemap.put("content", editor);
		writemap.put("noticetitle", noticetitle);

		serviceSvc.do_service_reg(writemap);

		// 공지게시판 목록으로 다시가기
		HashMap<String, String> map = new HashMap<>();
		map.put("PAGE_SIZE", "10");
		map.put("PAGE_NUM", "1");

		List<ServiceDto> noticelist = serviceSvc.do_service_main(map);

		mav.addObject("noticelist", noticelist);
		return mav;
	}

	// 공지사항수정(관리자)
	@RequestMapping("serviceupdate.mib")
	public ModelAndView serviceupdate(HttpServletRequest res, HttpServletResponse rep) {

		String seq = res.getParameter("seq");
		String editor = res.getParameter("editor");
		String noticetitle = res.getParameter("noticetitle");

		HashMap<String, String> writemap = new HashMap<>();
		writemap.put("content", editor);
		writemap.put("noticetitle", noticetitle);
		writemap.put("seq", seq);

		serviceSvc.do_service_update(writemap);

		ModelAndView mav = new ModelAndView("service/noticedetail");
		ServiceDto dto = serviceSvc.do_service_detail(Integer.parseInt(seq));
		mav.addObject("detail", dto);

		return mav;

	}

	// 공지사항삭제(관리자)
	@RequestMapping("servicedelete.mib")
	public ModelAndView servicedelete(HttpServletRequest res, HttpServletResponse rep) {

		int seq = Integer.parseInt(res.getParameter("seq"));

		ModelAndView mav = new ModelAndView("service/notice");
		int serviceDto = serviceSvc.do_service_delete(seq);

		HashMap<String, String> map = new HashMap<>();
		map.put("PAGE_SIZE", "10");
		map.put("PAGE_NUM", "1");

		List<ServiceDto> noticelist = serviceSvc.do_service_main(map);

		mav.addObject("noticelist", noticelist);

		return mav;

	}

	// --------------------------//공지사항

	// --------------------------이벤트

	// 이벤트 처음 리스트 뿌려주는 뷰
	@RequestMapping("event.mib")
	public ModelAndView event(HttpServletRequest res, HttpServletResponse rep) {

		ModelAndView mav = new ModelAndView("service/event");

		String PAGE_NUM = (res.getParameter("PAGE_NUM") == null || res.getParameter("PAGE_NUM") == "") ? "1"
				: res.getParameter("PAGE_NUM");
		String PAGE_SIZE = (res.getParameter("PAGE_SIZE") == null || res.getParameter("PAGE_SIZE") == "") ? "6"
				: res.getParameter("PAGE_SIZE");

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("PAGE_SIZE", PAGE_SIZE);
		map.put("PAGE_NUM", PAGE_NUM);

		List<ServiceDto> eventlist = serviceSvc.do_event_main(map);
		List<ServiceDto> couplist = serviceSvc.do_select_couplist();
		mav.addObject("eventlist", eventlist);
		mav.addObject("couplist", couplist);

		return mav;

	}

	// 이벤트 작성뷰 이동
	@RequestMapping("eventwrite.mib")
	public ModelAndView event_reg(HttpServletRequest res) {

		ModelAndView mav = new ModelAndView("/service/eventwrite");
		String seq = res.getParameter("seq") == null ? "0" : res.getParameter("seq");
		int intseq = Integer.parseInt(seq);
		ServiceDto dto = serviceSvc.do_event_detail(intseq);
		mav.addObject("write", dto);

		return mav;

	}

	// 이벤트 수정(수정버튼 눌렀을때)관리자
	@RequestMapping("eventupdate.mib")
		public ModelAndView eventupdate(MultipartHttpServletRequest res) throws IllegalStateException, IOException{
		
		String seq = res.getParameter("seq");
		String editor = res.getParameter("editor");
		String eventtitle = res.getParameter("eventtitle");
		
		HashMap<String, String> map = new HashMap<>();
		map.put("content", editor);
		map.put("eventtitle", eventtitle);
		map.put("seq", seq);
		
		serviceSvc.do_event_update(map);
		
			
			// 이벤트 시퀀스구하고 파일저장
			HttpSession session = res.getSession();

			Iterator<String> iterator = res.getFileNames();

			// 저장경로
			String root_path = session.getServletContext().getRealPath("/"); // 웹서비스
																				// root
																				// 경로
			// String root_path = System.getProperty("catalina.home");
			String attach_path = "images\\";
			String filePath = root_path + attach_path;

			MultipartFile multipartFile = null;

			String originalFileName = null;

			String originalFileExtension = null;

			String storedFileName = null;

			ServiceDto dto = null;

			File file = new File(filePath);
			// 폴더가없을경우 폴더생성
			if (file.exists() == false) {

				file.mkdirs();

			}

			while (iterator.hasNext()) {
				multipartFile = res.getFile(iterator.next());

				if (multipartFile.isEmpty() == false) {

					originalFileName = multipartFile.getOriginalFilename();

					originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));

					storedFileName =  getRandomString() + originalFileExtension;

					// 첨부한 파일 생성
					file = new File(filePath + storedFileName);

					multipartFile.transferTo(file);

					dto = new ServiceDto();

					dto.setEVENT_SEQ(Integer.parseInt(seq));

					dto.setORIGINAL_FILE_NAME(originalFileName);

					dto.setSTORED_FILE_NAME(storedFileName);
					
					serviceSvc.do_photo_update(dto);

				}

			}
		
		
		ServiceDto dedto = serviceSvc.do_event_detail(Integer.parseInt(seq));
		ModelAndView mav = new ModelAndView("service/eventdetail");
		
		mav.addObject("eventdetail", dedto);
		
		return mav;
	
	}
	
	
	//이벤트 삭제(삭제 눌렀을떄)관리자
	@RequestMapping("eventdelete.mib")
	public ModelAndView eventdelete(HttpServletRequest res, HttpServletResponse rep) {
		
		int seq = Integer.parseInt(res.getParameter("seq"));
		
		ModelAndView mav = new ModelAndView("service/event");
		int serviceDto = serviceSvc.do_event_delete(seq);
		if(serviceDto>0){
			serviceSvc.do_photo_delete(seq);
		}
		
		HashMap<String, String> map = new HashMap<>();
		map.put("PAGE_SIZE", "10");
		map.put("PAGE_NUM", "1");
		
		List<ServiceDto> eventlist = serviceSvc.do_event_main(map);
		List<ServiceDto> couplist = serviceSvc.do_select_couplist();
		
		mav.addObject("eventlist", eventlist);
		mav.addObject("couplist", couplist);
		return mav;
	}
	
	
	// 이벤트 글작성 버튼 클릭시 
	@RequestMapping("eventreg.mib")
	public ModelAndView eventreg(MultipartHttpServletRequest res) throws IllegalStateException, IOException {

		ModelAndView mav = new ModelAndView("service/event");

		String eventtitle = res.getParameter("eventtitle");
		String eventcontent = res.getParameter("editor");

		HashMap<String, String> map = new HashMap<>();
		map.put("eventtitle", eventtitle);
		map.put("eventcontent", eventcontent);

		int inser = 0;

		inser = serviceSvc.do_event_reg(map);
		// 위까지가 이벤트 글 등록 끝
		int eventseq = 0;
		if (inser > 0) {
			eventseq = serviceSvc.do_select_eventseq();
			// 이벤트 시퀀스구하고 파일저장
			HttpSession session = res.getSession();

			Iterator<String> iterator = res.getFileNames();

			// 저장경로
			String root_path = session.getServletContext().getRealPath("/"); // 웹서비스
																				// root
																				// 경로
			// String root_path = System.getProperty("catalina.home");
			String attach_path = "images\\";
			String filePath = root_path + attach_path;

			MultipartFile multipartFile = null;

			String originalFileName = null;

			String originalFileExtension = null;

			String storedFileName = null;

			ServiceDto dto = null;

			File file = new File(filePath);
			// 폴더가없을경우 폴더생성
			if (file.exists() == false) {

				file.mkdirs();

			}

			while (iterator.hasNext()) {
				multipartFile = res.getFile(iterator.next());

				if (multipartFile.isEmpty() == false) {

					originalFileName = multipartFile.getOriginalFilename();

					originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));

					storedFileName =  getRandomString() + originalFileExtension;

					// 첨부한 파일 생성
					file = new File(filePath + storedFileName);

					multipartFile.transferTo(file);

					dto = new ServiceDto();

					dto.setEVENT_SEQ(eventseq);

					dto.setORIGINAL_FILE_NAME(originalFileName);

					dto.setSTORED_FILE_NAME(storedFileName);

				}

			}

			serviceSvc.do_event_photo(dto);

		}

		HashMap<String, String> mapmain = new HashMap<String, String>();
		mapmain.put("PAGE_SIZE", "10");
		mapmain.put("PAGE_NUM", "1");

		List<ServiceDto> eventlist = serviceSvc.do_event_main(mapmain);

		mav.addObject("eventlist", eventlist);
		List<ServiceDto> couplist = serviceSvc.do_select_couplist();
		mav.addObject("couplist", couplist);

		return mav;
	}

	// 파일 이름 중복 방지 메소드
	public static String getRandomString() {

		return UUID.randomUUID().toString().replaceAll("-", "");

	}

	// 이벤트 상세보기
	@RequestMapping("eventdetail.mib")
	public ModelAndView eventdetail(HttpServletRequest res, HttpServletResponse rep) {

		int seq = Integer.parseInt(res.getParameter("SEQ"));

		ModelAndView mav = new ModelAndView("service/eventdetail");
		ServiceDto dto = serviceSvc.do_event_detail(seq);
		mav.addObject("eventdetail", dto);
		return mav;
	}

	
	//-------------------쿠폰
	
	// 쿠폰 글쓰기 창
	@RequestMapping("couponwrite.mib")
	public ModelAndView couponwrite(HttpServletRequest res, HttpServletResponse rep) {
		ModelAndView mav = new ModelAndView("/service/couponwrite");

		
		return mav;
	}
	
	//쿠폰 상세보기
	@RequestMapping("coupdetail.mib")
	public ModelAndView coupdetail(HttpServletRequest res, HttpServletResponse rep) {
		
		
		String seq = res.getParameter("seq") == null ? "0" : res.getParameter("seq");
		
		int intseq = Integer.parseInt(seq);
		ModelAndView mav = new ModelAndView("/service/coupdetail");
		ServiceDto dto = serviceSvc.do_selelct_coupdt(intseq);
	
		mav.addObject("coupdetail", dto);
	
		return mav;
		
	}
	
	//쿠폰 수정
	@RequestMapping("coupupdate.mib")

	public ModelAndView coupupdate(MultipartHttpServletRequest res) throws IllegalStateException, IOException{
	
	String seq = res.getParameter("seq");
	String couponname = res.getParameter("couponname");
	String couponprice = res.getParameter("couponprice");
	String couponcondition = res.getParameter("couponcondition");
	String couponlimit = res.getParameter("couponlimit");
			
	
	ServiceDto dto = new ServiceDto();
	dto.setCOUP_NAME(couponname);
	dto.setCOUP_PRICE(Integer.parseInt(couponprice));
	dto.setCONDITION(Integer.parseInt(couponcondition));
	dto.setCOUP_LIMIT(couponlimit);
	dto.setCOUP_SEQ(Integer.parseInt(seq));
	
	serviceSvc.do_coup_update(dto);
	
		
		// 이벤트 시퀀스구하고 파일저장
		HttpSession session = res.getSession();

		Iterator<String> iterator = res.getFileNames();

		// 저장경로
		String root_path = session.getServletContext().getRealPath("/"); // 웹서비스
																			// root
																			// 경로
		// String root_path = System.getProperty("catalina.home");
		String attach_path = "images\\";
		String filePath = root_path + attach_path;

		MultipartFile multipartFile = null;

		String originalFileName = null;

		String originalFileExtension = null;

		String storedFileName = null;

		ServiceDto photodto = null;

		File file = new File(filePath);
		// 폴더가없을경우 폴더생성
		if (file.exists() == false) {

			file.mkdirs();

		}

		while (iterator.hasNext()) {
			multipartFile = res.getFile(iterator.next());

			if (multipartFile.isEmpty() == false) {

				originalFileName = multipartFile.getOriginalFilename();

				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));

				storedFileName =  getRandomString() + originalFileExtension;

				// 첨부한 파일 생성
				file = new File(filePath + storedFileName);

				multipartFile.transferTo(file);

				photodto = new ServiceDto();

				photodto.setCOUP_SEQ(Integer.parseInt(seq));

				photodto.setORIGINAL_FILE_NAME(originalFileName);

				photodto.setSTORED_FILE_NAME(storedFileName);
				
				serviceSvc.do_coupphoto_update(photodto);

			}

		}
	
	
		HashMap<String, String> mapp = new HashMap<String, String>();
		mapp.put("PAGE_SIZE", "10");
		mapp.put("PAGE_NUM", "1");

		List<ServiceDto> eventlist = serviceSvc.do_event_main(mapp);
		List<ServiceDto> couplist = serviceSvc.do_select_couplist();
	
		ModelAndView mav = new ModelAndView("service/event");
	
		mav.addObject("eventlist", eventlist);
		mav.addObject("couplist", couplist);
	
	
		return mav;
		

}
	
	//쿠폰 삭제
	@RequestMapping("coupdelete.mib")
	public ModelAndView coupdelete(HttpServletRequest res, HttpServletResponse rep) {
		
		int seq = Integer.parseInt(res.getParameter("seq"));
		
		ModelAndView mav = new ModelAndView("service/event");
		int serviceDto = serviceSvc.do_coup_delete(seq);
		if(serviceDto>0){
			serviceSvc.do_coupphoto_delete(seq);
		}
		
		HashMap<String, String> map = new HashMap<>();
		map.put("PAGE_SIZE", "10");
		map.put("PAGE_NUM", "1");
		
		List<ServiceDto> eventlist = serviceSvc.do_event_main(map);
		List<ServiceDto> couplist = serviceSvc.do_select_couplist();
		
		mav.addObject("eventlist", eventlist);
		mav.addObject("couplist", couplist);
		return mav;
	}
	




	// 쿠폰 작성후 등록 버튼눌럿을때
	@RequestMapping("couponreg.mib")
	public ModelAndView couponreg(MultipartHttpServletRequest res) throws IllegalStateException, IOException {
		ModelAndView mav = new ModelAndView("service/event");

		String couponname = res.getParameter("couponname");
		String couponprice = res.getParameter("couponprice");
		String couponcondition = res.getParameter("couponcondition");
		String couponlimit = res.getParameter("couponlimit");

		ServiceDto dto = new ServiceDto();
		dto.setCOUP_NAME(couponname);
		dto.setCOUP_PRICE(Integer.parseInt(couponprice));
		dto.setCONDITION(Integer.parseInt(couponcondition));
		dto.setCOUP_LIMIT(couponlimit);
		dto.setUSER_ID("adm");
		dto.setCOUP_RECV("none");

		int couinser = 0;
		couinser = serviceSvc.do_insert_coupon(dto);
		int couseq = 0;

		if (couinser > 0) {
			couseq = serviceSvc.do_select_couseq();
			// 이벤트 시퀀스구하고 파일저장
			HttpSession session = res.getSession();

			Iterator<String> iterator = res.getFileNames();

			// 저장경로
			String root_path = session.getServletContext().getRealPath("/"); // 웹서비스
																				// root
																				// 경로
			// String root_path = System.getProperty("catalina.home");
			String attach_path = "images\\";
			String filePath = root_path + attach_path;

			MultipartFile multipartFile = null;

			String originalFileName = null;

			String originalFileExtension = null;

			String storedFileName = null;

			ServiceDto photodto = null;

			File file = new File(filePath);
			// 폴더가없을경우 폴더생성
			if (file.exists() == false) {

				file.mkdirs();

			}

			while (iterator.hasNext()) {
				multipartFile = res.getFile(iterator.next());

				if (multipartFile.isEmpty() == false) {

					originalFileName = multipartFile.getOriginalFilename();

					originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));

					storedFileName = "../images/" + getRandomString() + originalFileExtension;

					// 첨부한 파일 생성
					file = new File(filePath + storedFileName);

					multipartFile.transferTo(file);

					photodto = new ServiceDto();

					photodto.setCOUP_SEQ(couseq);

					photodto.setORIGINAL_FILE_NAME(originalFileName);

					photodto.setSTORED_FILE_NAME(storedFileName);

				}

			}

			serviceSvc.do_inser_coupt(photodto);

		}

		HashMap<String, String> mapmain = new HashMap<String, String>();
		mapmain.put("PAGE_SIZE", "10");
		mapmain.put("PAGE_NUM", "1");

		List<ServiceDto> eventlist = serviceSvc.do_event_main(mapmain);

		mav.addObject("eventlist", eventlist);

		List<ServiceDto> couplist = serviceSvc.do_select_couplist();
		mav.addObject("couplist", couplist);

		return mav;
	}

	// 쿠폰지급
	@RequestMapping(value = "coupto.mib", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public @ResponseBody String coupto(HttpServletRequest res) {
		Map<String, Object> resultMap = new HashMap<>();

		// 뷰에서부터 시퀀스랑 유저아이디 넘겨받음
		String seq = (res.getParameter("seq") == null || res.getParameter("seq") == "") ? "" : res.getParameter("seq");
		String userid = (res.getParameter("userid") == null || res.getParameter("userid") == "") ? ""
				: res.getParameter("userid");

		// System.out.println("seq = = " + seq);

		int updateCom = 0;
		// 시퀀스로 지급할 쿠폰 정보 얻어옴
		ServiceDto dto = serviceSvc.do_selelct_coupdt(Integer.parseInt(seq));
		// 기존에 유저가 받았었는지 확인
		HashMap<String, String> map = new HashMap<>();
		map.put("seq", seq);
		map.put("userid", userid);

		int checknum = serviceSvc.check_coupon(map);

		if (checknum == 0) {

			// 클릭한 유저에게 지급할 디티오 새로 작성
			ServiceDto inserdto = new ServiceDto();
			inserdto.setCONDITION(dto.getCONDITION());
			inserdto.setCOUP_LIMIT(dto.getCOUP_LIMIT());
			inserdto.setCOUP_NAME(dto.getCOUP_NAME());
			inserdto.setCOUP_PRICE(dto.getCOUP_PRICE());
			inserdto.setCOUP_RECV(seq);
			inserdto.setUSER_ID(userid);

			updateCom = serviceSvc.do_insert_coupon(inserdto);

			if (updateCom > 0) {

				resultMap.put("check", "쿠폰등록성공!");

				Gson gson = new Gson();
				return gson.toJson(resultMap);
			} else {
				resultMap.put("check", "쿠폰등록실패!");

				Gson gson = new Gson();
				return gson.toJson(resultMap);
			}

		} else {
			resultMap.put("check", "쿠폰을이미발급받았습니다.");

			Gson gson = new Gson();
			return gson.toJson(resultMap);
		}
	}

	/* FCK Editor */
	@RequestMapping("CkeditorNoticeUpload.mib")
	public ModelAndView register_Good(HttpServletRequest res) {

		ModelAndView mav = new ModelAndView("/service/noticewrite");
		String seq = res.getParameter("seq") == null ? "0" : res.getParameter("seq");
		int intseq = Integer.parseInt(seq);
		ServiceDto dto = serviceSvc.do_service_detail(intseq);
		mav.addObject("update", dto);

		return mav;

	}
	

	/* FCK 이미지업로드 */
	@RequestMapping(value = "CkeditorImgUpload.mib", method = RequestMethod.POST)
	public ModelAndView procFileUpload(FileModel fileBean, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();

		String root_path = session.getServletContext().getRealPath("/"); // 웹서비스
																			// root
																			// 경로
		//System.err.println("===>root_path" + root_path);

		String attach_path = "images\\";

		//System.err.println("===>attach_path" + attach_path);
		MultipartFile upload = fileBean.getUpload();
		String filename = "";
		String CKEditorFuncNum = "";
		String storedFileName = "";
		String rootPath = request.getContextPath();
		
		if (upload != null) {
			filename = upload.getOriginalFilename();
			fileBean.setFilename(filename);
			CKEditorFuncNum = fileBean.getCKEditorFuncNum();
			try {
				String originalFileExtension = filename.substring(filename.lastIndexOf("."));

                storedFileName = getRandomString() + originalFileExtension;
				
				File file = new File(root_path + attach_path + storedFileName);
				loger.info(root_path + attach_path + filename);
				upload.transferTo(file);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		String file_path = ".."+rootPath+"/" + "images/" + storedFileName; 
		
		ModelAndView mov = new ModelAndView("service/NewFile");
		mov.addObject("file_path", file_path);
		mov.addObject("CKEditorFuncNum", CKEditorFuncNum);

		return mov;
	}
}
