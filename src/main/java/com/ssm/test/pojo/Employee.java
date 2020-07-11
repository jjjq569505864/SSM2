package com.ssm.test.pojo;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Range;



public class Employee {
    private String employeeid;
    @NotNull(message="��������Ϊ��!")
    @Size(min=1,max=6,message="�����ĳ�����1~6֮�䣡")
    private String employeename;
    @Range(min=17,max=100,message="���䷶Χ��18��99��")
    private Integer employeeold;
    
    private String employeesex;
    @NotNull(message="��������Ϊ��!")
    @Size(min=10,max=20,message="��ַ������10~20֮�䣡")
    private String employeeaddress;

    public String getEmployeeid() {
        return employeeid;
    }

    public void setEmployeeid(String employeeid) {
        this.employeeid = employeeid == null ? null : employeeid.trim();
    }

    public String getEmployeename() {
        return employeename;
    }

    public void setEmployeename(String employeename) {
        this.employeename = employeename == null ? null : employeename.trim();
    }

    public Integer getEmployeeold() {
        return employeeold;
    }

    public void setEmployeeold(Integer employeeold) {
        this.employeeold = employeeold;
    }

    public String getEmployeesex() {
        return employeesex;
    }

    public void setEmployeesex(String employeesex) {
        this.employeesex = employeesex == null ? null : employeesex.trim();
    }

    public String getEmployeeaddress() {
        return employeeaddress;
    }

    public void setEmployeeaddress(String employeeaddress) {
        this.employeeaddress = employeeaddress == null ? null : employeeaddress.trim();
    }
}