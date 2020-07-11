package com.ssm.test.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.test.dao.EmployeeMapper;
import com.ssm.test.pojo.Employee;
import com.ssm.test.service.interfaces.EmployeeService;


@Service
public class EmployeeImpl implements EmployeeService{
	@Autowired
	private EmployeeMapper Mapper;

	@Override
	public List<Employee> selectEmployee(Employee em) {
		return Mapper.selectEmployee(em);
	}

	@Override
	public int insert(Employee em) {
		return Mapper.insert(em);
	}

	@Override
	public int updateByEmployeeId(Employee em) {
		return Mapper.updateByEmployeeId(em);
	}

	@Override
	public Employee selectByPrimaryKey(String employeeid) {
		return Mapper.selectByPrimaryKey(employeeid);
	}

	@Override
	public int deleteByPrimaryKey(String employeeid) {
		return Mapper.deleteByPrimaryKey(employeeid);
	}

}
