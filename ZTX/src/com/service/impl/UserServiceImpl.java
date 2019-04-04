package com.service.impl;

import static org.junit.Assert.fail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mapper.UserMapper;
import com.model.Users;
import com.service.UserService;
import com.tools.MD5Tools;
@Service
@Transactional
public class UserServiceImpl implements UserService{
	@Autowired
    private  UserMapper udao;
	@Override
	public Users login(String name,String pass) {
		Users users=null;
		if(""!=name && ""!=pass) {
			users=udao.findByName(name);
			if(!users.getPassword().equals(MD5Tools.MD5(pass))) {
				users=null;
			};
		 }
		return users;
	}
	@Override
	public Boolean checkname(String name) {
		Boolean flag=false;		
			Users users=new Users();
			users=udao.findByName(name);
			if(users!=null) {
				flag=false;
			}
			else {
				flag=true;
			}	
		return flag;
	}
	@Override
	public String register(String uname, String pass) {
		String result="";
		
			Users users=new Users();
			users.setUsername(uname);
			users.setPassword(MD5Tools.MD5(pass));
			int re=udao.add(users);
			if(re==1){
				result="注册成功";
			  }
			else {
				result="注册失败";
			}
		 
		return result;
	}
	@Override
	public Boolean lcheckname(String uname) {
		Boolean flag=false;		
		Users users=new Users();
		users=udao.findByName(uname);
		if(users!=null) {
			flag=true;
		}
		else {
			flag=false;
		}	
	return flag;
	}	

}
