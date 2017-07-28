package com.eagle.men_in_black.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CodeMController {
	Logger loger = LoggerFactory.getLogger(this.getClass());

	@RequestMapping("code/code_msg11.mib")
	public ModelAndView code_msg11(){
		
		loger.debug("=Controller ===========================");
		loger.debug("codeMSvc === " + "김옥지");
		loger.debug("============================");
		
		ModelAndView mav = new ModelAndView("code/code_m");
		mav.addObject("msg", "김옥지");
		
		return mav;
		
	}
	
	
	

}
