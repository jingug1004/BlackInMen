package com.eagle.men_in_black.model;

import java.io.Serializable;

public class MainDto implements Serializable {

    private static final long serialVersionUID = 1241920765761676713L;

    private int BAN_SEQ;
    private String DETAILADDRESS;
    private String ADDRESS;
    private String BIRTH;
    private String BODYTYPE;
    private int DISCOUNT;
    private String EMAIL;
    private int EVENT_SEQ;
    private String ITEM;
    private String MATERIAL;
    private String NEW_ITEM;
    private String ORIGINAL_NAME;
    private int PHOTO_SEQ;
    private String POSTCODE;
    private String PRO_CONTENT;
    private String PRO_DETAIL;
    private String PRO_NAME;
    private int PRO_PRICE;
    private int PRO_SEQ;
    private int REV_SEQ;
    private String SALE_CNT;
    private String SEX;
    private String STORED_NAME;
    private String SUB_ITEM;
    private String TEL;
    private String USER_ID;
    private String USER_NAME;
    private String USER_PW;
    private String WASH;
    private String BAN_TIME;
    
    
    
    public int getBAN_SEQ() {
		return BAN_SEQ;
	}



	public void setBAN_SEQ(int bAN_SEQ) {
		BAN_SEQ = bAN_SEQ;
	}



	public String getBAN_TIME() {
		return BAN_TIME;
	}



	public void setBAN_TIME(String bAN_TIME) {
		BAN_TIME = bAN_TIME;
	}



	public MainDto() {
    }


    
    public String getDETAILADDRESS() {
		return DETAILADDRESS;
	}



	public void setDETAILADDRESS(String dETAILADDRESS) {
		DETAILADDRESS = dETAILADDRESS;
	}



	public MainDto(String uSER_ID) {
        USER_ID = uSER_ID;
    }

    public String getADDRESS() {
        return ADDRESS;
    }

    public void setADDRESS(String aDDRESS) {
        ADDRESS = aDDRESS;
    }

    public String getBIRTH() {
        return BIRTH;
    }

    public void setBIRTH(String bIRTH) {
        BIRTH = bIRTH;
    }

    public String getBODYTYPE() {
        return BODYTYPE;
    }

    public void setBODYTYPE(String bODYTYPE) {
        BODYTYPE = bODYTYPE;
    }

    public int getDISCOUNT() {
        return DISCOUNT;
    }

    public void setDISCOUNT(int dISCOUNT) {
        DISCOUNT = dISCOUNT;
    }

    public String getEMAIL() {
        return EMAIL;
    }

    public void setEMAIL(String eMAIL) {
        EMAIL = eMAIL;
    }

    public int getEVENT_SEQ() {
        return EVENT_SEQ;
    }

    public void setEVENT_SEQ(int eVENT_SEQ) {
        EVENT_SEQ = eVENT_SEQ;
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

    public String getORIGINAL_NAME() {
        return ORIGINAL_NAME;
    }

    public void setORIGINAL_NAME(String oRIGINAL_NAME) {
        ORIGINAL_NAME = oRIGINAL_NAME;
    }

    public int getPHOTO_SEQ() {
        return PHOTO_SEQ;
    }

    public void setPHOTO_SEQ(int pHOTO_SEQ) {
        PHOTO_SEQ = pHOTO_SEQ;
    }

    public String getPOSTCODE() {
        return POSTCODE;
    }

    public void setPOSTCODE(String pOSTCODE) {
        POSTCODE = pOSTCODE;
    }

    public String getPRO_CONTENT() {
        return PRO_CONTENT;
    }

    public void setPRO_CONTENT(String pRO_CONTENT) {
        PRO_CONTENT = pRO_CONTENT;
    }

    public String getPRO_DETAIL() {
        return PRO_DETAIL;
    }

    public void setPRO_DETAIL(String pRO_DETAIL) {
        PRO_DETAIL = pRO_DETAIL;
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

    public int getREV_SEQ() {
        return REV_SEQ;
    }

    public void setREV_SEQ(int rEV_SEQ) {
        REV_SEQ = rEV_SEQ;
    }

    public String getSALE_CNT() {
        return SALE_CNT;
    }

    public void setSALE_CNT(String sALE_CNT) {
        SALE_CNT = sALE_CNT;
    }

    public String getSEX() {
        return SEX;
    }

    public void setSEX(String sEX) {
        SEX = sEX;
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

    public String getTEL() {
        return TEL;
    }

    public void setTEL(String tEL) {
        TEL = tEL;
    }

    public String getUSER_ID() {
        return USER_ID;
    }

    public void setUSER_ID(String uSER_ID) {
        USER_ID = uSER_ID;
    }

    public String getUSER_NAME() {
        return USER_NAME;
    }

    public void setUSER_NAME(String uSER_NAME) {
        USER_NAME = uSER_NAME;
    }

    public String getUSER_PW() {
        return USER_PW;
    }

    public void setUSER_PW(String uSER_PW) {
        USER_PW = uSER_PW;
    }

    public String getWASH() {
        return WASH;
    }

    public void setWASH(String wASH) {
        WASH = wASH;
    }



	@Override
	public String toString() {
		return "MainDto [BAN_SEQ=" + BAN_SEQ + ", DETAILADDRESS=" + DETAILADDRESS + ", ADDRESS=" + ADDRESS + ", BIRTH="
				+ BIRTH + ", BODYTYPE=" + BODYTYPE + ", DISCOUNT=" + DISCOUNT + ", EMAIL=" + EMAIL + ", EVENT_SEQ="
				+ EVENT_SEQ + ", ITEM=" + ITEM + ", MATERIAL=" + MATERIAL + ", NEW_ITEM=" + NEW_ITEM
				+ ", ORIGINAL_NAME=" + ORIGINAL_NAME + ", PHOTO_SEQ=" + PHOTO_SEQ + ", POSTCODE=" + POSTCODE
				+ ", PRO_CONTENT=" + PRO_CONTENT + ", PRO_DETAIL=" + PRO_DETAIL + ", PRO_NAME=" + PRO_NAME
				+ ", PRO_PRICE=" + PRO_PRICE + ", PRO_SEQ=" + PRO_SEQ + ", REV_SEQ=" + REV_SEQ + ", SALE_CNT="
				+ SALE_CNT + ", SEX=" + SEX + ", STORED_NAME=" + STORED_NAME + ", SUB_ITEM=" + SUB_ITEM + ", TEL=" + TEL
				+ ", USER_ID=" + USER_ID + ", USER_NAME=" + USER_NAME + ", USER_PW=" + USER_PW + ", WASH=" + WASH
				+ ", BAN_TIME=" + BAN_TIME + "]";
	}

  


}
