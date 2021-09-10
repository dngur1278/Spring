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

}
