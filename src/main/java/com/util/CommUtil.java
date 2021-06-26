package com.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class CommUtil {
	public static String getOrderNumber() {
		String id=null;
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmssSSS"); 
		id=sdf.format(date);
		return id;
	}
	public static String getOrderTime(){
		String id=null;
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		id=sdf.format(date);
		return id;
	}	


}
