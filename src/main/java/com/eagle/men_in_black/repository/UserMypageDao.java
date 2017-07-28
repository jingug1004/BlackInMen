package com.eagle.men_in_black.repository;

import java.util.HashMap;
import java.util.List;

import com.eagle.men_in_black.model.DetailDto;
import com.eagle.men_in_black.model.UserMypageDto;

public interface UserMypageDao {

	public UserMypageDto do_search_point(String id);

	public List<UserMypageDto> do_search_point5(String id);

	public List<UserMypageDto> do_search_coupon(String id);

	public List<UserMypageDto> do_search_buy(String id);

	public List<UserMypageDto> do_search_qna(String id);

	public List<UserMypageDto> do_search_basket(String id);

	public List<UserMypageDto> do_search_buylist(HashMap<String, String> map);

	public List<UserMypageDto> do_search_pointlist(HashMap<String, String> map);

	public List<UserMypageDto> do_search_couponlist(HashMap<String, String> mapc);

	public List<UserMypageDto> do_search_basketlist(String id);

	public List<UserMypageDto> do_search_myboradreview(String id);

	public List<UserMypageDto> do_search_myboradqna(String id);

	public List<UserMypageDto> do_search_reviewlist(HashMap<String, String> map);

	public List<UserMypageDto> do_search_qnalist(HashMap<String, String> map);

	public void do_delete_basketlist(List<Integer> list);

	public List<UserMypageDto> do_search_goods(HashMap<String, Object> param);

	public int do_member_update(HashMap<String, String> map);

	public int do_insert_review(HashMap<String, String> map);

	public int do_insert_reviewphoto(HashMap<String, Object> map);

	public int do_select_revseq();

	public UserMypageDto do_search_cancel(String del_seq);

	public int do_update_cancel(HashMap<String, Object> map);

	public int do_insert_point(HashMap<String, Object> map);

	public int do_update_del_step(int del_seq);

	public int do_update_del_step2(int del_seq);

	public DetailDto do_select_review(int REV_SEQ);

	public int do_update_review(HashMap<String, Object> map);

	public int do_update_reviewphoto(HashMap<String, Object> map);

	public UserMypageDto do_search_qnadetail(String qna_seq);

	public int do_delete_reviewList(String REV_SEQ);

	public int do_update_qna(HashMap<String, Object> map);

	public int do_delete_qna(int qna);

	public int do_delete_reviewPhoto(String REV_SEQ);

	public int do_insert_qnareply(HashMap<String, Object> map);

	public void do_update_qnastep(int QNA_REF);

	public int do_insert_qna(HashMap<String, Object> map);
	
	public List<UserMypageDto> do_select_deldel(String USER_ID);
	
	public UserMypageDto do_select_propho(int PRO_SEQ);
	
	public UserMypageDto do_search_buylist_photo(int PRO_SEQ);
	
	public void do_update_REVIEW_SEQ(UserMypageDto dto);
	
	public UserMypageDto do_select_PRO_SEQ_st(HashMap<String, String> map);

	


}