package com.tools;

import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Date;

public abstract class DataTools {
    public static String[] News_Types= {"热点","体育","社会","时尚","科技","生活","娱乐"};
    public static  Date   stringToDate(String date) {
    	
         //获得SimpleDateFormat类，我们转换为yyyy-MM-dd的时间格式  
         SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm");  
         ParsePosition pos = new ParsePosition(0);
        
         Date  a = sf.parse(date,pos);                
            
         return a;
    }
    public static String DateToString(Date date) {
   	    String aa=null;
        //获得SimpleDateFormat类，我们转换为yyyy-MM-dd的时间格式  
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm ");  
        try {  
            //使用SimpleDateFormat的parse()方法生成Date  
            aa= sf.format(date);                
           
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
        return aa;
   }
    public static  int ToInt(String str) {
      return Integer.parseInt(str);
    }
}
