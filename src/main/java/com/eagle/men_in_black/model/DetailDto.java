package com.eagle.men_in_black.model;

import java.io.Serializable;

public class DetailDto implements Serializable {

	private static final long serialVersionUID = -246867464556631415L;
	private	int	BAS_PRO_NUM;
	private	int	BAS_SEQ;
	private	String	BODYTYPE;
	private	String	CANCLE;
	private	String	COLOR;
	private	String	COUP_LIMIT;
	private	String	COUP_USE;
	private	String	COUP_NAME;
	private	int 	COUP_SEQ;
	private	int 	COUP_PRICE;
	private	int 	CONDITION;
	private	String 	COUP_TIME;
	private	int	COUPON;
	private	String	DEL_ADDRESS;
	private	String	DEL_CONTENT;
	private	int	DEL_NUMBER;
	private	String	DEL_POSTCODE;
	private	int	DEL_PRICE;
	private	int	DEL_SEQ;
	private	String	DEL_STEP;
	private	String	DEL_TIME;
	private	int	FINAL_PRICE;
	private	String	ITEM;
	private	String	MATERIAL;
	private	String	NEW_ITEM;
	private	int	PHOTO_SEQ;
	private	String	POINT;
	private	String	PRO_CONTENT;
	private	String	PRO_DETAIL;
	private	String	PRO_NAME;
	private	int	PRO_PRICE;
	private	int	PRO_SEQ;
	private	String	PRO_SIZE;
	private	String	QNA_OPEN;
	private	int	QNA_REF;
	private	int	QNA_SEQ;
	private	String	QNA_STEP;
	private	String	QNA_TIME;
	private	String	QNA_TITLE;
	private	String	QNA_CONTENT;
	private	String	QNA_TYPE;
	private	String	REC_NAME;
	private	String	REC_TEL;
	private	int	REV_REF;
	private	int	REV_SEQ;
	private	String	REV_STEP;
	private	String	REV_TIME;
	private	String	REV_TITLE;
	private String  REV_CONTENT;
	private	int	SCORE;
	private	int	AVG_SCORE;
	private	String	SEL_COLOR;
	private	String	SEL_NUM;
	private	int	SEL_SEQ;
	private	String	SEL_SIZE;
	private	String	SEL_TIME;
	private	int	STOCK;
	private	String	STORED_NAME;
	private	String ORIGINAL_NAME;
	private int TOT_CNT;
	
	public String getPRO_DETAIL() {
		return PRO_DETAIL;
	}
	public void setPRO_DETAIL(String pRO_DETAIL) {
		PRO_DETAIL = pRO_DETAIL;
	}
	public int getTOT_CNT() {
		return TOT_CNT;
	}
	public void setTOT_CNT(int tOT_CNT) {
		TOT_CNT = tOT_CNT;
	}
	public String getCOUP_NAME() {
		return COUP_NAME;
	}
	public void setCOUP_NAME(String cOUP_NAME) {
		COUP_NAME = cOUP_NAME;
	}
	public int getCOUP_SEQ() {
		return COUP_SEQ;
	}
	public void setCOUP_SEQ(int cOUP_SEQ) {
		COUP_SEQ = cOUP_SEQ;
	}
	public int getCOUP_PRICE() {
		return COUP_PRICE;
	}
	public void setCOUP_PRICE(int cOUP_PRICE) {
		COUP_PRICE = cOUP_PRICE;
	}
	public int getCONDITION() {
		return CONDITION;
	}
	public void setCONDITION(int cONDITION) {
		CONDITION = cONDITION;
	}
	public String getCOUP_TIME() {
		return COUP_TIME;
	}
	public void setCOUP_TIME(String cOUP_TIME) {
		COUP_TIME = cOUP_TIME;
	}
	public String getORIGINAL_NAME() {
		return ORIGINAL_NAME;
	}
	public void setORIGINAL_NAME(String oRIGINAL_NAME) {
		ORIGINAL_NAME = oRIGINAL_NAME;
	}
	private	String 	SUB_ITEM;
	private	String	USER_ID;
	private	String	WASH;
	public String getQNA_CONTENT() {
		return QNA_CONTENT;
	}
	public void setQNA_CONTENT(String qNA_CONTENT) {
		QNA_CONTENT = qNA_CONTENT;
	}
	public int getBAS_PRO_NUM() {
		return BAS_PRO_NUM;
	}
	public void setBAS_PRO_NUM(int bAS_PRO_NUM) {
		BAS_PRO_NUM = bAS_PRO_NUM;
	}
	public int getBAS_SEQ() {
		return BAS_SEQ;
	}
	public void setBAS_SEQ(int bAS_SEQ) {
		BAS_SEQ = bAS_SEQ;
	}
	public String getBODYTYPE() {
		return BODYTYPE;
	}
	public void setBODYTYPE(String bODYTYPE) {
		BODYTYPE = bODYTYPE;
	}
	public String getCANCLE() {
		return CANCLE;
	}
	public void setCANCLE(String cANCLE) {
		CANCLE = cANCLE;
	}
	public String getCOLOR() {
		return COLOR;
	}
	public void setCOLOR(String cOLOR) {
		COLOR = cOLOR;
	}
	public String getCOUP_LIMIT() {
		return COUP_LIMIT;
	}
	public void setCOUP_LIMIT(String cOUP_LIMIT) {
		COUP_LIMIT = cOUP_LIMIT;
	}
	public String getCOUP_USE() {
		return COUP_USE;
	}
	public void setCOUP_USE(String cOUP_USE) {
		COUP_USE = cOUP_USE;
	}
	public int getCOUPON() {
		return COUPON;
	}
	public void setCOUPON(int cOUPON) {
		COUPON = cOUPON;
	}
	public String getDEL_ADDRESS() {
		return DEL_ADDRESS;
	}
	public void setDEL_ADDRESS(String dEL_ADDRESS) {
		DEL_ADDRESS = dEL_ADDRESS;
	}
	public String getDEL_CONTENT() {
		return DEL_CONTENT;
	}
	public void setDEL_CONTENT(String dEL_CONTENT) {
		DEL_CONTENT = dEL_CONTENT;
	}
	public int getDEL_NUMBER() {
		return DEL_NUMBER;
	}
	public void setDEL_NUMBER(int dEL_NUMBER) {
		DEL_NUMBER = dEL_NUMBER;
	}
	public String getDEL_POSTCODE() {
		return DEL_POSTCODE;
	}
	public void setDEL_POSTCODE(String dEL_POSTCODE) {
		DEL_POSTCODE = dEL_POSTCODE;
	}
	public int getDEL_PRICE() {
		return DEL_PRICE;
	}
	public void setDEL_PRICE(int dEL_PRICE) {
		DEL_PRICE = dEL_PRICE;
	}
	public int getDEL_SEQ() {
		return DEL_SEQ;
	}
	public void setDEL_SEQ(int dEL_SEQ) {
		DEL_SEQ = dEL_SEQ;
	}
	public String getDEL_STEP() {
		return DEL_STEP;
	}
	public void setDEL_STEP(String dEL_STEP) {
		DEL_STEP = dEL_STEP;
	}
	public String getDEL_TIME() {
		return DEL_TIME;
	}
	public void setDEL_TIME(String dEL_TIME) {
		DEL_TIME = dEL_TIME;
	}
	public int getFINAL_PRICE() {
		return FINAL_PRICE;
	}
	public void setFINAL_PRICE(int fINAL_PRICE) {
		FINAL_PRICE = fINAL_PRICE;
	}
	public String getITEM() {
		return ITEM;
	}
	public void setITEM(String iTEM) {
		ITEM = iTEM;
	}
	public String getMATERIAL() {
		return MATERIAL;
	}
	public void setMATERIAL(String mATERIAL) {
		MATERIAL = mATERIAL;
	}
	public String getNEW_ITEM() {
		return NEW_ITEM;
	}
	public void setNEW_ITEM(String nEW_ITEM) {
		NEW_ITEM = nEW_ITEM;
	}
	public int getPHOTO_SEQ() {
		return PHOTO_SEQ;
	}
	public void setPHOTO_SEQ(int pHOTO_SEQ) {
		PHOTO_SEQ = pHOTO_SEQ;
	}
	public String getPOINT() {
		return POINT;
	}
	public void setPOINT(String pOINT) {
		POINT = pOINT;
	}
	public String getPRO_CONTENT() {
		return PRO_CONTENT;
	}
	public void setPRO_CONTENT(String pRO_CONTENT) {
		PRO_CONTENT = pRO_CONTENT;
	}
	public String getPRO_NAME() {
		return PRO_NAME;
	}
	public void setPRO_NAME(String pRO_NAME) {
		PRO_NAME = pRO_NAME;
	}
	public int getPRO_PRICE() {
		return PRO_PRICE;
	}
	public void setPRO_PRICE(int pRO_PRICE) {
		PRO_PRICE = pRO_PRICE;
	}
	public int getPRO_SEQ() {
		return PRO_SEQ;
	}
	public void setPRO_SEQ(int pRO_SEQ) {
		PRO_SEQ = pRO_SEQ;
	}
	public String getPRO_SIZE() {
		return PRO_SIZE;
	}
	public void setPRO_SIZE(String pRO_SIZE) {
		PRO_SIZE = pRO_SIZE;
	}
	public String getQNA_OPEN() {
		return QNA_OPEN;
	}
	public void setQNA_OPEN(String qNA_OPEN) {
		QNA_OPEN = qNA_OPEN;
	}
	public int getQNA_REF() {
		return QNA_REF;
	}
	public void setQNA_REF(int qNA_REF) {
		QNA_REF = qNA_REF;
	}
	public int getQNA_SEQ() {
		return QNA_SEQ;
	}
	public void setQNA_SEQ(int qNA_SEQ) {
		QNA_SEQ = qNA_SEQ;
	}
	public String getQNA_STEP() {
		return QNA_STEP;
	}
	public void setQNA_STEP(String qNA_STEP) {
		QNA_STEP = qNA_STEP;
	}
	public String getQNA_TIME() {
		return QNA_TIME;
	}
	public void setQNA_TIME(String qNA_TIME) {
		QNA_TIME = qNA_TIME;
	}
	public String getQNA_TITLE() {
		return QNA_TITLE;
	}
	public void setQNA_TITLE(String qNA_TITLE) {
		QNA_TITLE = qNA_TITLE;
	}
	public String getQNA_TYPE() {
		return QNA_TYPE;
	}
	public void setQNA_TYPE(String qNA_TYPE) {
		QNA_TYPE = qNA_TYPE;
	}
	public String getREC_NAME() {
		return REC_NAME;
	}
	public void setREC_NAME(String rEC_NAME) {
		REC_NAME = rEC_NAME;
	}
	public String getREC_TEL() {
		return REC_TEL;
	}
	public void setREC_TEL(String rEC_TEL) {
		REC_TEL = rEC_TEL;
	}
	public int getREV_REF() {
		return REV_REF;
	}
	public void setREV_REF(int rEV_REF) {
		REV_REF = rEV_REF;
	}
	public int getREV_SEQ() {
		return REV_SEQ;
	}
	public void setREV_SEQ(int rEV_SEQ) {
		REV_SEQ = rEV_SEQ;
	}
	public String getREV_STEP() {
		return REV_STEP;
	}
	public void setREV_STEP(String rEV_STEP) {
		REV_STEP = rEV_STEP;
	}
	public String getREV_TIME() {
		return REV_TIME;
	}
	public void setREV_TIME(String rEV_TIME) {
		REV_TIME = rEV_TIME;
	}
	public String getREV_TITLE() {
		return REV_TITLE;
	}
	public void setREV_TITLE(String rEV_TITLE) {
		REV_TITLE = rEV_TITLE;
	}
	public int getSCORE() {
		return SCORE;
	}
	public void setSCORE(int sCORE) {
		SCORE = sCORE;
	}
	public int getAVG_SCORE() {
		return AVG_SCORE;
	}
	public void setAVG_SCORE(int aVG_SCORE) {
		AVG_SCORE = aVG_SCORE;
	}
	public String getSEL_COLOR() {
		return SEL_COLOR;
	}
	public void setSEL_COLOR(String sEL_COLOR) {
		SEL_COLOR = sEL_COLOR;
	}
	public String getSEL_NUM() {
		return SEL_NUM;
	}
	public void setSEL_NUM(String sEL_NUM) {
		SEL_NUM = sEL_NUM;
	}
	public int getSEL_SEQ() {
		return SEL_SEQ;
	}
	public void setSEL_SEQ(int sEL_SEQ) {
		SEL_SEQ = sEL_SEQ;
	}
	public String getSEL_SIZE() {
		return SEL_SIZE;
	}
	public void setSEL_SIZE(String sEL_SIZE) {
		SEL_SIZE = sEL_SIZE;
	}
	public String getSEL_TIME() {
		return SEL_TIME;
	}
	public void setSEL_TIME(String sEL_TIME) {
		SEL_TIME = sEL_TIME;
	}
	public int getSTOCK() {
		return STOCK;
	}
	public void setSTOCK(int sTOCK) {
		STOCK = sTOCK;
	}
	public String getSTORED_NAME() {
		return STORED_NAME;
	}
	public void setSTORED_NAME(String sTORED_NAME) {
		STORED_NAME = sTORED_NAME;
	}
	public String getSUB_ITEM() {
		return SUB_ITEM;
	}
	public void setSUB_ITEM(String sUB_ITEM) {
		SUB_ITEM = sUB_ITEM;
	}
	public String getUSER_ID() {
		return USER_ID;
	}
	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}
	public String getWASH() {
		return WASH;
	}
	public void setWASH(String wASH) {
		WASH = wASH;
	}
	public String getREV_CONTENT() {
		return REV_CONTENT;
	}
	public void setREV_CONTENT(String rEV_CONTENT) {
		REV_CONTENT = rEV_CONTENT;
	}
	@Override
	public String toString() {
		return "DetailDto [BAS_PRO_NUM=" + BAS_PRO_NUM + ", BAS_SEQ=" + BAS_SEQ + ", BODYTYPE=" + BODYTYPE + ", CANCLE="
				+ CANCLE + ", COLOR=" + COLOR + ", COUP_LIMIT=" + COUP_LIMIT + ", COUP_USE=" + COUP_USE + ", COUP_NAME="
				+ COUP_NAME + ", COUP_SEQ=" + COUP_SEQ + ", COUP_PRICE=" + COUP_PRICE + ", CONDITION=" + CONDITION
				+ ", COUP_TIME=" + COUP_TIME + ", COUPON=" + COUPON + ", DEL_ADDRESS=" + DEL_ADDRESS + ", DEL_CONTENT="
				+ DEL_CONTENT + ", DEL_NUMBER=" + DEL_NUMBER + ", DEL_POSTCODE=" + DEL_POSTCODE + ", DEL_PRICE="
				+ DEL_PRICE + ", DEL_SEQ=" + DEL_SEQ + ", DEL_STEP=" + DEL_STEP + ", DEL_TIME=" + DEL_TIME
				+ ", FINAL_PRICE=" + FINAL_PRICE + ", ITEM=" + ITEM + ", MATERIAL=" + MATERIAL + ", NEW_ITEM="
				+ NEW_ITEM + ", PHOTO_SEQ=" + PHOTO_SEQ + ", POINT=" + POINT + ", PRO_CONTENT=" + PRO_CONTENT
				+ ", PRO_NAME=" + PRO_NAME + ", PRO_PRICE=" + PRO_PRICE + ", PRO_SEQ=" + PRO_SEQ + ", PRO_SIZE="
				+ PRO_SIZE + ", QNA_OPEN=" + QNA_OPEN + ", QNA_REF=" + QNA_REF + ", QNA_SEQ=" + QNA_SEQ + ", QNA_STEP="
				+ QNA_STEP + ", QNA_TIME=" + QNA_TIME + ", QNA_TITLE=" + QNA_TITLE + ", QNA_CONTENT=" + QNA_CONTENT
				+ ", QNA_TYPE=" + QNA_TYPE + ", REC_NAME=" + REC_NAME + ", REC_TEL=" + REC_TEL + ", REV_REF=" + REV_REF
				+ ", REV_SEQ=" + REV_SEQ + ", REV_STEP=" + REV_STEP + ", REV_TIME=" + REV_TIME + ", REV_TITLE="
				+ REV_TITLE + ", REV_CONTENT=" + REV_CONTENT + ", SCORE=" + SCORE + ", AVG_SCORE=" + AVG_SCORE
				+ ", SEL_COLOR=" + SEL_COLOR + ", SEL_NUM=" + SEL_NUM + ", SEL_SEQ=" + SEL_SEQ + ", SEL_SIZE="
				+ SEL_SIZE + ", SEL_TIME=" + SEL_TIME + ", STOCK=" + STOCK + ", STORED_NAME=" + STORED_NAME
				+ ", ORIGINAL_NAME=" + ORIGINAL_NAME + ", TOT_CNT=" + TOT_CNT + ", SUB_ITEM=" + SUB_ITEM + ", USER_ID="
				+ USER_ID + ", WASH=" + WASH + "]";
	}
}
