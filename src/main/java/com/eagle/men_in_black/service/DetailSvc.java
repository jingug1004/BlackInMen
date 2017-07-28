package com.eagle.men_in_black.service;

import java.util.HashMap;
import java.util.List;

import com.eagle.men_in_black.model.DetailDto;

public interface DetailSvc {
	//상품 상세정보
	public List<DetailDto> do_selectProductDetail(int PRO_SEQ);
	//상품 칼라 종류
	public List<DetailDto> do_selectProductColor(int PRO_SEQ);
	//상품 사이즈 종류
	public List<DetailDto> do_selectProductSize(int PRO_SEQ);
	//상품 리뷰 리스트
	public List<DetailDto> do_selectProductReviewList(HashMap<String, Object> map);
	//클릭한 리뷰 디테일
	public DetailDto do_selectReviewDetail(int REV_SEQ);
	//리뷰 step 수정
	public int do_updateReviewFlag(int REV_REF);
	//구매팝업 정보
	public List<DetailDto> do_buyProductPop(int PRO_SEQ);
	//구매팝업칼라셀렉트
	public List<DetailDto> do_buyProductColorPop(int PRO_SEQ);
	//구매팝업칼라로인한사이즈셀렉트리스트
	public List<DetailDto> do_buyProductSizePop(HashMap<String, Object> map);
	//구매팝업칼라로인한 사이즈로 인한 재고
	public String do_buyProductStockPop(HashMap<String, Object> map);
	//장바구니 추가
	public int do_addBasket(HashMap<String, Object> map);
	//관리자 리뷰 답글 달기
	public int do_insertReviewAdmReply(HashMap<String, Object> map);
	//QnA 리스트 
	public List<DetailDto> do_selectProductQnAList(HashMap<String, Object> map);
	/*//클릭한 QnA 디테일
	public DetailDto do_selectQnADetail(int QNA_SEQ);*/
	//최종 구매페이지 장바구니리스트
	public List<DetailDto> do_selectFinalBuy(HashMap<String, Object> map);
	//쿠폰리스트
	public List<DetailDto> do_selectCouponList(HashMap<String, Object> map);
	//사용가능한적립금
	public int do_selectPointsList(String USER_ID);
	//결제버튼 배달 등록
	public int do_insertBuyDel(HashMap<String, Object> map);
	//결제버튼시필요한장바구니정보가져오기
	public DetailDto do_selectBasketInfo(int BAS_SEQ);
	//결제버튼 구매내역등록
	public int do_insertBuySales(HashMap<String, Object> map);
	//결제버튼 클릭시 구매내역디비등록시 필요한 DEL_SEQ 가져오는 쿼리
	public int do_selectBuyDEL_SEQ();
	//결제버튼 클릭시 사용한 쿠폰 상태 업데이트
	public int do_updateBuyCouponState(int COUP_SEQ);
	//결제버튼 클릭시 사용한 포인트 디비 등록
	public int do_insertBuyPoint(HashMap<String, Object> map);
	//결제버튼 클릭시 결제상품을 장바구니에서 삭제
	public int do_deleteBuyBasket(int BAS_SEQ);
}
