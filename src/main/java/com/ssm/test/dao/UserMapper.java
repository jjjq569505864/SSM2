package com.ssm.test.dao;

import com.ssm.test.pojo.User;

public interface UserMapper {
	
	User selectBypn(User user);
	
	int insert(User user);
}
