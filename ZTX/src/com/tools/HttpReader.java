package com.tools;

import java.io.IOException;

import org.jsoup.*;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import sun.print.resources.serviceui;

public class HttpReader {
	public static void findtitle() {
		try {  
	          Document doc = Jsoup.connect("http://news.sohu.com/").get();  
	          Elements links = doc.select("div.list16 > ul > li >a");  
	          for(Element link : links){
	        	  String linkhref=link.attr("abs:href");
	        	  String title=link.attr("title");
	        	  System.out.println(linkhref +title);
	          }  
	      } catch (IOException e) {  
	          // TODO Auto-generated catch block  
	          e.printStackTrace();  
	      }  
	  }
	public static void finddata(String detailUrl) {
		try {  
	          Document doc = Jsoup.connect(detailUrl).get();  
	          Elements p = doc.select("article > p");
	          Elements img=doc.select("article img");
	          String imgUrl="";
	          for (Element element : img) {
//				     imgUrl=imgUrl+","+element.attr("src");
	        	    System.out.println(element.attr("src"));
			          }
	          String time =doc.select("div.article-info > span#news-time").text();
	          String srcFrom=doc.select("div.article-info > span:eq(1) > a").text();
	          String cate=doc.select("div.location > a").text();
	          System.out.println(time + srcFrom + cate);
	          for(Element pp : p){
	        	  String aString=pp.text();
	        	  System.out.println(aString);
	           }  
	      } catch (IOException e) {  
	          // TODO Auto-generated catch block  
	          e.printStackTrace();  
	      }  
	  }
  public static void main(String[] args) {
	    
	    finddata("http://www.sohu.com/a/237391141_260616?_f=index_news_4");
   }
}
