package com.ssm.test.service.interfaces;

import com.ssm.test.pojo.User;

public interface UserService {
	
	User selectBypn(User user);
	
	int insert(User user);
}
