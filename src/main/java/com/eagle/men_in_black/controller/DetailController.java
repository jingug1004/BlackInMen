package com.eagle.men_in_black.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.eagle.men_in_black.model.DetailDto;
import com.eagle.men_in_black.model.MainDto;
import com.eagle.men_in_black.model.UserMypageDto;
import com.eagle.men_in_black.service.DetailSvc;
import com.eagle.men_in_black.service.UserMypageSvc;
import com.google.gson.Gson;

@Controller
public class DetailController {
	Logger loger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private DetailSvc detailSvc;
	
	@Autowired
	private UserMypageSvc userMypageSvc;
	
	@RequestMapping("detail.mib")
	public ModelAndView detail(HttpServletRequest res,HttpServletResponse rep){
		ModelAndView mav = new ModelAndView("category/tiles/detail/Detail");

		int PRO_SEQ = Integer.parseInt(res.getParameter("PRO_SEQ"));

		List<DetailDto> list = detailSvc.do_selectProductDetail(PRO_SEQ);
		List<DetailDto> listColor = detailSvc.do_selectProductColor(PRO_SEQ);
		List<DetailDto> listSize = detailSvc.do_selectProductSize(PRO_SEQ);
		mav.addObject("list", list);
		mav.addObject("listColor", listColor);
		mav.addObject("listSize", listSize);
		
		return mav;
	}

	@RequestMapping("review.mib")
	public ModelAndView review(HttpServletRequest res, HttpServletResponse rep) {
		ModelAndView mav = new ModelAndView("category/tiles/detail/pop/Review");
		
		int REV_SEQ = Integer.parseInt(res.getParameter("REV_SEQ"));
		
		DetailDto detaildto = detailSvc.do_selectReviewDetail(REV_SEQ);
		mav.addObject("detaildto", detaildto);

		return mav;
	}
	
	@RequestMapping("reviewReply.mib")
	public ModelAndView reviewReply(HttpServletRequest res, HttpServletResponse rep) {
		ModelAndView mav = new ModelAndView("category/tiles/detail/pop/ReviewReply");
		
		int REV_SEQ = Integer.parseInt(res.getParameter("REV_SEQ"));
		
		DetailDto detaildto = detailSvc.do_selectReviewDetail(REV_SEQ);
		mav.addObject("detailDto", detaildto);

		return mav;
	}
	
	@RequestMapping("QnADetail.mib")
	public ModelAndView QnADetail(HttpServletRequest res, HttpServletResponse rep) {
		ModelAndView mav = new ModelAndView("category/tiles/detail/pop/Q&ADetail");
		
		int QNA_SEQ = Integer.parseInt(res.getParameter("QNA_SEQ"));

		return mav;
	}
	
	@RequestMapping("QnAWrite.mib")
	public ModelAndView QnAWrite() {

		ModelAndView mav = new ModelAndView("category/tiles/detail/pop/Q&AWrite");
		mav.addObject("msg", "김옥지");

		return mav;
	}
	
	@RequestMapping("BuyPop.mib")
	public ModelAndView BuyPop(HttpServletRequest res, HttpServletResponse rep) {
		ModelAndView mav = new ModelAndView("category/tiles/detail/pop/BuyPop");
		
		int PRO_SEQ = Integer.parseInt((res.getParameter("PRO_SEQ")==null || res.getParameter("PRO_SEQ")=="")?"":res.getParameter("PRO_SEQ"));
		
		List<DetailDto> list = detailSvc.do_buyProductPop(PRO_SEQ);
		List<DetailDto> listColor = detailSvc.do_buyProductColorPop(PRO_SEQ);
		mav.addObject("PRO_SEQ", PRO_SEQ);
		mav.addObject("list", list);
		mav.addObject("listColor", listColor);
		
		return mav;
	}
	
	// 구매팝업 칼라로 인한 사이즈 셀렉트 리스트
	@RequestMapping(value="selectSize.mib", method=RequestMethod.POST,produces = "application/json; charset=utf8")
	public @ResponseBody String selectSize(HttpServletRequest res, HttpServletResponse rep){
		
		int PRO_SEQ = Integer.parseInt((res.getParameter("PRO_SEQ")==null||res.getParameter("PRO_SEQ")=="")?"":res.getParameter("PRO_SEQ"));
		String COLOR = (res.getParameter("COLOR")==null || res.getParameter("COLOR")=="")?"":res.getParameter("COLOR");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("PRO_SEQ",PRO_SEQ);
		map.put("COLOR",COLOR);
		
		List<DetailDto> list = detailSvc.do_buyProductSizePop(map);
		
		Gson gson = new Gson();
		return gson.toJson(list);
	}
	
	// 구매팝업 칼라로 인한 사이즈 셀렉트 리스트
	@RequestMapping(value="stockLimit.mib", method=RequestMethod.POST,produces = "application/json; charset=utf8")
	public @ResponseBody String stockLimit(HttpServletRequest res, HttpServletResponse rep){
		
		int PRO_SEQ = Integer.parseInt((res.getParameter("PRO_SEQ")==null||res.getParameter("PRO_SEQ")=="")?"":res.getParameter("PRO_SEQ"));
		String COLOR = (res.getParameter("COLOR")==null || res.getParameter("COLOR")=="")?"":res.getParameter("COLOR");
		String PRO_SIZE = (res.getParameter("PRO_SIZE")==null || res.getParameter("PRO_SIZE")=="")?"":res.getParameter("PRO_SIZE");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("PRO_SEQ",PRO_SEQ);
		map.put("COLOR",COLOR);
		map.put("PRO_SIZE",PRO_SIZE);
		
		String result = detailSvc.do_buyProductStockPop(map);
		
		Gson gson = new Gson();
		return gson.toJson(result);
	}
	
	//장바구니 등록 아작스
	@RequestMapping(value="BuyPopAjax.mib", method=RequestMethod.POST,produces = "application/json; charset=utf8")
	public @ResponseBody String AddBasket(HttpServletRequest res) throws Exception{
		MainDto userdto = (MainDto)res.getSession().getAttribute("LoginInfo");
		// form에서 넘어온 input
		int PRO_SEQ = Integer.parseInt((res.getParameter("PRO_SEQ")==null || res.getParameter("PRO_SEQ")=="")?"":res.getParameter("PRO_SEQ"));
		String PRO_SIZE = (res.getParameter("PRO_SIZE")==null || res.getParameter("PRO_SIZE")=="")?"":res.getParameter("PRO_SIZE");
		String COLOR = (res.getParameter("COLOR")==null || res.getParameter("COLOR")=="")?"":res.getParameter("COLOR");
		int BAS_PRO_NUM = Integer.parseInt((res.getParameter("BAS_PRO_NUM")==null || res.getParameter("BAS_PRO_NUM")=="")?"":res.getParameter("BAS_PRO_NUM"));

		// 이걸로먼저 review table에 인설트
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("PRO_SEQ", PRO_SEQ);
		map.put("USER_ID", userdto.getUSER_ID());
		map.put("PRO_SIZE", PRO_SIZE);
		map.put("COLOR", COLOR);
		map.put("BAS_PRO_NUM", BAS_PRO_NUM);
		
		int result = detailSvc.do_addBasket(map);
		
		Gson gson = new Gson();
		
		return gson.toJson(result);
	}
	
	//관리자 리뷰 답글 아작스
	@RequestMapping(value="ReviewReplyAjax.mib", method=RequestMethod.POST,produces = "application/json; charset=utf8")
	public @ResponseBody String ReviewReplyAjax(HttpServletRequest res) throws Exception{
		MainDto userdto = (MainDto)res.getSession().getAttribute("LoginInfo");
		// form에서 넘어온 input
		int PRO_SEQ = Integer.parseInt((res.getParameter("PRO_SEQ")==null || res.getParameter("PRO_SEQ")=="")?"":res.getParameter("PRO_SEQ"));
		String REV_TITLE = (res.getParameter("REV_TITLE")==null || res.getParameter("REV_TITLE")=="")?"":res.getParameter("REV_TITLE");
		String REV_CONTENT = (res.getParameter("REV_CONTENT")==null || res.getParameter("REV_CONTENT")=="")?"":res.getParameter("REV_CONTENT");
		int REV_REF = Integer.parseInt((res.getParameter("REV_REF")==null || res.getParameter("REV_REF")=="")?"":res.getParameter("REV_REF"));
		
		// 이걸로먼저 review table에 인설트
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("PRO_SEQ", PRO_SEQ);
		map.put("USER_ID", userdto.getUSER_ID());
		map.put("REV_TITLE", REV_TITLE);
		map.put("REV_CONTENT", REV_CONTENT);
		map.put("REV_REF", REV_REF);
		
		int result = detailSvc.do_insertReviewAdmReply(map);
		int step = 0;
		if(result>0){
			step = detailSvc.do_updateReviewFlag(REV_REF);
		}
		Gson gson = new Gson();
		
		return gson.toJson(step);
	}
	
	//리뷰리스트아작스
	@RequestMapping(value="ReviewListAjax.mib", method=RequestMethod.POST, produces = "application/json; charset=utf8")
	public @ResponseBody String ReviewListAjax(HttpServletRequest res) throws Exception{
		// form에서 넘어온 input
		int PRO_SEQ = Integer.parseInt((res.getParameter("PRO_SEQ")==null || res.getParameter("PRO_SEQ")=="")?"":res.getParameter("PRO_SEQ"));
		int PAGE_NUM = Integer.parseInt((res.getParameter("PAGE_NUM")==null||res.getParameter("PAGE_NUM").equals("") )?"1":res.getParameter("PAGE_NUM"));
		String PAGE_SIZE = (res.getParameter("PAGE_SIZE")==null||res.getParameter("PAGE_SIZE").equals("") )?"15":res.getParameter("PAGE_SIZE");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("PRO_SEQ", PRO_SEQ);
		map.put("PAGE_NUM", PAGE_NUM);
		map.put("PAGE_SIZE", PAGE_SIZE);
		
		List<DetailDto> reviewList = detailSvc.do_selectProductReviewList(map);
		
		Gson gson = new Gson();
		
		return gson.toJson(reviewList);
	}
	
	//QnA리스트아작스
	@RequestMapping(value="QnAListAjax.mib", method=RequestMethod.POST,produces = "application/json; charset=utf8")
	public @ResponseBody String QnAListAjax(HttpServletRequest res) throws Exception{
		// form에서 넘어온 input
		int PRO_SEQ = Integer.parseInt((res.getParameter("PRO_SEQ")==null || res.getParameter("PRO_SEQ")=="")?"":res.getParameter("PRO_SEQ"));
		int PAGE_NUM = Integer.parseInt((res.getParameter("PAGE_NUM")==null||res.getParameter("PAGE_NUM").equals("") )?"1":res.getParameter("PAGE_NUM"));
		String PAGE_SIZE = (res.getParameter("PAGE_SIZE")==null||res.getParameter("PAGE_SIZE").equals("") )?"15":res.getParameter("PAGE_SIZE");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("PRO_SEQ", PRO_SEQ);
		map.put("PAGE_NUM", PAGE_NUM);
		map.put("PAGE_SIZE", PAGE_SIZE);
		
		List<DetailDto> QnAList = detailSvc.do_selectProductQnAList(map);
		
		Gson gson = new Gson();
		
		return gson.toJson(QnAList);
	}
	
	@RequestMapping("Detail_Buy_Info.mib")
	public ModelAndView Detail_Buy_Info(HttpServletRequest res, HttpServletResponse rep) {
		ModelAndView mav = new ModelAndView("category/Detail_Buy_Info");
		
		MainDto userdto = (MainDto)res.getSession().getAttribute("LoginInfo");
		int FINAL_PRICE = Integer.parseInt(res.getParameter("FINAL_PRICE"));
		
		String BAS_SEQ = (String)res.getParameter("BAS_SEQ");
		String str[] = BAS_SEQ.split(",");
		List<Integer> list= new ArrayList<>();
		for(int i=0; i<str.length; i++){
			list.add(Integer.parseInt(str[i]));
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> coupon_map = new HashMap<String, Object>();
		map.put("USER_ID", userdto.getUSER_ID());
		map.put("list", list);
		coupon_map.put("USER_ID", userdto.getUSER_ID());
		coupon_map.put("FINAL_PRICE", FINAL_PRICE);
		
		List<DetailDto> basketList = detailSvc.do_selectFinalBuy(map);
		List<DetailDto> couponList = detailSvc.do_selectCouponList(coupon_map);
		int points = detailSvc.do_selectPointsList(userdto.getUSER_ID());
		mav.addObject("basketList", basketList);
		mav.addObject("couponList", couponList);
		mav.addObject("points", points);

		return mav;
	}
	
	@RequestMapping("buymymain.mib")
	public ModelAndView buymymain(HttpServletRequest res, HttpServletResponse rep){
		MainDto userdto = (MainDto)res.getSession().getAttribute("LoginInfo");
		
		int DEL_PRICE = Integer.parseInt((res.getParameter("DEL_PRICE")==null||res.getParameter("DEL_PRICE").equals("") )?"2500":res.getParameter("DEL_PRICE"));
		String DEL_ADDRESS = (res.getParameter("receiveAddress_1")==null||res.getParameter("receiveAddress_1").equals("") )?"error":res.getParameter("receiveAddress_1");
		String DEL_POSTCODE = (res.getParameter("receiveNum")==null||res.getParameter("receiveNum").equals("") )?"error":res.getParameter("receiveNum");
		String REC_NAME = (res.getParameter("receiveName")==null||res.getParameter("receiveName").equals("") )?"error":res.getParameter("receiveName");
		String REC_TEL = (res.getParameter("receivePhone")==null||res.getParameter("receivePhone").equals("") )?"error":res.getParameter("receivePhone");
		String DEL_DETAIL_ADDRESS = (res.getParameter("receiveAddress_2")==null||res.getParameter("receiveAddress_2").equals("") )?"error":res.getParameter("receiveAddress_2");
		int basketListSize = Integer.parseInt((res.getParameter("basketListSize")==null||res.getParameter("basketListSize").equals("") )?"0":res.getParameter("basketListSize"));
		
		int FINAL_PRICE = Integer.parseInt((res.getParameter("FINAL_PRICE")==null||res.getParameter("FINAL_PRICE").equals("") )?"0":res.getParameter("FINAL_PRICE"));
		int COUPON = Integer.parseInt((res.getParameter("COUPON")==null||res.getParameter("COUPON").equals("no")||res.getParameter("COUPON").equals("") )?"0":res.getParameter("COUPON"));
		int POINT = Integer.parseInt((res.getParameter("POINT")==null||res.getParameter("POINT").equals("") )?"0":res.getParameter("POINT"));
		
		int COUP_SEQ = Integer.parseInt((res.getParameter("COUP_SEQ")==null||res.getParameter("COUP_SEQ").equals("undefined")||res.getParameter("COUP_SEQ").equals("") )?"0":res.getParameter("COUP_SEQ"));
		List<Integer> BAS_SEQList = new ArrayList<>();
		List<DetailDto> basketInfoList = new ArrayList<>();
		
		String pro_seq_group = "";
		for(int i=0;i<basketListSize;i++){
			BAS_SEQList.add(Integer.parseInt(res.getParameter("BAS_SEQ"+i)));
			basketInfoList.add(detailSvc.do_selectBasketInfo(BAS_SEQList.get(i)));
			
			if(i==(basketListSize-1)){
				pro_seq_group += basketInfoList.get(i).getPRO_SEQ();
			}else{
				pro_seq_group += basketInfoList.get(i).getPRO_SEQ()+",";
			}
		}
		//System.out.println("pro_seq_group=="+pro_seq_group);
		
		// 딜리버리 테이블 인설트
		HashMap<String, Object> deliveryMap = new HashMap<>();
		
		deliveryMap.put("DEL_PRICE", DEL_PRICE);
		deliveryMap.put("DEL_ADDRESS", DEL_ADDRESS);
		deliveryMap.put("DEL_POSTCODE", DEL_POSTCODE);
		deliveryMap.put("REC_NAME", REC_NAME);
		deliveryMap.put("REC_TEL", REC_TEL);
		deliveryMap.put("DEL_DETAIL_ADDRESS", DEL_DETAIL_ADDRESS);
		deliveryMap.put("USER_ID", userdto.getUSER_ID());
		deliveryMap.put("PRO_SEQ", pro_seq_group);
		deliveryMap.put("COUPON", COUPON);
		deliveryMap.put("POINT", POINT);
		deliveryMap.put("COUP_SEQ", COUP_SEQ);
		deliveryMap.put("FINAL_PRICE", FINAL_PRICE);
		
		int deliveryFlag = detailSvc.do_insertBuyDel(deliveryMap);
		
		int DEL_SEQ = detailSvc.do_selectBuyDEL_SEQ();
		
		for(int i=0;i<basketListSize;i++){
			BAS_SEQList.add(Integer.parseInt(res.getParameter("BAS_SEQ"+i)));
			basketInfoList.add(detailSvc.do_selectBasketInfo(BAS_SEQList.get(i)));
			
			HashMap<String, Object> salesMap = new HashMap<>();
			
			
			salesMap.put("PRO_SEQ", basketInfoList.get(i).getPRO_SEQ());
			salesMap.put("USER_ID", userdto.getUSER_ID());
			salesMap.put("DEL_SEQ", DEL_SEQ);
			salesMap.put("SEL_SIZE", basketInfoList.get(i).getPRO_SIZE());
			salesMap.put("SEL_COLOR", basketInfoList.get(i).getCOLOR());
			salesMap.put("SEL_NUM", basketInfoList.get(i).getBAS_PRO_NUM());
			int salesFlag = detailSvc.do_insertBuySales(salesMap);
			
			int basketDeleteFlag = detailSvc.do_deleteBuyBasket(BAS_SEQList.get(i));
		}
		if(COUP_SEQ!=0){
			int couponFlag = detailSvc.do_updateBuyCouponState(COUP_SEQ);
		}
		if(POINT!=0){
			int PRO_SEQ = basketInfoList.get(0).getPRO_SEQ();
			HashMap<String, Object> pointMap = new HashMap<>();
			pointMap.put("POINT_PRICE", POINT);
			pointMap.put("USER_ID", userdto.getUSER_ID());
			pointMap.put("POINT_PRICE", POINT);
			pointMap.put("DEL_SEQ", DEL_SEQ);
		
			int pointFlag = detailSvc.do_insertBuyPoint(pointMap);
		}
		//////////////////////////////////////////////////////////////////////////////
		
		UserMypageDto mypageDto = userMypageSvc.do_search_point(userdto.getUSER_ID());
		List<UserMypageDto> coupon = userMypageSvc.do_search_coupon(userdto.getUSER_ID());
		//List<UserMypageDto> buy = userMypageSvc.do_search_buy(userdto.getUSER_ID());
		List<UserMypageDto> qna = userMypageSvc.do_search_qna(userdto.getUSER_ID());
		List<UserMypageDto> basket = userMypageSvc.do_search_basket(userdto.getUSER_ID());
		List<UserMypageDto> point5 = userMypageSvc.do_search_point5(userdto.getUSER_ID());
		ModelAndView mav = new ModelAndView("mypage/usermypage/MypageMain");
		mav.addObject("point",mypageDto);
		mav.addObject("coupon",coupon);
		
		mav.addObject("qna",qna);
		mav.addObject("basket",basket);
		mav.addObject("point5",point5);
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
		mav.addObject("buy",buy);
		mav.addObject("prophomap",prophomap);
		return mav;
	}
}
