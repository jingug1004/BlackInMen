package com.eagle.men_in_black.model;

import java.io.Serializable;

public class ServiceDto implements Serializable {

	private static final long serialVersionUID = -5980152029432023538L;
	
	private int TOT_CNT;
	private	int	NOTICE_SEQ;
	private	String	NOTICE_TITLE;
	private	String	NOTICE_CONTENT;
	private	String	NOTICE_TIME;
	private	int	EVENT_SEQ;
	private	String	EVENT_TITLE;
	private	String	EVENT_CONTENT;
	private	String	EVENT_TIME;
	private	String	STORED_NAME;
	private String ORIGINAL_FILE_NAME;
	private String STORED_FILE_NAME;
	private String COUP_NAME ;
	private int COUP_PRICE;
	private int CONDITION ;
	private String COUP_TIME ;
	private String COUP_LIMIT;
	private String COUP_USE  ;
	private String USER_ID   ;
	private int COUP_SEQ;
	private String COUP_RECV;
	
	
	
	
	
	public String getCOUP_RECV() {
		return COUP_RECV;
	}


	public void setCOUP_RECV(String cOUP_RECV) {
		COUP_RECV = cOUP_RECV;
	}


	public String getCOUP_NAME() {
		return COUP_NAME;
	}


	public void setCOUP_NAME(String cOUP_NAME) {
		COUP_NAME = cOUP_NAME;
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


	public String getUSER_ID() {
		return USER_ID;
	}


	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}


	public int getCOUP_SEQ() {
		return COUP_SEQ;
	}


	public void setCOUP_SEQ(int cOUP_SEQ) {
		COUP_SEQ = cOUP_SEQ;
	}


	public String getORIGINAL_FILE_NAME() {
		return ORIGINAL_FILE_NAME;
	}


	public void setORIGINAL_FILE_NAME(String oRIGINAL_FILE_NAME) {
		ORIGINAL_FILE_NAME = oRIGINAL_FILE_NAME;
	}


	public String getSTORED_FILE_NAME() {
		return STORED_FILE_NAME;
	}


	public void setSTORED_FILE_NAME(String sTORED_FILE_NAME) {
		STORED_FILE_NAME = sTORED_FILE_NAME;
	}


	public int getNOTICE_SEQ() {
		return NOTICE_SEQ;
	}
	
	
	public int getTOT_CNT() {
		return TOT_CNT;
	}


	public void setTOT_CNT(int tOT_CNT) {
		TOT_CNT = tOT_CNT;
	}


	public void setNOTICE_SEQ(int nOTICE_SEQ) {
		NOTICE_SEQ = nOTICE_SEQ;
	}
	public String getNOTICE_TITLE() {
		return NOTICE_TITLE;
	}
	public void setNOTICE_TITLE(String nOTICE_TITLE) {
		NOTICE_TITLE = nOTICE_TITLE;
	}
	public String getNOTICE_CONTENT() {
		return NOTICE_CONTENT;
	}
	public void setNOTICE_CONTENT(String nOTICE_CONTENT) {
		NOTICE_CONTENT = nOTICE_CONTENT;
	}
	public String getNOTICE_TIME() {
		return NOTICE_TIME;
	}
	public void setNOTICE_TIME(String nOTICE_TIME) {
		NOTICE_TIME = nOTICE_TIME;
	}
	public int getEVENT_SEQ() {
		return EVENT_SEQ;
	}
	public void setEVENT_SEQ(int eVENT_SEQ) {
		EVENT_SEQ = eVENT_SEQ;
	}
	public String getEVENT_TITLE() {
		return EVENT_TITLE;
	}
	public void setEVENT_TITLE(String eVENT_TITLE) {
		EVENT_TITLE = eVENT_TITLE;
	}
	
	public String getEVENT_CONTENT() {
		return EVENT_CONTENT;
	}


	public void setEVENT_CONTENT(String eVENT_CONTENT) {
		EVENT_CONTENT = eVENT_CONTENT;
	}


	public String getEVENT_TIME() {
		return EVENT_TIME;
	}
	public void setEVENT_TIME(String eVENT_TIME) {
		EVENT_TIME = eVENT_TIME;
	}
	public String getSTORED_NAME() {
		return STORED_NAME;
	}
	public void setSTORED_NAME(String sTORED_NAME) {
		STORED_NAME = sTORED_NAME;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "ServiceDto [NOTICE_SEQ=" + NOTICE_SEQ + ", NOTICE_TITLE=" + NOTICE_TITLE + ", NOTICE_CONTENT="
				+ NOTICE_CONTENT + ", NOTICE_TIME=" + NOTICE_TIME + ", EVENT_SEQ=" + EVENT_SEQ + ", EVENT_TITLE="
				+ EVENT_TITLE + ", EVENT_CONTENT=" + EVENT_CONTENT + ", EVENT_TIME=" + EVENT_TIME + ", STORED_NAME="
				+ STORED_NAME + "]";
	}

}
