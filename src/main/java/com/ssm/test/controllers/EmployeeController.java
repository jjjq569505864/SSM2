package com.ssm.test.controllers;

import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssm.test.pojo.Employee;
import com.ssm.test.service.interfaces.EmployeeService;



@Controller
@RequestMapping("/employee")
public class EmployeeController {
	@Autowired
	private EmployeeService service;
	/*
	 * 查询
	 */
	@RequestMapping(value="/selectByName", method = RequestMethod.GET)
	@ResponseBody
	public List<Employee> selectPage(Employee em){
		List<Employee> list = service.selectEmployee(em);
		em.setEmployeename("2");
		return list ;
	}
	
	/*
	 * 增加
	 */
	@RequestMapping(value="/insert", method = RequestMethod.POST)
	@ResponseBody
	public Employee insertEmployee(@Valid Employee em,Model model,HttpServletResponse response){
		em.setEmployeeid(UUID.randomUUID().toString());
		service.insert(em);
		return em;
	}
	
	/*
	 * 得到要修改的员工信息，用于初始化
	 */
	@RequestMapping(value="/toupdate/{employeeId}", method = RequestMethod.POST)
	@ResponseBody
	public String updateByEmployeeId(@PathVariable("id")String id,Model model){
		Employee em = service.selectByPrimaryKey(id);
		model.addAttribute("Employee", em);
		return "";
	}
	/*
	 * 修改
	 */
	@RequestMapping(value="/update/", method = RequestMethod.POST)
	@ResponseBody
	public Employee updateEmployee(@Valid Employee em){
		service.updateByEmployeeId(em);
		return em;
	}
	/*
	 * 删除
	 */
	@RequestMapping(value="/delete/{employeeId}", method = RequestMethod.POST)
	@ResponseBody
	public Employee updateEmployee(@PathVariable("id")String id,Employee em){
		service.deleteByPrimaryKey(id);
		return em;
	}
}




