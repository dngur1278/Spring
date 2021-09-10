package com.yedam.app.employees.mapper;

import java.util.List;

import com.yedam.app.employees.domain.DepartmentsVO;

public interface DepartmentsMapper {
	
	public List<DepartmentsVO> getDeptList();
	
	public DepartmentsVO deptRead(DepartmentsVO vo);
	
	public int insert(DepartmentsVO vo);
	
	public int update(DepartmentsVO vo);
	
	public int delete(DepartmentsVO vo);

}
