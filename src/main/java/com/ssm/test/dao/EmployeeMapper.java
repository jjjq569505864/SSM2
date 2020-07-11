package com.ssm.test.dao;

import java.util.List;

import com.ssm.test.pojo.Employee;

public interface EmployeeMapper {
    int deleteByPrimaryKey(String employeeid);

    int insert(Employee record);

    int insertSelective(Employee record);

    Employee selectByPrimaryKey(String employeeid);
    
    List<Employee> selectEmployee(Employee em);
    /**
     * ÐÞ¸Ä
     * @param record
     * @return
     */
    int updateByEmployeeId(Employee em);

    int updateByPrimaryKey(Employee record);
}