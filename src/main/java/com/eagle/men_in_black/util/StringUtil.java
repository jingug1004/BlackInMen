package com.eagle.men_in_black.util;

import java.text.DecimalFormat;

public class StringUtil {

	public static String NumFomat(int price) {
		 DecimalFormat df = new DecimalFormat("#,##0");
		return df.format(price);
	}
	
	
}
