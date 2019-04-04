package com.service;

import com.model.Users;

public interface UserService {
	/**
	 * 登录验证
	 * @param name
	 * @param pass
	 * @return
	 */
       Users login(String name,String pass);
       /**
        * 注册时验证用户名是否存在
        * @param name
        * @return
        */
       Boolean checkname(String name);
       /**
        * 注册
        * @param uname
        * @param pass
        * @return
        */
       String register(String uname,String pass);
       /**
        * 登录验证用户名
        * @param uname
        * @return
        */
	   Boolean lcheckname(String uname);
	 
       
      
}
