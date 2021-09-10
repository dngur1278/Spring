package com.yedam.app.employees.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.app.employees.domain.DepartmentsVO;
import com.yedam.app.employees.service.DepartmentsService;

@Controller
public class DeptController {
	
	@Autowired DepartmentsService departmentsService;
	
	// 부서 관리 페이지 요청
	@GetMapping("dept")
	public String dept() {
		return "employee/dept";
	}
	
	// ajax : 목록 , 등록, 수정, 삭제 @ResponseBody
	@GetMapping("deptList")
	@ResponseBody
	public List<DepartmentsVO> deptList() {
		return departmentsService.getDeptList();
	}
	
	
}
