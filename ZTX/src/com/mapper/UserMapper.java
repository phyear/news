package com.mapper;

import com.model.Users;

public interface UserMapper {
	
	Users findByName(String name);
	int  add(Users users);
}
