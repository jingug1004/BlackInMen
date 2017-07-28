package com.eagle.men_in_black.controller;

import java.io.FileNotFoundException;
import java.net.URISyntaxException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.eagle.men_in_black.model.MainDto;
import com.eagle.men_in_black.service.MainSvc;
import com.google.gson.Gson;

@Controller
public class MainController {
	//Logger loger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private MainSvc mainSvc;
	//@Autowired
	//private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	// 메인 화면 
	@RequestMapping("meninblack.mib")
	public ModelAndView meninblack(HttpServletRequest res){
				
		ModelAndView mav = new ModelAndView("main/Main");
		
		List<MainDto> subitemheader = mainSvc.do_select_subitemheader();
		res.getSession().setAttribute("subitemheader", subitemheader);
		
		
		List<MainDto> list = mainSvc.do_select_banner(); // 베너 이미지 
		List<MainDto> outerlist = mainSvc.do_select_bestItem("OUTER");
		List<MainDto> toplist = mainSvc.do_select_bestItem("TOP");
		List<MainDto> pantslist = mainSvc.do_select_bestItem("PANTS");
		
		mav.addObject("outerlist", outerlist);
		mav.addObject("toplist", toplist);
		mav.addObject("pantslist", pantslist);
		
		if(list.get(0).getBAN_SEQ()!=0){
		
		mav.addObject("list", list);
		}
		return mav;
		
	}
	
	// 로그인 모달 팝업 
	@RequestMapping("login.mib")
	public ModelAndView login(){
			
		ModelAndView mav = new ModelAndView("main/empty/modal/modladla/SignIn");
		
		
		return mav;
		
	}
	// 로그인입력후 전송 
	@RequestMapping("loginCheck.mib")
	public ModelAndView loginCheck(HttpServletRequest res, HttpServletResponse rep){
		
		String id = res.getParameter("id");
		//System.out.println("아이디 ================ " + id);
		String pwd = res.getParameter("pwd");
		//System.out.println("비밀번호 ================ " + pwd);
		
		MainDto dto =  mainSvc.do_search_pw(id);
		ModelAndView mav = new ModelAndView("main/Main");
		List<MainDto> list = mainSvc.do_select_banner();
		List<MainDto> outerlist = mainSvc.do_select_bestItem("OUTER");
		List<MainDto> toplist = mainSvc.do_select_bestItem("TOP");
		List<MainDto> pantslist = mainSvc.do_select_bestItem("PANTS");
		
		if(dto!=null){
			if(pwd.equals(dto.getUSER_PW())){
			//if(bcryptPasswordEncoder.matches(rawPassword, encodedPassword )){
			//if(bcryptPasswordEncoder.matches(pwd, dto.getUSER_PW() )){
				// 로그인 됬을 때 
				//System.out.println("계정정보 일치");
				
				res.getSession().setAttribute("LoginInfo", dto);
				mav.addObject("LoginInfo", "success");
				if(list.get(0).getBAN_SEQ()!=0){
					mav.addObject("list", list);
					
				}
				mav.addObject("outerlist", outerlist);
				mav.addObject("toplist", toplist);
				mav.addObject("pantslist", pantslist);
			}else{
				// 비밀번호 틀렸을 때 
				//System.out.println("계정정보 불일치");
				
				mav.addObject("LoginInfo", "NotPwd");
				if(list.get(0).getBAN_SEQ()!=0){
					mav.addObject("list", list);
					
				}
				mav.addObject("outerlist", outerlist);
				mav.addObject("toplist", toplist);
				mav.addObject("pantslist", pantslist);
			}
		}else{
			// 로그인 안됬을 때 
			
			if(list.get(0).getBAN_SEQ()!=0){
				mav.addObject("list", list);
				
			}
			mav.addObject("outerlist", outerlist);
			mav.addObject("toplist", toplist);
			mav.addObject("pantslist", pantslist);
			mav.addObject("LoginInfo", "NoMember");
		}
		
		return mav;		
	}
	
	// 로그아웃 
		@RequestMapping("logout.mib")
		public ModelAndView logout(HttpServletRequest res, HttpServletResponse rep){
									
			ModelAndView mav = new ModelAndView("main/Main");
			List<MainDto> list = mainSvc.do_select_banner();
					res.getSession().removeAttribute("LoginInfo");
					mav.addObject("LoginInfo", "logout");
					if(list.get(0).getBAN_SEQ()!=0){
						mav.addObject("list", list);
					}
					List<MainDto> outerlist = mainSvc.do_select_bestItem("OUTER");
					List<MainDto> toplist = mainSvc.do_select_bestItem("TOP");
					List<MainDto> pantslist = mainSvc.do_select_bestItem("PANTS");
					
					mav.addObject("outerlist", outerlist);
					mav.addObject("toplist", toplist);
					mav.addObject("pantslist", pantslist);
			return mav;		
		}
	//회원가입 팝업창 
	@RequestMapping("signup.mib")
	public ModelAndView signup(){
		
		ModelAndView mav = new ModelAndView("main/empty/modal/modladla/SignUp");
		
		
		return mav;
		
	}
	// 회원가입 페이지
	@RequestMapping("mib_SignUp.mib")
	public ModelAndView mib_SignUp(HttpServletRequest res, HttpServletResponse rep){
		
		ModelAndView mav = new ModelAndView("main/MIB_SignUp");
				
		String success = (res.getParameter("success")==null || res.getParameter("success")=="")?"fail":res.getParameter("success");
		String sign_email = (res.getParameter("sign_email")==null || res.getParameter("sign_email")=="")?"":res.getParameter("sign_email");
		
		HashMap<String, String> map = new HashMap<>();
		map.put("success", success);
		map.put("sign_email", sign_email);
				
		mav.addObject("map", map);
		
		return mav;
		
	}
	// 이메일 중복체크 아작스 부분 
	@RequestMapping(value="emailCheck.mib", method=RequestMethod.POST,produces = "application/json; charset=utf8")
	
	public @ResponseBody String emailCheck(HttpServletRequest res){
		Map<String, Object> resultMap = new HashMap<>();
		
		String email = (res.getParameter("email")==null || res.getParameter("email")=="")?"zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz":res.getParameter("email");
		
		MainDto dto = mainSvc.do_search_email(email);
		
		if(dto!=null){
			if(dto.getEMAIL().equals(email)){
				resultMap.put("check", "중복된 이메일입니다.");
				resultMap.put("success", "fail");
			}
		}else{
			resultMap.put("check", "사용가능한 이메일 입니다.");
			resultMap.put("success", "success");
		}
		
		Gson gson = new Gson();
		
		
		return gson.toJson(resultMap);
		
	}
	
	// 아이디 중복체크 아작스 부분 
	@RequestMapping(value="idCheck.mib", method=RequestMethod.POST,produces = "application/json; charset=utf8")
	
	public @ResponseBody String idCheck(HttpServletRequest res){
		Map<String, Object> resultMap = new HashMap<>();
		
		String id = res.getParameter("id");
		
		MainDto dto = mainSvc.do_search_pw(id);
		
		if(dto!=null){
			if(dto.getUSER_ID().equals(id)){
				resultMap.put("check", "중복된 아이디입니다.//"+dto.getEMAIL());
				resultMap.put("result", "NO");
			}
		}else{
			resultMap.put("check", "사용가능한 아이디 입니다. ");
			resultMap.put("result", "OK");
		}
		
		Gson gson = new Gson();
		
		
		return gson.toJson(resultMap);
		
	}
	
	
	
		//회원가입 완료 버튼 
	 @RequestMapping("compl.mib")
	 public ModelAndView completeJoin(HttpServletRequest res, HttpServletResponse rep){
		 ModelAndView mav = new ModelAndView();
		
			String sign_email    = (res.getParameter("sign_email")==null || res.getParameter("sign_email")=="")?"":res.getParameter("sign_email");
			String id            = (res.getParameter("id")==null || res.getParameter("id")=="")?"":res.getParameter("id");
			String name          = (res.getParameter("name")==null || res.getParameter("name")=="")?"":res.getParameter("name");
			String tel           = (res.getParameter("tel")==null || res.getParameter("tel")=="")?"":res.getParameter("tel");
			String birth         = (res.getParameter("birth")==null || res.getParameter("birth")=="")?"":res.getParameter("birth");
			String postcode      = (res.getParameter("postcode")==null || res.getParameter("postcode")=="")?"":res.getParameter("postcode");
			String password      = (res.getParameter("password")==null || res.getParameter("password")=="")?"":res.getParameter("password");
			//String encryptPassword = bcryptPasswordEncoder.encode(password);
			//loger.debug("============================");
			//loger.debug("encryptPassword="+encryptPassword);
			//loger.debug("============================");
			
			String jibunAddress  = (res.getParameter("jibunAddress")==null || res.getParameter("jibunAddress")=="")?"":res.getParameter("jibunAddress");
			String roadAddress   = (res.getParameter("roadAddress")==null || res.getParameter("roadAddress")=="")?"":res.getParameter("roadAddress");
			String detailAddress = (res.getParameter("detailAddress")==null || res.getParameter("detailAddress")=="")?"":res.getParameter("detailAddress");
			
			String fullAddress = jibunAddress+roadAddress+"";
			
			HashMap<String, String> map  = new HashMap<>();
			map.put("EMAIL", sign_email);
			map.put("ID", id);
			map.put("NAME", name);
			map.put("TEL", tel);
			map.put("BIRTH", birth);
			map.put("POSTCODE", postcode);
			map.put("PW", password);
			//map.put("PW", encryptPassword);
			map.put("ADDRESS", fullAddress);
			map.put("DETAILADDRESS", detailAddress);
		 
			mainSvc.do_join_MIB(map);
			mainSvc.do_insert_point(id);
			int insert =mainSvc.do_insert_coup(id);
			
			if(insert==0){
				mav.setViewName("main/MIB_SignUp");
				mav.addObject("insert", "noinsert");
			}else{
				mav.setViewName("redirect:meninblack.mib");
				
			}
			
			
		 
		 return mav;
	 }
	 
	//이메일 인증
	 @RequestMapping("mail.mib")
	 public ModelAndView send(HttpServletRequest res, HttpServletResponse rep){
	     
		 String email = res.getParameter("sign_email");
		 String signupdate = (String)res.getParameter("signupdate")==null?"":(String)res.getParameter("signupdate");
		 
		 String authNum = RandomNum();
		 
		 mainSvc.sendEmail(email, authNum);
		 System.out.println("모달컨트롤러"+email+authNum+signupdate);
		 ModelAndView mav = new ModelAndView("main/empty/modal/modladla/EmailCheck");
		 mav.addObject("randomNum", authNum);
		 mav.addObject("sign_email",email);
		 mav.addObject("signupdate",signupdate);
		 
	     return mav;
	        
	        
	    }
	 
	//랜덤번호 인증 번호 
	 public String RandomNum(){
		 StringBuffer buffer = new StringBuffer();
		 for(int i=0;i<=6; i++){
			 int n = (int)(Math.random()*10);
			 buffer.append(n);
		 }
		 return buffer.toString();
	 }


}
	
