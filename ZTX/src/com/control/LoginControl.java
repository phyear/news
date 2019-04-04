package com.control;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.model.Users;
import com.service.NewsService;
import com.service.UserService;
import com.sun.net.httpserver.Authenticator.Success;
import com.tools.DataTools;
import com.tools.MD5Tools;

@Controller
public class LoginControl {
	@Autowired
    private UserService userService;
	@Autowired
    private NewsService newsService;
	/**
	 * 鐧诲綍
	 * @param uname
	 * @param pass
	 * @param req
	 * @param resp
	 * @param session
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value="/login",method=RequestMethod.POST)
	@ResponseBody
    public Boolean  login(String uname,String pass,HttpServletRequest req,HttpServletResponse resp,HttpSession session) throws ServletException, IOException{
		Boolean bool=true;		
		Users users=userService.login(uname, pass);	
		if(users==null) {
			bool=false;
		 }
		else {
			session.setAttribute("user", users);	
		  }
		return bool;
    }
	@RequestMapping(value="/exit",method=RequestMethod.GET)
	@ResponseBody
	public Boolean exit(HttpServletRequest req,HttpServletResponse resp,HttpSession session) throws ServletException, IOException{
		session.removeAttribute("user");
		Boolean b=true;
		 if(session.getAttribute("user")!=null) {
			b=false;
		   }
		return b;
    }
	/**
	 * 楠岃瘉鐢ㄦ埛鍚�
	 * @param uname
	 * @param req
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value="/checkname",method=RequestMethod.GET)
	@ResponseBody
    public Boolean checkname(String uname,HttpServletRequest req) throws ServletException, IOException{
		Boolean b=false;
		b=userService.checkname(uname);	
		return b;
    }
    @RequestMapping(value="/lcheckname",method=RequestMethod.GET)
	@ResponseBody
    public Boolean lcheckname(String uname,HttpServletRequest req) throws ServletException, IOException{
		Boolean b=false;
		b=userService.lcheckname(uname);	
		return b;
    }
	@RequestMapping(value="/init",method=RequestMethod.GET)
	public void  Pageto(HttpServletRequest req,HttpServletResponse resp,HttpSession session) throws ServletException, IOException {
		session.setAttribute("Cate", newsService.findCat());
	    req.getRequestDispatcher("findALlNews").forward(req, resp);
	 }
	@RequestMapping("/topage")
	public String  topage(String pagename) {
		
		return pagename;
	}
}
