package com.eagle.men_in_black.repository;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.eagle.men_in_black.model.DetailDto;
import com.eagle.men_in_black.model.UserMypageDto;

@Repository
public class UserMypageDaoImpl implements UserMypageDao {
	Logger loger = LoggerFactory.getLogger(this.getClass());
	private final String namespace = "com.eagle.repository.mapper.UserMypage";

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public UserMypageDto do_search_point(String id) {
		String statement = namespace + ".do_search_point";
		return sqlSession.selectOne(statement, id);
	}

	@Override
	public List<UserMypageDto> do_search_coupon(String id) {
		String statement = namespace + ".do_search_coupon";
		return sqlSession.selectList(statement, id);
	}

	@Override
	public List<UserMypageDto> do_search_buy(String id) {
		String statement = namespace + ".do_search_buy";
		return sqlSession.selectList(statement, id);
	}

	@Override
	public List<UserMypageDto> do_search_qna(String id) {
		String statement = namespace + ".do_search_qna";
		return sqlSession.selectList(statement, id);
	}

	@Override
	public List<UserMypageDto> do_search_basket(String id) {
		String statement = namespace + ".do_search_basket";
		return sqlSession.selectList(statement, id);
	}

	@Override
	public List<UserMypageDto> do_search_buylist(HashMap<String, String> map) {
		String statement = namespace + ".do_search_buylist";
		return sqlSession.selectList(statement, map);
	}

	@Override
	public List<UserMypageDto> do_search_pointlist(HashMap<String, String> map) {
		String statement = namespace + ".do_search_pointlist";
		return sqlSession.selectList(statement, map);
	}

	@Override
	public List<UserMypageDto> do_search_couponlist(HashMap<String, String> mapc) {
		String statement = namespace + ".do_search_couponlist";
		return sqlSession.selectList(statement, mapc);
	}

	@Override
	public List<UserMypageDto> do_search_point5(String id) {
		String statement = namespace + ".do_search_point5";
		return sqlSession.selectList(statement, id);
	}

	@Override
	public List<UserMypageDto> do_search_basketlist(String id) {
		String statement = namespace + ".do_search_basketlist";
		return sqlSession.selectList(statement, id);
	}

	@Override
	public List<UserMypageDto> do_search_myboradreview(String id) {
		String statement = namespace + ".do_search_myboradreview";
		return sqlSession.selectList(statement, id);
	}

	@Override
	public List<UserMypageDto> do_search_myboradqna(String id) {
		String statement = namespace + ".do_search_myboradqna";
		return sqlSession.selectList(statement, id);
	}

	@Override
	public List<UserMypageDto> do_search_reviewlist(HashMap<String, String> map) {
		String statement = namespace + ".do_search_reviewlist";
		return sqlSession.selectList(statement, map);
	}

	@Override
	public List<UserMypageDto> do_search_qnalist(HashMap<String, String> map) {
		String statement = namespace + ".do_search_qnalist";
		return sqlSession.selectList(statement, map);
	}

	@Override
	public void do_delete_basketlist(List<Integer> list) {
		String statement = namespace + ".do_delete_basketlist";
		sqlSession.delete(statement, list);
	}

	@Override
	public List<UserMypageDto> do_search_goods(HashMap<String, Object> param) {
		String statement = namespace + ".do_search_goods";
		return sqlSession.selectList(statement, param);
	}

	@Override
	public int do_member_update(HashMap<String, String> map) {
		String statement = namespace + ".do_member_update";
		return sqlSession.update(statement, map);
	}

	@Override
	public UserMypageDto do_search_cancel(String del_seq) {
		String statement = namespace + ".do_search_cancel";
		return sqlSession.selectOne(statement, del_seq);
	}

	@Override
	public int do_update_cancel(HashMap<String, Object> map) {
		String statement = namespace + ".do_update_cancel";
		return sqlSession.update(statement, map);
	}

	@Override
	public int do_insert_review(HashMap<String, String> map) {
		String statement = namespace + ".do_insert_review";
		return sqlSession.insert(statement, map);

	}

	@Override
	public int do_insert_reviewphoto(HashMap<String, Object> map) {
		String statement = namespace + ".do_insert_reviewphoto";
		return sqlSession.insert(statement, map);

	}

	@Override
	public int do_select_revseq() {
		String statement = namespace + ".do_select_revseq";
		return sqlSession.selectOne(statement);
	}

	@Override
	public int do_insert_point(HashMap<String, Object> map) {
		String statement = namespace + ".do_insert_point";
		return sqlSession.insert(statement, map);
	}

	@Override
	public int do_update_del_step(int del_seq) {
		String statement = namespace + ".do_update_del_step";

		return sqlSession.update(statement, del_seq);
	}

	@Override
	public int do_update_del_step2(int del_seq) {
		String statement = namespace + ".do_update_del_step2";

		return sqlSession.update(statement, del_seq);
	}

	@Override
	public DetailDto do_select_review(int REV_SEQ) {
		String statement = namespace + ".do_selectReviewDetail";
		return sqlSession.selectOne(statement, REV_SEQ);

	}

	@Override

	public int do_update_review(HashMap<String, Object> map) {
		String statement = namespace + ".do_update_review";
		return sqlSession.update(statement, map);
	}

	@Override
	public int do_update_reviewphoto(HashMap<String, Object> map) {
		String statement = namespace + ".do_update_reviewphoto";
		return sqlSession.update(statement, map);
	}

	public UserMypageDto do_search_qnadetail(String qna_seq) {
		String statement = namespace + ".do_search_qnadatail";
		return sqlSession.selectOne(statement, qna_seq);
	}

	@Override
	public int do_update_qna(HashMap<String, Object> map) {
		String statement = namespace + ".do_update_qna";
		return sqlSession.update(statement, map);
	}

	@Override
	public int do_delete_qna(int qna) {
		String statement = namespace + ".do_delete_qna";
		return sqlSession.delete(statement, qna);
	}

	@Override
	public int do_delete_reviewList(String REV_SEQ) {
		String statement = namespace + ".do_delete_reviewList";
		return sqlSession.delete(statement, REV_SEQ);
	}

	@Override
	public int do_delete_reviewPhoto(String REV_SEQ) {
		String statement = namespace + ".do_delete_reviewPhoto";
		return sqlSession.delete(statement, REV_SEQ);
	}

	@Override
	public int do_insert_qnareply(HashMap<String, Object> map) {
		String statement = namespace + ".do_insert_qnareply";
		return sqlSession.insert(statement, map);
	}

	@Override
	public void do_update_qnastep(int QNA_REF) {
		String statement = namespace + ".do_update_qnastep";
		sqlSession.insert(statement, QNA_REF);

	}

	@Override
	public int do_insert_qna(HashMap<String, Object> map) {
		String statement = namespace + ".do_insert_qna";
		return sqlSession.insert(statement, map);
	}

	@Override
	public List<UserMypageDto> do_select_deldel(String USER_ID) {
		String statement = namespace + ".do_select_deldel";
		return sqlSession.selectList(statement, USER_ID);
	}

	@Override
	public UserMypageDto do_select_propho(int PRO_SEQ) {
		String statement = namespace + ".do_select_propho";
		return sqlSession.selectOne(statement, PRO_SEQ);
	}

	@Override
	public UserMypageDto do_search_buylist_photo(int PRO_SEQ) {
		String statement = namespace + ".do_search_buylist_photo";
		return sqlSession.selectOne(statement, PRO_SEQ);
	}

	@Override
	public void do_update_REVIEW_SEQ(UserMypageDto dto) {
		String statement = namespace + ".do_update_REVIEW_SEQ";
		sqlSession.update(statement, dto);
	}

	@Override
	public UserMypageDto do_select_PRO_SEQ_st(HashMap<String, String> map) {
		String statement = namespace + ".do_select_PRO_SEQ_st";
		return sqlSession.selectOne(statement, map);
	}
}