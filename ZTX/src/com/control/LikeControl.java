package com.control;



import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.registry.infomodel.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.model.Likes;
import com.model.News;
import com.model.Users;
import com.service.LikeService;
import com.tools.DataTools;

@Controller
public class LikeControl {
	@Autowired
    LikeService likeService;
	@RequestMapping(value="/addLike",method=RequestMethod.GET,produces="text/html;charset=UTF-8")
	@ResponseBody
	public String addLike(String uid,String nid) {
		System.out.println(uid +nid);
		  int a=DataTools.ToInt(nid);
		  int b=DataTools.ToInt(uid);
		  String aa="";
		  if(likeService.isLike(a,b)) {
			  aa="已收藏";
		  }
		  else {			 
			  Likes likes=new Likes();
			  News news=new News();
			  news.setNid(a);
			  Users users=new Users();
			  users.setUid(b);
			  likes.setNews(news);
			  likes.setUsers(users);
			  likes.setLike_date(new Date());
			  System.out.println(likes.toString());
			  int result=likeService.add(likes);
			  System.out.println(result);
			  if(result > 0) {
				  aa="收藏成功";
			   }
			  else {
				  aa="收藏失败";
			  }
		  }
		  return aa;
	   }
	@RequestMapping(value="/myLike",method=RequestMethod.GET)
	public String mylike(String uid,HttpServletRequest request) {
		List<Likes> likes= likeService.findByUid(DataTools.ToInt(uid));
		request.setAttribute("myLike", likes);
		System.out.println(likes.toString());
		return "my_like";
	}
	@RequestMapping(value="/removeLike",method=RequestMethod.GET,produces="text/html;charset=UTF-8")
	@ResponseBody
	public String  removeLike(String lid,String uid,HttpSession session) {
		String message="";
				 
	    
	    	 message=likeService.removeLike(DataTools.ToInt(lid));
	     
		
		 return message;
	   }
}
