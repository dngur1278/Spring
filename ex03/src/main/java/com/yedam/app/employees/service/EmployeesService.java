package com.yedam.app.employees.service;

import java.util.List;

import com.yedam.app.employees.domain.EmployeesVO;

public interface EmployeesService {
	
	public List<EmployeesVO> getList();
	
	public EmployeesVO read(EmployeesVO vo);
	
	public int insert(EmployeesVO vo);
	
	public int update(EmployeesVO vo);
	
	public int delete(EmployeesVO vo);
}
