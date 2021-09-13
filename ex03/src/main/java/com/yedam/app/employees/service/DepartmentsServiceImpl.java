package com.yedam.app.employees.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.app.employees.domain.DepartmentsVO;
import com.yedam.app.employees.mapper.DepartmentsMapper;

@Service
public class DepartmentsServiceImpl implements DepartmentsService {

	@Autowired DepartmentsMapper departmentsMapper;
	
	@Override
	public List<DepartmentsVO> getDeptList() {
		return departmentsMapper.getDeptList();
	}

	@Override
	public DepartmentsVO deptRead(DepartmentsVO vo) {
		return departmentsMapper.deptRead(vo);
	}

	@Override
	public int insert(DepartmentsVO vo) {
		return departmentsMapper.insert(vo);
	}

	@Override
	public int update(DepartmentsVO vo) {
		return departmentsMapper.update(vo);
	}

	@Override
	public int delete(DepartmentsVO vo) {
		return departmentsMapper.delete(vo);
	}

}
