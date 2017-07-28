package com.eagle.men_in_black.repository;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.eagle.men_in_black.model.DetailDto;

@Repository
public class DetailDaoImpl implements DetailDao {
	private final String namespace="com.eagle.repository.mapper.Detail";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<DetailDto> do_selectProductDetail(int PRO_SEQ) {
		String statement = namespace+".do_selectProductDetail";
		return sqlSession.selectList(statement, PRO_SEQ);
	}

	@Override
	public List<DetailDto> do_selectProductColor(int PRO_SEQ) {
		String statement = namespace+".do_selectProductColor";
		return sqlSession.selectList(statement, PRO_SEQ);
	}

	@Override
	public List<DetailDto> do_selectProductSize(int PRO_SEQ) {
		String statement = namespace+".do_selectProductSize";
		return sqlSession.selectList(statement, PRO_SEQ);
	}

	@Override
	public List<DetailDto> do_selectProductReviewList(HashMap<String, Object> map) {
		String statement = namespace+".do_selectProductReviewList";
		return sqlSession.selectList(statement, map);
	}

	@Override
	public DetailDto do_selectReviewDetail(int REV_SEQ) {
		String statement = namespace+".do_selectReviewDetail";
		return sqlSession.selectOne(statement, REV_SEQ);
	}

	@Override
	public List<DetailDto> do_buyProductPop(int PRO_SEQ) {
		String statement = namespace+".do_buyProductPop";
		return sqlSession.selectList(statement, PRO_SEQ);
	}

	@Override
	public List<DetailDto> do_buyProductColorPop(int PRO_SEQ) {
		String statement = namespace+".do_buyProductColorPop";
		return sqlSession.selectList(statement, PRO_SEQ);
	}

	@Override
	public List<DetailDto> do_buyProductSizePop(HashMap<String, Object> map) {
		String statement = namespace+".do_buyProductSizePop";
		return sqlSession.selectList(statement, map);
	}

	@Override
	public String do_buyProductStockPop(HashMap<String, Object> map) {
		String statement = namespace+".do_buyProductStockPop";
		return sqlSession.selectOne(statement, map);
	}

	@Override
	public int do_addBasket(HashMap<String, Object> map) {
		String statement = namespace+".do_addBasket";
		return sqlSession.insert(statement, map);
	}

	@Override
	public int do_insertReviewAdmReply(HashMap<String, Object> map) {
		String statement = namespace+".do_insertReviewAdmReply";
		return sqlSession.insert(statement, map);
	}

	@Override
	public List<DetailDto> do_selectProductQnAList(HashMap<String, Object> map) {
		String statement = namespace+".do_selectProductQnAList";
		return sqlSession.selectList(statement, map);
	}

/*	@Override
	public DetailDto do_selectQnADetail(int QNA_SEQ) {
		String statement = namespace+".do_selectQnADetail";
		return sqlSession.selectOne(statement, QNA_SEQ);
	}*/
	
	@Override
	public List<DetailDto> do_selectFinalBuy(HashMap<String, Object> map) {
		String statement = namespace+".do_selectFinalBuy";
		return sqlSession.selectList(statement, map);
	}

	@Override
	public List<DetailDto> do_selectCouponList(HashMap<String, Object> map) {
		String statement = namespace+".do_selectCouponList";
		return sqlSession.selectList(statement, map);
	}

	@Override
	public int do_selectPointsList(String USER_ID) {
		String statement = namespace+".do_selectPointsList";
		return sqlSession.selectOne(statement, USER_ID);
	}

	@Override
	public int do_updateReviewFlag(int REV_REF) {
		String statement = namespace+".do_updateReviewFlag";
		return sqlSession.update(statement, REV_REF);
	}

	@Override
	public int do_insertBuyDel(HashMap<String, Object> map) {
		String statement = namespace+".do_insertBuyDel";
		return sqlSession.insert(statement, map);
	}

	@Override
	public DetailDto do_selectBasketInfo(int BAS_SEQ) {
		String statement = namespace+".do_selectBasketInfo";
		return sqlSession.selectOne(statement, BAS_SEQ);
	}

	@Override
	public int do_insertBuySales(HashMap<String, Object> map) {
		String statement = namespace+".do_insertBuySales";
		return sqlSession.insert(statement, map);
	}

	@Override
	public int do_selectBuyDEL_SEQ() {
		String statement = namespace+".do_selectBuyDEL_SEQ";
		return sqlSession.selectOne(statement);
	}

	@Override
	public int do_updateBuyCouponState(int COUP_SEQ) {
		String statement = namespace+".do_updateBuyCouponState";
		return sqlSession.update(statement, COUP_SEQ);
	}

	@Override
	public int do_insertBuyPoint(HashMap<String, Object> map) {
		String statement = namespace+".do_insertBuyPoint";
		return sqlSession.insert(statement, map);
	}

	@Override
	public int do_deleteBuyBasket(int BAS_SEQ) {
		String statement = namespace+".do_deleteBuyBasket";
		return sqlSession.delete(statement, BAS_SEQ);
	}
}
