package com.yedam.app.employees.service;

import java.util.List;

import com.yedam.app.employees.domain.DepartmentsVO;

public interface DepartmentsService {

	public List<DepartmentsVO> getDeptList();
	
	public DepartmentsVO deptRead(DepartmentsVO vo);
	
	public int insert(DepartmentsVO vo);
	
	public int update(DepartmentsVO vo);
	
	public int delete(DepartmentsVO vo);
}
