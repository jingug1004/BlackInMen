package com.eagle.men_in_black.model;

import java.io.Serializable;

public class CategoryDto implements Serializable {

	private static final long serialVersionUID = -4222513140347282562L;

	private	String	PRO_NAME;
	private	String	PRO_CONTENT;
	private	int	PRO_SEQ;
	private	int	PRO_PRICE;
	private	String	ITEM;
	private	String 	SUB_ITEM;
	private	String	STORED_NAME;
	private	String	NEW_ITEM;
	private	int	PHOTO_SEQ;
	private	String	BODYTYPE;
	private	String	WASH;
	private	String	MATERIAL;
	private	int	SCORE;
	private	String	COLOR;
	private	String	PRO_SIZE;
	private	String	STOCK;
	private	int	BAS_SEQ;
	private	String	USER_ID;
	private int TOT_CNT;
	public String getPRO_NAME() {
		return PRO_NAME;
	}
	public void setPRO_NAME(String pRO_NAME) {
		PRO_NAME = pRO_NAME;
	}
	public String getPRO_CONTENT() {
		return PRO_CONTENT;
	}
	public void setPRO_CONTENT(String pRO_CONTENT) {
		PRO_CONTENT = pRO_CONTENT;
	}
	public int getPRO_SEQ() {
		return PRO_SEQ;
	}
	public void setPRO_SEQ(int pRO_SEQ) {
		PRO_SEQ = pRO_SEQ;
	}
	public int getPRO_PRICE() {
		return PRO_PRICE;
	}
	public void setPRO_PRICE(int pRO_PRICE) {
		PRO_PRICE = pRO_PRICE;
	}
	public String getITEM() {
		return ITEM;
	}
	public void setITEM(String iTEM) {
		ITEM = iTEM;
	}
	public String getSUB_ITEM() {
		return SUB_ITEM;
	}
	public void setSUB_ITEM(String sUB_ITEM) {
		SUB_ITEM = sUB_ITEM;
	}
	public String getSTORED_NAME() {
		return STORED_NAME;
	}
	public void setSTORED_NAME(String sTORED_NAME) {
		STORED_NAME = sTORED_NAME;
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
	public String getBODYTYPE() {
		return BODYTYPE;
	}
	public void setBODYTYPE(String bODYTYPE) {
		BODYTYPE = bODYTYPE;
	}
	public String getWASH() {
		return WASH;
	}
	public void setWASH(String wASH) {
		WASH = wASH;
	}
	public String getMATERIAL() {
		return MATERIAL;
	}
	public void setMATERIAL(String mATERIAL) {
		MATERIAL = mATERIAL;
	}
	public int getSCORE() {
		return SCORE;
	}
	public void setSCORE(int sCORE) {
		SCORE = sCORE;
	}
	public String getCOLOR() {
		return COLOR;
	}
	public void setCOLOR(String cOLOR) {
		COLOR = cOLOR;
	}
	public String getPRO_SIZE() {
		return PRO_SIZE;
	}
	public void setPRO_SIZE(String pRO_SIZE) {
		PRO_SIZE = pRO_SIZE;
	}
	public String getSTOCK() {
		return STOCK;
	}
	public void setSTOCK(String sTOCK) {
		STOCK = sTOCK;
	}
	public int getBAS_SEQ() {
		return BAS_SEQ;
	}
	public void setBAS_SEQ(int bAS_SEQ) {
		BAS_SEQ = bAS_SEQ;
	}
	public String getUSER_ID() {
		return USER_ID;
	}
	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}
	public int getTOT_CNT() {
		return TOT_CNT;
	}
	public void setTOT_CNT(int tOT_CNT) {
		TOT_CNT = tOT_CNT;
	}
	@Override
	public String toString() {
		return "CategoryDto [PRO_NAME=" + PRO_NAME + ", PRO_CONTENT=" + PRO_CONTENT + ", PRO_SEQ=" + PRO_SEQ
				+ ", PRO_PRICE=" + PRO_PRICE + ", ITEM=" + ITEM + ", SUB_ITEM=" + SUB_ITEM + ", STORED_NAME="
				+ STORED_NAME + ", NEW_ITEM=" + NEW_ITEM + ", PHOTO_SEQ=" + PHOTO_SEQ + ", BODYTYPE=" + BODYTYPE
				+ ", WASH=" + WASH + ", MATERIAL=" + MATERIAL + ", SCORE=" + SCORE + ", COLOR=" + COLOR + ", PRO_SIZE="
				+ PRO_SIZE + ", STOCK=" + STOCK + ", BAS_SEQ=" + BAS_SEQ + ", USER_ID=" + USER_ID + ", TOT_CNT="
				+ TOT_CNT + "]";
	}

	
}
