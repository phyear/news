package com.control;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.model.Comments;
import com.model.News;
import com.model.Users;
import com.service.CommentsService;
import com.sun.net.httpserver.Authenticator.Success;
import com.tools.DataTools;

@Controller
public class CommentsControl {
	@Autowired
    CommentsService commentsService;
	@RequestMapping(value="/findCommentBynid",method=RequestMethod.GET)
	@ResponseBody
	public List<Comments>  findCommentBynid(String nid) {
		System.out.println(nid);
		 List<Comments> list=commentsService.findBynid(DataTools.ToInt(nid));
		 
		
		return list;
	}
	@RequestMapping(value="/addComment",method=RequestMethod.POST,produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String addComment(String uid,String nid,String context) {
		  Comments comments=new Comments();
		   Users users=new Users();	
		   users.setUid(DataTools.ToInt(uid));
		   News news=new News();
		   news.setNid(DataTools.ToInt(nid));
		   comments.setNews(news);
		   comments.setUsers(users);
		   comments.setComments_context(context);
		   comments.setComments_date(new Date());
		  int result=commentsService.addComment(comments);
		  if(result>0)
		  {
			  return "评论成功";
		  }
		  else {
			  return "评论失败";
		  }
		
	}
	
}
