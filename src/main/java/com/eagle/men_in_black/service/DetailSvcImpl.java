package com.eagle.men_in_black.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eagle.men_in_black.model.DetailDto;
import com.eagle.men_in_black.repository.DetailDao;

@Service
public class DetailSvcImpl implements DetailSvc {
	
	@Autowired
	private DetailDao detailDao;

	@Override
	public List<DetailDto> do_selectProductDetail(int PRO_SEQ) {
		return detailDao.do_selectProductDetail(PRO_SEQ);
	}

	@Override
	public List<DetailDto> do_selectProductColor(int PRO_SEQ) {
		return detailDao.do_selectProductColor(PRO_SEQ);
	}

	@Override
	public List<DetailDto> do_selectProductSize(int PRO_SEQ) {
		return detailDao.do_selectProductSize(PRO_SEQ);
	}

	@Override
	public List<DetailDto> do_selectProductReviewList(HashMap<String, Object> map) {
		return detailDao.do_selectProductReviewList(map);
	}

	@Override
	public DetailDto do_selectReviewDetail(int REV_SEQ) {
		return detailDao.do_selectReviewDetail(REV_SEQ);
	}

	@Override
	public List<DetailDto> do_buyProductPop(int PRO_SEQ) {
		return detailDao.do_buyProductPop(PRO_SEQ);
	}

	@Override
	public List<DetailDto> do_buyProductColorPop(int PRO_SEQ) {
		return detailDao.do_buyProductColorPop(PRO_SEQ);
	}

	@Override
	public List<DetailDto> do_buyProductSizePop(HashMap<String, Object> map) {
		return detailDao.do_buyProductSizePop(map);
	}

	@Override
	public String do_buyProductStockPop(HashMap<String, Object> map) {
		return detailDao.do_buyProductStockPop(map);
	}

	@Override
	public int do_addBasket(HashMap<String, Object> map) {
		return detailDao.do_addBasket(map);
	}

	@Override
	public int do_insertReviewAdmReply(HashMap<String, Object> map) {
		return detailDao.do_insertReviewAdmReply(map);
	}

	@Override
	public List<DetailDto> do_selectProductQnAList(HashMap<String, Object> map) {
		return detailDao.do_selectProductQnAList(map);
	}

	/*@Override
	public DetailDto do_selectQnADetail(int QNA_SEQ) {
		return detailDao.do_selectQnADetail(QNA_SEQ);
	}*/
	
	@Override
	public List<DetailDto> do_selectFinalBuy(HashMap<String, Object> map) {
		return detailDao.do_selectFinalBuy(map);
	}

	@Override
	public List<DetailDto> do_selectCouponList(HashMap<String, Object> map) {
		return detailDao.do_selectCouponList(map);
	}

	@Override
	public int do_selectPointsList(String USER_ID) {
		return detailDao.do_selectPointsList(USER_ID);
	}

	@Override
	public int do_updateReviewFlag(int REV_REF) {
		return detailDao.do_updateReviewFlag(REV_REF);
	}

	@Override
	public int do_insertBuyDel(HashMap<String, Object> map) {
		return detailDao.do_insertBuyDel(map);
	}

	@Override
	public DetailDto do_selectBasketInfo(int BAS_SEQ) {
		return detailDao.do_selectBasketInfo(BAS_SEQ);
	}

	@Override
	public int do_insertBuySales(HashMap<String, Object> map) {
		return detailDao.do_insertBuySales(map);
	}

	@Override
	public int do_selectBuyDEL_SEQ() {
		return detailDao.do_selectBuyDEL_SEQ();
	}

	@Override
	public int do_updateBuyCouponState(int COUP_SEQ) {
		return detailDao.do_updateBuyCouponState(COUP_SEQ);
	}

	@Override
	public int do_insertBuyPoint(HashMap<String, Object> map) {
		return detailDao.do_insertBuyPoint(map);
	}

	@Override
	public int do_deleteBuyBasket(int BAS_SEQ) {
		return detailDao.do_deleteBuyBasket(BAS_SEQ);
	}
}
