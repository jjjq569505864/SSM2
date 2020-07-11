package com.ssm.test.service.interfaces;

import java.util.List;

import com.ssm.test.pojo.Employee;


public interface EmployeeService {
	/*
	 * 查询
	 */
	List<Employee> selectEmployee(Employee em);
	
	/*
	 * 增加
	 */
	int insert(Employee em);

	/*
	 * 修改
	 */
	int updateByEmployeeId(Employee em);
	
	/*
	 * 用于初始化修改界面
	 */
	Employee selectByPrimaryKey(String id);
	
	int deleteByPrimaryKey(String employeeid);
}
