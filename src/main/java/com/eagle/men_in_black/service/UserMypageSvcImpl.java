package com.eagle.men_in_black.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eagle.men_in_black.model.DetailDto;
import com.eagle.men_in_black.model.UserMypageDto;
import com.eagle.men_in_black.repository.UserMypageDao;

@Service
public class UserMypageSvcImpl implements UserMypageSvc {
	@Autowired
	private UserMypageDao userMypageDao;

	@Override
	public UserMypageDto do_search_point(String id) {
		// TODO Auto-generated method stub
		return userMypageDao.do_search_point(id);
	}

	@Override
	public List<UserMypageDto> do_search_coupon(String id) {
		// TODO Auto-generated method stub
		return userMypageDao.do_search_coupon(id);
	}

	@Override
	public List<UserMypageDto> do_search_buy(String id) {
		// TODO Auto-generated method stub
		return userMypageDao.do_search_buy(id);
	}

	@Override
	public List<UserMypageDto> do_search_qna(String id) {
		// TODO Auto-generated method stub
		return userMypageDao.do_search_qna(id);
	}

	@Override
	public List<UserMypageDto> do_search_basket(String id) {
		// TODO Auto-generated method stub
		return userMypageDao.do_search_basket(id);
	}

	@Override
	public List<UserMypageDto> do_search_buylist(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return userMypageDao.do_search_buylist(map);
	}

	@Override
	public List<UserMypageDto> do_search_pointlist(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return userMypageDao.do_search_pointlist(map);
	}

	@Override
	public List<UserMypageDto> do_search_couponlist(HashMap<String, String> mapc) {
		// TODO Auto-generated method stub
		return userMypageDao.do_search_couponlist(mapc);
	}

	@Override
	public List<UserMypageDto> do_search_point5(String id) {
		// TODO Auto-generated method stub
		return userMypageDao.do_search_point5(id);
	}

	@Override
	public List<UserMypageDto> do_search_basketlist(String id) {
		// TODO Auto-generated method stub
		return userMypageDao.do_search_basketlist(id);
	}

	@Override
	public List<UserMypageDto> do_search_myboradreview(String id) {
		// TODO Auto-generated method stub
		return userMypageDao.do_search_myboradreview(id);
	}

	@Override
	public List<UserMypageDto> do_search_myboradqna(String id) {
		// TODO Auto-generated method stub
		return userMypageDao.do_search_myboradqna(id);
	}

	@Override
	public List<UserMypageDto> do_search_reviewlist(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return userMypageDao.do_search_reviewlist(map);
	}

	@Override
	public List<UserMypageDto> do_search_qnalist(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return userMypageDao.do_search_qnalist(map);
	}

	@Override
	public void do_delete_basketlist(List<Integer> list) {
		// TODO Auto-generated method stub
		userMypageDao.do_delete_basketlist(list);
	}

	@Override
	public List<UserMypageDto> do_search_goods(HashMap<String, Object> param) {
		// TODO Auto-generated method stub
		return userMypageDao.do_search_goods(param);
	}

	@Override
	public int do_member_update(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return userMypageDao.do_member_update(map);
	}

	@Override
	public UserMypageDto do_search_cancel(String del_seq) {
		// TODO Auto-generated method stub
		return userMypageDao.do_search_cancel(del_seq);
	}

	@Override
	public int do_update_cancel(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return userMypageDao.do_update_cancel(map);
	}

	@Override
	public int do_insert_review(HashMap<String, String> map) {
		return userMypageDao.do_insert_review(map);

	}

	@Override
	public int do_insert_reviewphoto(HashMap<String, Object> map) {
		return userMypageDao.do_insert_reviewphoto(map);

	}

	@Override
	public int do_select_revseq() {
		// TODO Auto-generated method stub
		return userMypageDao.do_select_revseq();
	}

	@Override
	public int do_insert_point(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return userMypageDao.do_insert_point(map);
	}

	@Override
	public int do_update_del_step(int del_seq) {
		// TODO Auto-generated method stub
		return userMypageDao.do_update_del_step(del_seq);
	}

	@Override
	public int do_update_del_step2(int del_seq) {
		// TODO Auto-generated method stub
		return userMypageDao.do_update_del_step2(del_seq);
	}

	@Override
	public DetailDto do_select_review(int REV_SEQ) {
		// TODO Auto-generated method stub
		return userMypageDao.do_select_review(REV_SEQ);
	}

	@Override
	public int do_update_review(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return userMypageDao.do_update_review(map);
	}

	@Override
	public int do_update_reviewphoto(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return userMypageDao.do_update_reviewphoto(map);
	}

	@Override
	public UserMypageDto do_search_qnadetail(String qna_seq) {
		return userMypageDao.do_search_qnadetail(qna_seq);

	}

	@Override
	public int do_delete_reviewList(String REV_SEQ) {
		return userMypageDao.do_delete_reviewList(REV_SEQ);
	}

	@Override
	public int do_update_qna(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return userMypageDao.do_update_qna(map);
	}

	@Override
	public int do_delete_qna(int qna) {
		// TODO Auto-generated method stub
		return userMypageDao.do_delete_qna(qna);
	}

	@Override
	public int do_delete_reviewPhoto(String REV_SEQ) {
		// TODO Auto-generated method stub
		return userMypageDao.do_delete_reviewPhoto(REV_SEQ);
	}

	@Override
	public int do_insert_qnareply(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return userMypageDao.do_insert_qnareply(map);
	}

	@Override
	public void do_update_qnastep(int QNA_REF) {
		userMypageDao.do_update_qnastep(QNA_REF);

	}

	@Override
	public int do_insert_qna(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return userMypageDao.do_insert_qna(map);
	}

	@Override
	public List<UserMypageDto> do_select_deldel(String USER_ID) {
		// TODO Auto-generated method stub
		return userMypageDao.do_select_deldel(USER_ID);
	}

	@Override
	public UserMypageDto do_select_propho(int PRO_SEQ) {
		// TODO Auto-generated method stub
		return userMypageDao.do_select_propho(PRO_SEQ);
	}

	@Override
	public UserMypageDto do_search_buylist_photo(int PRO_SEQ) {
		// TODO Auto-generated method stub
		return userMypageDao.do_search_buylist_photo(PRO_SEQ);
	}

	@Override
	public void do_update_REVIEW_SEQ(UserMypageDto dto) {
		// TODO Auto-generated method stub
		 userMypageDao.do_update_REVIEW_SEQ(dto);
		
	}

	@Override
	public UserMypageDto do_select_PRO_SEQ_st(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return userMypageDao.do_select_PRO_SEQ_st(map);
	}
	
}