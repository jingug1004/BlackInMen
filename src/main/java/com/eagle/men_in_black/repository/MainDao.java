package com.eagle.men_in_black.repository;

import java.util.HashMap;
import java.util.List;

import com.eagle.men_in_black.model.MainDto;

public interface MainDao {
	//로그인
	public MainDto do_search_pw(String id);
	// 이메일 중복 확인
	public MainDto do_search_email(String email);
	//회원 가입 
	public int do_join_MIB(HashMap<String, String> map);
	
	public List<MainDto> do_select_banner();
	
	public List<MainDto> do_select_bestItem(String ITEM);
	
	public List<MainDto> do_select_subitemheader();
	
	public int do_insert_point(String USER_ID);
	
	public int do_insert_coup(String USER_ID);
}
