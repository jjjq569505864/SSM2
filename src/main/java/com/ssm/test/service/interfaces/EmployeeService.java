package com.ssm.test.service.interfaces;

import java.util.List;

import com.ssm.test.pojo.Employee;


public interface EmployeeService {
	/*
	 * ��ѯ
	 */
	List<Employee> selectEmployee(Employee em);
	
	/*
	 * ����
	 */
	int insert(Employee em);

	/*
	 * �޸�
	 */
	int updateByEmployeeId(Employee em);
	
	/*
	 * ���ڳ�ʼ���޸Ľ���
	 */
	Employee selectByPrimaryKey(String id);
	
	int deleteByPrimaryKey(String employeeid);
}
