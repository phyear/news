package com.tools;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.model.News;
import com.model.Users;

public class NewsHttp {
	public static List<News> list=null;
	public static List<News> find() {
		list=new ArrayList<News>();
		try {  
	          Document doc = Jsoup.connect("http://news.sohu.com/").get();  
	          Elements links = doc.select("div.list16 > ul > li >a");  
	          for(Element link : links){
	        	  String linkhref=link.attr("abs:href");
	        	  String title=link.attr("title");
	        	  News news =findData(linkhref);
	        	  news.setTitle(title);
	        	  list.add(news);
	          }  
	      } catch (IOException e) {  
	          // TODO Auto-generated catch block  
	    	 System.out.println("连接超时");  
	      }  
		  return list;
	  }
	public static News findData(String detailUrl) {
		News news=new News();
		try {  
	          Document doc = Jsoup.connect(detailUrl).get();  
	          Elements p = doc.select("article > p");
	          String time =doc.select("div.article-info > span#news-time").text();
	          String srcFrom=doc.select("div.article-info > span:eq(1) > a").text();
	          String cate=doc.select("div.location > a").text();
	          Elements img=doc.select("article img");
	          String imgUrl=new String();
	          for (Element element : img) {
				  imgUrl+=element.attr("src")+",";
			     }
	          String context="";
	          for(Element pp : p){
	        	  context+=pp.text()+'#';	       
	            }  
	          news.setCreatetime(DataTools.stringToDate(time));
	          news.setNewsFrom(srcFrom);
	          news.setContext(context);
	          news.setCate(cate);
	          news.setImgUrl(imgUrl);
	      } catch (IOException e) {  
	          // TODO Auto-generated catch block  
	         System.out.println("连接超时"); 
	      }  
		
		return news;
	  }
}
