package com.ssm.test.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.test.dao.UserMapper;
import com.ssm.test.pojo.User;
import com.ssm.test.service.interfaces.UserService;

@Service
public class UserImpl implements UserService{

	@Autowired
	private UserMapper Mapper;
	@Override
	public User selectBypn(User user) {
		return Mapper.selectBypn(user);
	}
	@Override
	public int insert(User user) {
		return Mapper.insert(user);
	}
	
	
}
