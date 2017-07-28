package com.eagle.men_in_black.controller;

import com.eagle.men_in_black.model.CategoryDto;
import com.eagle.men_in_black.service.CategorySvc;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;

@Controller
public class CategoryController {
	Logger loger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private CategorySvc categorySvc;
	
	// 신상품
	@RequestMapping("NewCategory.mib")
	public ModelAndView newCategory(HttpServletRequest res,HttpServletResponse rep) {
		ModelAndView mav = new ModelAndView("category/CategoryNew");
		
		String ORDER = (res.getParameter("ORDER")==null||res.getParameter("ORDER").equals("") )?"C.PRO_SEQ DESC":res.getParameter("ORDER");
		int PAGE_NUM = Integer.parseInt((res.getParameter("PAGE_NUM")==null||res.getParameter("PAGE_NUM").equals("") )?"1":res.getParameter("PAGE_NUM"));
		int PAGE_SIZE = Integer.parseInt((res.getParameter("PAGE_SIZE")==null||res.getParameter("PAGE_SIZE").equals("") )?"15":res.getParameter("PAGE_SIZE"));
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("ORDER", ORDER);
		map.put("PAGE_NUM", PAGE_NUM);
		map.put("PAGE_SIZE", PAGE_SIZE);

		List<CategoryDto> list = categorySvc.do_selectNewProductList(map);
		mav.addObject("list", list);
		mav.addObject("ORDER", ORDER);
		return mav;
	}

	// 아우터/상의/하의/신발/가방&악세
	@RequestMapping("category.mib")
	public ModelAndView category(HttpServletRequest res, HttpServletResponse rep){
		ModelAndView mav = new ModelAndView("category/Category");
		
		String ITEM = (res.getParameter("ITEM")==null||res.getParameter("ITEM").equals("") )?"OUTER":res.getParameter("ITEM");
		String ORDER = (res.getParameter("ORDER")==null||res.getParameter("ORDER").equals("") )?"C.PRO_SEQ DESC":res.getParameter("ORDER");
		int PAGE_NUM = Integer.parseInt((res.getParameter("PAGE_NUM")==null||res.getParameter("PAGE_NUM").equals("") )?"1":res.getParameter("PAGE_NUM"));
		int PAGE_SIZE = Integer.parseInt((res.getParameter("PAGE_SIZE")==null||res.getParameter("PAGE_SIZE").equals("") )?"9":res.getParameter("PAGE_SIZE"));
		String SUB_ITEM = (res.getParameter("SUB_ITEM")==null||res.getParameter("SUB_ITEM").equals("") )?"ALL":res.getParameter("SUB_ITEM");
		// 메소드 실행시 필요한 키값들의 해시맵
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("ITEM", ITEM);
		map.put("ORDER", ORDER);
		map.put("PAGE_NUM", PAGE_NUM);
		map.put("PAGE_SIZE", PAGE_SIZE);
		map.put("SUB_ITEM", SUB_ITEM);
		
		List<CategoryDto> list = categorySvc.do_selectCategoryProductList(map);
		List<CategoryDto> listBtn = categorySvc.do_selectSub_itemList(res.getParameter("ITEM"));
		List<CategoryDto> listBest = categorySvc.do_selectCategoryProductBestList(ITEM);
		mav.addObject("ITEM",ITEM);
		mav.addObject("list", list);
		mav.addObject("listBtn",listBtn);
		mav.addObject("listBest", listBest);
		mav.addObject("ORDER", ORDER);
		mav.addObject("SUB_ITEM", SUB_ITEM);
		return mav;
	}
}

// git upload
