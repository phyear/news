package com.control;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.service.UserService;

@Controller
public class RegisterControl {
	@Autowired
    private UserService userService;
	
	@RequestMapping(value="/register",method=RequestMethod.POST,produces="text/html;charset=UTF-8;")
    public void register(String uname,String pass,HttpServletResponse response) throws IOException{
		String result="";    	 
    	result=userService.register(uname, pass);       	
    	response.sendRedirect("findALlNews");
    }
	@RequestMapping(value="/ajax_check",method=RequestMethod.POST)
	@ResponseBody
    public Boolean reg(String uname){	
		System.out.println(uname);
    	return userService.checkname(uname);
    }
}
