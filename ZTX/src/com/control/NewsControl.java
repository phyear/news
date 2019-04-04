package com.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.model.Cate;
import com.model.News;
import com.model.Users;
import com.service.NewsService;
import com.tools.NewsHttp;

@Controller
public class NewsControl {
	@Autowired
    NewsService newsService;
	@RequestMapping(value="/httpNews",method=RequestMethod.GET)
	public void httpNews(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
	  int result=newsService.addNews(NewsHttp.find());
	  System.out.println(result);
	  request.getRequestDispatcher("findALlNews").forward(request, response);
	}
	@RequestMapping(value="/findALlNews",method=RequestMethod.GET)
	public void findAll(String cate,String pagesize,HttpServletRequest request,HttpServletResponse response,HttpSession session) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		int ps=0;
	    String catetype="";
		if(pagesize!=null) {
		  ps=Integer.parseInt(pagesize);
	      }
		if(cate!=null) {
//			  catetype=new String(request.getParameter("cate").getBytes("iso-8859-1"), "utf-8");	
			  catetype=(String )request.getParameter("cate");
		}
		System.out.println(catetype);
	  List<News> list=newsService.findAll(catetype,ps);
	  List<News> list1=newsService.findAll(catetype, -1);
	 
	  request.setAttribute("pages", list1.size()/12);
	  request.setAttribute("owncate", catetype);
	  request.setAttribute("selectpage", ps);
	  request.setAttribute("news", list);
	  Users users=(Users)session.getAttribute("user");
	  if(users==null){
		  request.getRequestDispatcher("index.jsp").forward(request, response);
	    }
	  else {
		   if(users.getPermission()==1) {
			   request.getRequestDispatcher("topage?pagename=admin").forward(request, response);
		     }
		   else {
			   request.getRequestDispatcher("index.jsp").forward(request, response);
		   }
	     }
	 }
	
	
	@RequestMapping(value="/detail",method=RequestMethod.GET)
	public String findCate(HttpServletRequest request,String nid) throws ServletException, IOException {
	  News news=newsService.findByNid(Integer.parseInt(nid)); 
	  request.setAttribute("detail", news);	  
	  return "news_info";
	 }
	@RequestMapping(value="/findNews",method=RequestMethod.GET)
	@ResponseBody
	public List<News> find(){
		List<News> list=newsService.findAll();
		return list;
	   }
	@RequestMapping(value="/removeNews",method=RequestMethod.GET,produces="text/html;charset=UTF-8")
	@ResponseBody
	public String  removeNews(String nid) {
		System.out.println(nid);
		String result=newsService.remove(nid);
		return result;
	}
	@RequestMapping(value="/search",method=RequestMethod.POST)
	public String search(String info,String pagesize,HttpServletRequest request,HttpServletResponse response,HttpSession session) throws ServletException, IOException {					 
		   System.out.println(info);
		  List<News> list1=newsService.search(info, -1);
		 
		  request.setAttribute("news", list1);
		  return "search";
	  }
	  
	 
}
