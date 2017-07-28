package com.eagle.men_in_black.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.servlet.view.RedirectView;

import com.eagle.men_in_black.model.CeoMypageDto;
import com.eagle.men_in_black.model.DetailDto;
import com.eagle.men_in_black.model.FileModel;
import com.eagle.men_in_black.model.MainDto;
import com.eagle.men_in_black.model.UserMypageDto;
import com.eagle.men_in_black.service.CeoMypageSvc;
import com.eagle.men_in_black.service.DetailSvc;
import com.eagle.men_in_black.service.UserMypageSvc;
import com.google.gson.Gson;

@Controller
public class UserMypageController {
	Logger loger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private UserMypageSvc userMypageSvc;
	@Autowired
	private DetailSvc detailSvc;
	@Autowired
	private CeoMypageSvc ceoMypageSvc;
	// 마이페이지 메인
	@RequestMapping("mymain.mib")
	public ModelAndView mymain(HttpServletRequest res, HttpServletResponse rep) {

		MainDto userdto = (MainDto) res.getSession().getAttribute("LoginInfo");
		UserMypageDto mypageDto = userMypageSvc.do_search_point(userdto.getUSER_ID());
		List<UserMypageDto> coupon = userMypageSvc.do_search_coupon(userdto.getUSER_ID());
		/*List<UserMypageDto> buy = userMypageSvc.do_search_buy(userdto.getUSER_ID());*/
		List<UserMypageDto> qna = userMypageSvc.do_search_qna(userdto.getUSER_ID());
		List<UserMypageDto> basket = userMypageSvc.do_search_basket(userdto.getUSER_ID());
		List<UserMypageDto> point5 = userMypageSvc.do_search_point5(userdto.getUSER_ID());
		ModelAndView mav = new ModelAndView("mypage/usermypage/MypageMain");
		
		// 구매내역 5개 뽑기 
		List<UserMypageDto> buy = userMypageSvc.do_select_deldel(userdto.getUSER_ID());
		
		HashMap<String, String> prophomap = new HashMap<>();
		
		for(int i=0; i<buy.size();i++){
			String proseq = buy.get(i).getPRO_SEQ_st();
			String proarr[] = proseq.split(",");
			
			UserMypageDto ddto = userMypageSvc.do_select_propho(Integer.parseInt(proarr[0])); 
			prophomap.put("PRO_NAME"+i, ddto.getPRO_NAME());
			prophomap.put("STOREDNAME"+i, ddto.getSTORED_NAME());
			prophomap.put("count"+i, proarr.length+"");
			// 0번째가 list에서 첫번째 
		}
				
		
		
		mav.addObject("point", mypageDto);
		mav.addObject("coupon", coupon);
		mav.addObject("buy", buy);
		mav.addObject("prophomap",prophomap);
		mav.addObject("qna", qna);
		mav.addObject("basket", basket);
		mav.addObject("point5", point5);
		return mav;

	}

	// 회원정보수정
	@RequestMapping("userup.mib")
	public ModelAndView userupdate(HttpServletRequest res) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage/usermypage/Userupdate");
		String sign_email = (res.getParameter("sign_email") == null || res.getParameter("sign_email") == "") ? ""
				: res.getParameter("sign_email");
		String sign_email_b = (res.getParameter("sign_email-b") == null || res.getParameter("sign_email-b") == "") ? ""
				: res.getParameter("sign_email-b");
		String tel = (res.getParameter("tel") == null || res.getParameter("tel") == "") ? "" : res.getParameter("tel");
		String postcode = (res.getParameter("postcode") == null || res.getParameter("postcode") == "") ? ""
				: res.getParameter("postcode");
		String password = (res.getParameter("password") == null || res.getParameter("password") == "") ? ""
				: res.getParameter("password");
		String jibunAddress = (res.getParameter("jibunAddress") == null || res.getParameter("jibunAddress") == "") ? ""
				: res.getParameter("jibunAddress");
		String roadAddress = (res.getParameter("roadAddress") == null || res.getParameter("roadAddress") == "") ? ""
				: res.getParameter("roadAddress");
		String detailAddress = (res.getParameter("detailAddress") == null || res.getParameter("detailAddress") == "")
				? "" : res.getParameter("detailAddress");
		String id = (res.getParameter("id") == null || res.getParameter("id") == "") ? "" : res.getParameter("id");

		String fullAddress = jibunAddress + roadAddress + "";
		
		if(!sign_email_b.equals("")){
			sign_email = sign_email_b;
		}
		//System.out.println("sign_email" + sign_email);
		HashMap<String, String> map = new HashMap<>();
		map.put("EMAIL", sign_email);
		map.put("TEL", tel);
		map.put("POSTCODE", postcode);
		map.put("PW", password);
		map.put("ADDRESS", fullAddress);
		map.put("DETAILADDRESS", detailAddress);
		map.put("USER_ID", id);

		String upda = (res.getParameter("upda") == null || res.getParameter("upda") == "") ? ""
				: res.getParameter("upda");
		mav.addObject("upda", upda);
		mav.addObject("sign_email", sign_email);
		
		if (userMypageSvc.do_member_update(map) == 0) {
			if (!id.equals("")){
				mav.setViewName("mypage/usermypage/Userupdate");
				mav.addObject("updateResult", "NO");}
		} else {
		mav.setViewName("forward:meninblack.mib");
		res.getSession().removeAttribute("LoginInfo");
		mav.addObject("updateResult", "OK");
		mav.addObject("upda", "NO");
		}
		

		return mav;

	}

	// 회원정보수정 비밀번호 체크
	@RequestMapping(value = "pwdCheck.mib", method = RequestMethod.POST, produces = "application/json; charset=utf8")

	public @ResponseBody String emailCheck(HttpServletRequest res) {

		String pwd = res.getParameter("pwd");
		MainDto dto = (MainDto) res.getSession().getAttribute("LoginInfo");

		HashMap<String, String> map = new HashMap<>();

		if (pwd.equals(dto.getUSER_PW())) {

			map.put("success", "success");

		} else {
			map.put("check", "비밀번호가 틀렸습니다.");
			map.put("success", "fail");
		}

		Gson gson = new Gson();

		return gson.toJson(map);

	}

	// delstep수정
	@RequestMapping(value = "delstep.mib", method = RequestMethod.POST, produces = "application/json; charset=utf8")

	public @ResponseBody String delstep(HttpServletRequest res) {

		String DEL_SEQ = res.getParameter("DEL_SEQ");

		int delstep = 0;
		delstep = userMypageSvc.do_update_del_step(Integer.parseInt(DEL_SEQ));

		HashMap<String, String> map = new HashMap<>();

		if (delstep > 0) {

			map.put("success", "success");

		} else {
			map.put("success", "fail");
		}

		Gson gson = new Gson();

		return gson.toJson(map);

	}

	// 구매목록
	@RequestMapping("buylist.mib")
	public ModelAndView buylist(HttpServletRequest res, HttpServletResponse rep) {
		MainDto userdto = (MainDto) res.getSession().getAttribute("LoginInfo");

		String PAGE_NUM = (res.getParameter("PAGE_NUM") == null || res.getParameter("PAGE_NUM") == "") ? "1"
				: res.getParameter("PAGE_NUM");
		String PAGE_SIZE = (res.getParameter("PAGE_SIZE") == null || res.getParameter("PAGE_SIZE") == "") ? "10"
				: res.getParameter("PAGE_SIZE");
		String START_DATE = (res.getParameter("START_DATE") == null || res.getParameter("START_DATE") == "") ? "SYSDATE"
				: res.getParameter("START_DATE");
		String END_DATE = (res.getParameter("END_DATE") == null || res.getParameter("END_DATE") == "") ? "SYSDATE"
				: res.getParameter("END_DATE");

		HashMap<String, String> map = new HashMap<>();
		map.put("PAGE_SIZE", PAGE_SIZE);
		map.put("PAGE_NUM", PAGE_NUM);
		map.put("START_DATE", START_DATE);
		map.put("END_DATE", END_DATE);
		map.put("id", userdto.getUSER_ID());

		// userMypageSvc.do_update_del_step(DEL_SEQ);
		List<UserMypageDto> buyList = userMypageSvc.do_search_buylist(map);
		
		HashMap<String, String> prophomap = new HashMap<>();
		for(int i=0; i<buyList.size();i++){
			String proseq = buyList.get(i).getPRO_SEQ_st();
			String proarr[] = proseq.split(",");
			UserMypageDto ddto = userMypageSvc.do_search_buylist_photo(Integer.parseInt(proarr[0])); 
			prophomap.put("PRO_NAME"+i, ddto.getPRO_NAME());
			prophomap.put("STOREDNAME"+i, ddto.getSTORED_NAME());
			prophomap.put("count"+i, proarr.length+"");
			
		}
		
		

		ModelAndView mav = new ModelAndView("mypage/usermypage/Buylist");
		mav.addObject("prophomap",prophomap);
		mav.addObject("buyList", buyList);
		return mav;

	}

	// 구매목록 반품 교환 환불 목록
	@RequestMapping("buyCancel.mib")
	public ModelAndView buyCancel(HttpServletRequest res, HttpServletResponse rep) {
		String DEL_SEQ = res.getParameter("DEL_SEQ"); //너머오고잇음
		String pro_seq_st = res.getParameter("pro_seq_st");
		
		String proarr[] = pro_seq_st.split(",");
		
		//CeoMypageDto dto = ceoMypageSvc.do_select_cancle(Integer.parseInt(DEL_SEQ));
		
		List<CeoMypageDto> list = new ArrayList<>();
		
		for(int i=0; i<proarr.length;i++){
		HashMap<String, Object> map = new HashMap<>();
		map.put("PRO_SEQ", Integer.parseInt(proarr[i]));
		map.put("DEL_SEQ", Integer.parseInt(DEL_SEQ));
		
		list.add(ceoMypageSvc.do_select_maindetail(map));
		}
		
		ModelAndView mav = new ModelAndView("mypage/usermypage/review/write/buyCancel");
		mav.addObject("DEL_SEQ",DEL_SEQ);
		mav.addObject("list", list);
		
		//mav.addObject("dto",dto);
		
		
		return mav;
	}

	
	//리뷰 선택창
 // 사장 판매내역 상세보기
    @RequestMapping("buyreviewlist.mib")
    public ModelAndView ceoMypage_Maindetail(HttpServletRequest res, HttpServletResponse rep) {
    	ModelAndView mav = new ModelAndView("mypage/usermypage/review/write/reviewlist");
       
       String del_seq = res.getParameter("del_seq");
       String pro_seq_st = res.getParameter("pro_seq_st");
       String proarr[] = pro_seq_st.split(",");
       
       List<CeoMypageDto> list = new ArrayList<>();
       
       for(int i=0; i<proarr.length;i++){
       HashMap<String, Object> map = new HashMap<>();
       map.put("PRO_SEQ", Integer.parseInt(proarr[i]));
       map.put("DEL_SEQ", Integer.parseInt(del_seq));
       
       list.add(ceoMypageSvc.do_select_maindetail(map));
       }
       mav.addObject("list", list);
       return mav;
    }
	
	
	// 장바구니
	@RequestMapping("basketlist.mib")
	public ModelAndView basketlist(HttpServletRequest res, HttpServletResponse rep) {

		MainDto userdto = (MainDto) res.getSession().getAttribute("LoginInfo");
		List<UserMypageDto> basketlist = userMypageSvc.do_search_basketlist(userdto.getUSER_ID());
		ModelAndView mav = new ModelAndView("mypage/usermypage/Basketlist");
		mav.addObject("basketlist", basketlist);
		return mav;

	}

	// 장바구니 삭제
	@RequestMapping("basketdelete.mib")
	public ModelAndView basketdelete(HttpServletRequest res, HttpServletResponse rep) {

		String BAS_SEQ = res.getParameter("BAS_SEQ");

		String str[] = BAS_SEQ.split(",");
		List<Integer> list = new ArrayList<>();
		for (int i = 0; i < str.length; i++) {
			list.add(Integer.parseInt(str[i]));
		}

		userMypageSvc.do_delete_basketlist(list);

		MainDto userdto = (MainDto) res.getSession().getAttribute("LoginInfo");
		List<UserMypageDto> basketlist = userMypageSvc.do_search_basketlist(userdto.getUSER_ID());
		ModelAndView mav = new ModelAndView("mypage/usermypage/Basketlist");
		mav.addObject("basketlist", basketlist);
		return mav;

	}

	// 오늘본 상품
	@RequestMapping("todayGoods.mib")
	public ModelAndView todayGoods(HttpServletRequest res, HttpServletResponse rep) {

		String pro_seq = res.getParameter("pro_seq");
		if (pro_seq.equals("nocookie")) {
			List<UserMypageDto> goods = null;
			ModelAndView mav = new ModelAndView("mypage/usermypage/TodayGoods");
			mav.addObject("goodslist", goods);

			return mav;
		} else {
			HashMap<String, Object> param = new HashMap<String, Object>();
			List<String> list = Arrays.asList(pro_seq.split(","));
			param.put("list1", list);
			List<UserMypageDto> goods = userMypageSvc.do_search_goods(param);
			ModelAndView mav = new ModelAndView("mypage/usermypage/TodayGoods");
			mav.addObject("goodslist", goods);

			return mav;
		}
	}

	// 내가쓴 게시물 보기
	@RequestMapping("myboard.mib")
	public ModelAndView myboard(HttpServletRequest res, HttpServletResponse rep) {

		MainDto userdto = (MainDto) res.getSession().getAttribute("LoginInfo");
		List<UserMypageDto> qna = userMypageSvc.do_search_myboradqna(userdto.getUSER_ID());
		List<UserMypageDto> review = userMypageSvc.do_search_myboradreview(userdto.getUSER_ID());
		ModelAndView mav = new ModelAndView("mypage/usermypage/Myboard");
		mav.addObject("qna", qna);
		mav.addObject("review", review);
		return mav;

	}

	// 내가쓴 게시물 보기 Q&A
	@RequestMapping("myboardqna.mib")
	public ModelAndView myboardqna(HttpServletRequest res, HttpServletResponse rep) {
		MainDto userdto = (MainDto) res.getSession().getAttribute("LoginInfo");
		String PAGE_NUM = (res.getParameter("PAGE_NUM") == null || res.getParameter("PAGE_NUM") == "") ? "1"
				: res.getParameter("PAGE_NUM");
		String PAGE_SIZE = (res.getParameter("PAGE_SIZE") == null || res.getParameter("PAGE_SIZE") == "") ? "10"
				: res.getParameter("PAGE_SIZE");

		HashMap<String, String> map = new HashMap<>();
		map.put("PAGE_SIZE", PAGE_SIZE);
		map.put("PAGE_NUM", PAGE_NUM);
		map.put("id", userdto.getUSER_ID());

		List<UserMypageDto> qnaList = userMypageSvc.do_search_qnalist(map);
		ModelAndView mav = new ModelAndView("mypage/usermypage/Myboard_Q&A");
		mav.addObject("qnaList", qnaList);
		return mav;

	}

	// 내가쓴 게시물 보기 리뷰
	@RequestMapping("myboardreview.mib")
	public ModelAndView myboardreview(HttpServletRequest res, HttpServletResponse rep) {
		MainDto userdto = (MainDto) res.getSession().getAttribute("LoginInfo");
		String PAGE_NUM = (res.getParameter("PAGE_NUM") == null || res.getParameter("PAGE_NUM") == "") ? "1"
				: res.getParameter("PAGE_NUM");
		String PAGE_SIZE = (res.getParameter("PAGE_SIZE") == null || res.getParameter("PAGE_SIZE") == "") ? "10"
				: res.getParameter("PAGE_SIZE");

		HashMap<String, String> map = new HashMap<>();
		map.put("PAGE_SIZE", PAGE_SIZE);
		map.put("PAGE_NUM", PAGE_NUM);
		map.put("id", userdto.getUSER_ID());

		List<UserMypageDto> reviewlist = userMypageSvc.do_search_reviewlist(map);
		ModelAndView mav = new ModelAndView("mypage/usermypage/Myboard_Review");
		mav.addObject("reviewlist", reviewlist);
		return mav;

	}

	// 쿠폰 그리고 적립금
	@RequestMapping("coupon_Mileage.mib")
	public ModelAndView coupon_Mileage(HttpServletRequest res, HttpServletResponse rep) {
		MainDto userdto = (MainDto) res.getSession().getAttribute("LoginInfo");
		UserMypageDto mypageDto = userMypageSvc.do_search_point(userdto.getUSER_ID());
		String PAGE_NUM = (res.getParameter("PAGE_NUM") == null || res.getParameter("PAGE_NUM") == "") ? "1"
				: res.getParameter("PAGE_NUM");
		String PAGE_SIZE = (res.getParameter("PAGE_SIZE") == null || res.getParameter("PAGE_SIZE") == "") ? "8"
				: res.getParameter("PAGE_SIZE");

		String PAGE_NUMC = (res.getParameter("PAGE_NUMC") == null || res.getParameter("PAGE_NUMC") == "") ? "1"
				: res.getParameter("PAGE_NUMC");
		String PAGE_SIZEC = (res.getParameter("PAGE_SIZEC") == null || res.getParameter("PAGE_SIZEC") == "") ? "10"
				: res.getParameter("PAGE_SIZEC");

		HashMap<String, String> map = new HashMap<>();
		map.put("PAGE_SIZE", PAGE_SIZE);
		map.put("PAGE_NUM", PAGE_NUM);
		map.put("id", userdto.getUSER_ID());

		HashMap<String, String> mapc = new HashMap<>();
		mapc.put("PAGE_SIZEC", PAGE_SIZEC);
		mapc.put("PAGE_NUMC", PAGE_NUMC);
		mapc.put("id", userdto.getUSER_ID());

		List<UserMypageDto> couponList = userMypageSvc.do_search_couponlist(mapc);
		List<UserMypageDto> pointList = userMypageSvc.do_search_pointlist(map);
		ModelAndView mav = new ModelAndView("mypage/usermypage/Coupon_Mileage");
		mav.addObject("point", mypageDto);
		mav.addObject("couponList", couponList);
		mav.addObject("pointList", pointList);
		return mav;

	}

	// 리뷰 쓰기 창열기
	@RequestMapping("reveiwwrite.mib")
	public ModelAndView coupon_Administer(HttpServletRequest res, HttpServletResponse rep) {
		MainDto userdto = (MainDto) res.getSession().getAttribute("LoginInfo");
		ModelAndView mav = new ModelAndView("mypage/usermypage/review/write/ReviewWrite");
		mav.addObject("userdto", userdto);
		return mav;

	}

	// 파일 이름 중복 방지 메소드
	public static String getRandomString() {
		return UUID.randomUUID().toString().replaceAll("-", "");

	}

	// DB에 등록될 파일 메소드
	public HashMap<String, Object> parseInsertFileInfo(HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession();

		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;

		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();

		// 저장경로
		String root_path = session.getServletContext().getRealPath("/"); // 웹서비스
																			// root
																			// 경로
		String attach_path = "images\\";
		String filePath = root_path + attach_path;

		MultipartFile multipartFile = null;

		String originalFileName = null;

		String originalFileExtension = null;

		String storedFileName = null;

		HashMap<String, Object> listMap = null;

		File file = new File(filePath);
		// 폴더가없을경우 폴더생성
		if (file.exists() == false) {

			file.mkdirs();

		}

		while (iterator.hasNext()) {
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());

			if (multipartFile.isEmpty() == false) {
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				storedFileName = getRandomString() + originalFileExtension;

				// 첨부한 파일 생성
				file = new File(filePath + storedFileName);

				multipartFile.transferTo(file);
				listMap = new HashMap<String, Object>();
				listMap.put("ORIGINAL_FILE_NAME", originalFileName); // 원래 파일이름
				listMap.put("STORED_FILE_NAME", storedFileName); // 저장될 파일이름
				listMap.put("REV_SEQ", userMypageSvc.do_select_revseq());
			}

		}

		return listMap;

	}

	// 자식창
	@RequestMapping(value = "reviewWrite.mib", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public @ResponseBody String reviewWrite(MultipartHttpServletRequest res) throws Exception {
		MainDto userdto = (MainDto) res.getSession().getAttribute("LoginInfo");
		// form에서 넘어온 input
		String REV_TITLE = res.getParameter("title");
		String REV_CONTENT = res.getParameter("content");
		String SCORE = res.getParameter("score");
		String PRO_SEQ = res.getParameter("PRO_SEQ");
		String DEL_SEQ = res.getParameter("DEL_SEQ");

		// 이걸로먼저 review table에 인설트
		HashMap<String, String> remap = new HashMap<>();
		remap.put("REV_TITLE", REV_TITLE.trim());
		remap.put("REV_CONTENT", REV_CONTENT.trim());
		remap.put("SCORE", SCORE.trim());
		remap.put("PRO_SEQ", PRO_SEQ.trim());
		remap.put("USER_ID", userdto.getUSER_ID().trim());
		int rev = userMypageSvc.do_insert_review(remap);
		
		UserMypageDto dto =new UserMypageDto();
		
		HashMap<String, String> PRO_SEQ_stemap = new HashMap<>();
		PRO_SEQ_stemap.put("USER_ID", userdto.getUSER_ID().trim());
		PRO_SEQ_stemap.put("DEL_SEQ", DEL_SEQ.trim());
		
		
		
		dto = userMypageSvc.do_select_PRO_SEQ_st(PRO_SEQ_stemap);
		
		String proseq =dto.getREVIEW_SEQ();
		
		
			
			
			String updateseq = "";
			String st[]= proseq.split(",");
			//System.out.println("st[0] " + st[0]);
			//System.out.println("st[1] " + st[1]);
			for(int i=0;i<st.length;i++){
				if(Integer.parseInt(PRO_SEQ.trim())!= Integer.parseInt(st[i].trim())){
					updateseq += st[i].trim();
				}
			}
	
			
		
		
		
		UserMypageDto dto1 =new UserMypageDto();
		dto1.setDEL_SEQ(Integer.parseInt(DEL_SEQ));
		dto1.setREVIEW_SEQ(updateseq.trim());
		
		
		
		
		HashMap<String, String> resultMap = new HashMap<>();
		if (rev > 0) {
			// 사진 파일 부분

			Iterator<String> iterator = res.getFileNames();

			// 저장경로
			HttpSession session = res.getSession();
			String root_path = session.getServletContext().getRealPath("/"); // 웹서비스
																				// root
			String attach_path = "images\\";
			String filePath = root_path + attach_path;
			MultipartFile multipartFile = null;

			String originalFileName = null;
			String originalFileExtension = null;
			String storedFileName = null;
			HashMap<String, Object> listMap = null;

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
					listMap = new HashMap<String, Object>();
					listMap.put("ORIGINAL_FILE_NAME", originalFileName); // 원래
					listMap.put("STORED_FILE_NAME", storedFileName); // 저장될 파일이름
					listMap.put("REV_SEQ", userMypageSvc.do_select_revseq());
				}
			}

			int revp = userMypageSvc.do_insert_reviewphoto(listMap);
			// 딜리버리 배송상태를 리뷰작성완료
			int delstep = 0;

			if (revp > 0) {
				resultMap.put("result", "OK");
				resultMap.put("st", updateseq);
				//
				
				userMypageSvc.do_update_REVIEW_SEQ(dto1);

			}
		}

		// 적립금 지급
		HashMap<String, Object> pointmap = new HashMap<>();
		pointmap.put("PRO_SEQ", Integer.parseInt(PRO_SEQ.trim()));
		pointmap.put("USER_ID", userdto.getUSER_ID());
		pointmap.put("DEL_SEQ", Integer.parseInt(DEL_SEQ.trim()));
		userMypageSvc.do_insert_point(pointmap);
		
		if(updateseq.equals("")){
			userMypageSvc.do_update_del_step2(Integer.parseInt(DEL_SEQ));
			
		}
		
		Gson gson = new Gson();

		return gson.toJson(resultMap);

	}

	// 구매목록 반품 교환 환불
	@RequestMapping(value = "cancel.mib", method = RequestMethod.POST, produces = "application/json; charset=utf8")

	public @ResponseBody String cancel(HttpServletRequest res, HttpServletResponse rep) {
		HashMap<String, String> resultMap = new HashMap<>();
		HashMap<String, Object> update = new HashMap<String, Object>();
		String DEL_SEQ = res.getParameter("DEL_SEQ");
		String commend = res.getParameter("commend");
		String RE_REASON = "";
		String CA_ACCOUNT = "";
		String RE_OPTION = "";

		if (commend.equals("반품")) {
			RE_REASON = res.getParameter("RE_REASON");
			CA_ACCOUNT = res.getParameter("CA_ACCOUNT");

		} else if (commend.equals("교환")) {
			RE_OPTION = res.getParameter("RE_OPTION");
			RE_REASON = res.getParameter("RE_REASON");

		}else{
			
		}

		update.put("RETURN", commend);
		update.put("RE_OPTION", RE_OPTION);
		update.put("RE_REASON", RE_REASON);
		update.put("CA_ACCOUNT", CA_ACCOUNT);
		update.put("DEL_SEQ", DEL_SEQ);

		int suc = userMypageSvc.do_update_cancel(update);
		if (suc > 0) {

			resultMap.put("result", "success");
			
		}
		Gson gson = new Gson();
		return gson.toJson(resultMap);

	};

	// 리뷰수정
	@RequestMapping("reviewupdate.mib")
	public ModelAndView reviewupdate(HttpServletRequest res, HttpServletResponse rep) {
		MainDto userdto = (MainDto) res.getSession().getAttribute("LoginInfo");
		int REV_SEQ = Integer.parseInt(res.getParameter("REV_SEQ"));

		DetailDto detaildto = userMypageSvc.do_select_review(REV_SEQ);

		ModelAndView mav = new ModelAndView("mypage/usermypage/review/write/ReviewUpdate");
		mav.addObject("detaildto", detaildto);
		mav.addObject("userdto", userdto);

		return mav;

	}

	// 리뷰 삭제
	@RequestMapping(value = "reviewDel.mib", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public @ResponseBody String reviewDel(HttpServletRequest res, HttpServletResponse rep) {
		HashMap<String, String> resultMap = new HashMap<>();
		String REV_SEQ = res.getParameter("REV_SEQ");
		int delreview = userMypageSvc.do_delete_reviewList(REV_SEQ);
		int delphoto = userMypageSvc.do_delete_reviewPhoto(REV_SEQ);

		resultMap.put("result", "success");

		Gson gson = new Gson();
		return gson.toJson(resultMap);
	}

	// 리뷰수정후
	@RequestMapping("reviewUpdate.mib")
	public @ResponseBody String reviewUpdate(MultipartHttpServletRequest res) throws Exception {

		MainDto userdto = (MainDto) res.getSession().getAttribute("LoginInfo");
		// form에서 넘어온 input
		String REV_TITLE = res.getParameter("title");
		String REV_CONTENT = res.getParameter("content");
		String SCORE = res.getParameter("score");
		String REV_SEQ = res.getParameter("REV_SEQ");

		// 이걸로먼저 review table에 인설트
		HashMap<String, Object> remap = new HashMap<>();
		remap.put("REV_TITLE", REV_TITLE);
		remap.put("REV_CONTENT", REV_CONTENT);
		remap.put("SCORE", Integer.parseInt(SCORE));
		remap.put("REV_SEQ", Integer.parseInt(REV_SEQ));
		int rev = userMypageSvc.do_update_review(remap);

		HashMap<String, String> resultMap = new HashMap<>();
		if (rev > 0) {
			// 사진 파일 부분

			Iterator<String> iterator = res.getFileNames();

			// 저장경로
			HttpSession session = res.getSession();
			String root_path = session.getServletContext().getRealPath("/"); // 웹서비스
																				// root
																				// 경로
			String attach_path = "images\\";
			String filePath = root_path + attach_path;

			MultipartFile multipartFile = null;
			String originalFileName = null;
			String originalFileExtension = null;
			String storedFileName = null;
			HashMap<String, Object> listMap = null;
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
					listMap = new HashMap<String, Object>();
					listMap.put("ORIGINAL_FILE_NAME", originalFileName); // 원래
					listMap.put("STORED_FILE_NAME", storedFileName); // 저장될 파일이름
					listMap.put("REV_SEQ", Integer.parseInt(REV_SEQ));
					userMypageSvc.do_update_reviewphoto(listMap);
				}
			}

			if (rev > 0) {
				resultMap.put("result", "OK");

			} else {
				resultMap.put("result", "NO");
			}
		}

		Gson gson = new Gson();
		return gson.toJson(resultMap);

	}

	@RequestMapping("qnadetail.mib")
	public ModelAndView qnadetail(HttpServletRequest res, HttpServletResponse rep) {
		String QNA_SEQ = res.getParameter("QNA_SEQ");
		UserMypageDto qnaDto = (UserMypageDto) userMypageSvc.do_search_qnadetail(QNA_SEQ);
		ModelAndView mav = new ModelAndView("category/tiles/detail/pop/Q&ADetail");
		mav.addObject("qnaDto", qnaDto);
		return mav;

	}

	@RequestMapping("qnaup.mib")
	public ModelAndView qnaup(HttpServletRequest res, HttpServletResponse rep) {
		String QNA_SEQ = res.getParameter("QNA_SEQ");
		UserMypageDto qnaDto = (UserMypageDto) userMypageSvc.do_search_qnadetail(QNA_SEQ);
		ModelAndView mav = new ModelAndView("category/tiles/detail/pop/Q&AUpdate");
		mav.addObject("qnaDto", qnaDto);
		return mav;

	}

	// 구매목록 반품 교환 환불
	@RequestMapping(value = "qnaupdate.mib", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public @ResponseBody String qnaupdate(HttpServletRequest res, HttpServletResponse rep) {

		HashMap<String, String> resultMap = new HashMap<>();
		HashMap<String, Object> update = new HashMap<String, Object>();
		String QNA_SEQ = res.getParameter("QNA_SEQ");
		String QNA_OPEN = res.getParameter("secret");
		String QNA_TYPE = res.getParameter("secretz");
		String QNA_TITLE = res.getParameter("title");
		String QNA_CONTENT = res.getParameter("QNA_CONTENT");
		update.put("QNA_SEQ", Integer.parseInt(QNA_SEQ));
		update.put("QNA_OPEN", QNA_OPEN);
		update.put("CA_REASON", QNA_TYPE);
		update.put("QNA_TITLE", QNA_TITLE);
		update.put("QNA_CONTENT", QNA_CONTENT);
		int suc = userMypageSvc.do_update_qna(update);
		if (suc > 0) {
			resultMap.put("result", "success");
		}
		Gson gson = new Gson();
		return gson.toJson(resultMap);

	};

	@RequestMapping("qnarep.mib")
	public ModelAndView qnareply(HttpServletRequest res, HttpServletResponse rep) {
		String QNA_SEQ = res.getParameter("QNA_SEQ");
		UserMypageDto qnaDto = (UserMypageDto) userMypageSvc.do_search_qnadetail(QNA_SEQ);
		ModelAndView mav = new ModelAndView("category/tiles/detail/pop/Q&AReply");
		mav.addObject("qnaDto", qnaDto);
		return mav;

	}

	// qna 답글
	@RequestMapping(value = "qnareps.mib", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public @ResponseBody String qnareps(HttpServletRequest res, HttpServletResponse rep) {

		HashMap<String, String> resultMap = new HashMap<>();
		HashMap<String, Object> update = new HashMap<String, Object>();
		String QNA_OPEN = res.getParameter("secret");
		String QNA_TYPE = res.getParameter("secretz");
		String QNA_TITLE = res.getParameter("title");
		String QNA_CONTENT = res.getParameter("QNA_CONTENT");
		String PRO_SEQ = res.getParameter("PRO_SEQ");
		String USER_ID = res.getParameter("USER_ID");
		String QNA_REF = res.getParameter("QNA_REF");
		update.put("PRO_SEQ", Integer.parseInt(PRO_SEQ));
		update.put("QNA_OPEN", QNA_OPEN);
		update.put("QNA_TYPE", QNA_TYPE);
		update.put("QNA_TITLE", QNA_TITLE);
		update.put("QNA_CONTENT", QNA_CONTENT);
		update.put("USER_ID", USER_ID);
		update.put("QNA_REF", Integer.parseInt(QNA_REF));
		int suc = userMypageSvc.do_insert_qnareply(update);
		if (suc > 0) {
			resultMap.put("result", "success");
			userMypageSvc.do_update_qnastep(Integer.parseInt(QNA_REF));
		}
		Gson gson = new Gson();
		return gson.toJson(resultMap);

	};

	// qna 답글
	@RequestMapping(value = "qnaWrite.mib", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public @ResponseBody String qnaWrite(HttpServletRequest res, HttpServletResponse rep) {

		HashMap<String, String> resultMap = new HashMap<>();
		HashMap<String, Object> update = new HashMap<String, Object>();

		String QNA_OPEN = res.getParameter("secret");
		String QNA_TYPE = res.getParameter("secretz");
		String QNA_TITLE = res.getParameter("title");
		String QNA_CONTENT = res.getParameter("QNA_CONTENT");
		String PRO_SEQ = res.getParameter("PRO_SEQ");
		String USER_ID = res.getParameter("USER_ID");
		update.put("PRO_SEQ", Integer.parseInt(PRO_SEQ));
		update.put("QNA_OPEN", QNA_OPEN);
		update.put("QNA_TYPE", QNA_TYPE);
		update.put("QNA_TITLE", QNA_TITLE);
		update.put("QNA_CONTENT", QNA_CONTENT);
		update.put("USER_ID", USER_ID);
		int suc = userMypageSvc.do_insert_qna(update);
		if (suc > 0) {
			resultMap.put("result", "success");
		}
		Gson gson = new Gson();
		return gson.toJson(resultMap);

	};

	// qna 삭제
	@RequestMapping(value = "qnadelete.mib", method = RequestMethod.POST, produces = "application/json; charset=utf8")
	public @ResponseBody String qnaDelete(HttpServletRequest res, HttpServletResponse rep) {
		HashMap<String, String> resultMap = new HashMap<>();
		String QNA_SEQ = res.getParameter("QNA_SEQ");
		System.out.println(QNA_SEQ);
		int delreview = userMypageSvc.do_delete_qna(Integer.parseInt(QNA_SEQ));
		if (delreview > 0) {
			resultMap.put("result", "success");
		}
		Gson gson = new Gson();
		return gson.toJson(resultMap);
	}
	
	// 사장 판매내역 상세보기
    @RequestMapping("buydetlist.mib")
    public ModelAndView UserMypage_Maindetail(HttpServletRequest res, HttpServletResponse rep) {
    	ModelAndView mav = new ModelAndView("mypage/usermypage/review/write/BuyDetList");
		String DEL_SEQ = res.getParameter("DEL_SEQ"); //너머오고잇음
		String pro_seq_st = res.getParameter("pro_seq_st");

       String proarr[] = pro_seq_st.split(",");
       
       List<CeoMypageDto> list = new ArrayList<>();
       
       for(int i=0; i<proarr.length;i++){
       HashMap<String, Object> map = new HashMap<>();
       map.put("PRO_SEQ", Integer.parseInt(proarr[i]));
       map.put("DEL_SEQ", Integer.parseInt(DEL_SEQ));
       
       list.add(ceoMypageSvc.do_select_maindetail(map));
       }
       mav.addObject("list", list);
       return mav;
    }

}