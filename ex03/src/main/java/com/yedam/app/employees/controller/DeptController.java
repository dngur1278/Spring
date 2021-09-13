package com.yedam.app.employees.controller;

import java.util.Collections;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
	
	// 단건 조회
	@GetMapping("deptRead")
	@ResponseBody
	public DepartmentsVO read(DepartmentsVO dvo) {
		return departmentsService.deptRead(dvo);
	}
	
	// 등록
	@PostMapping("deptInsert")
	@ResponseBody
	public Map<String, Object> insert(@RequestBody DepartmentsVO dvo) {
		departmentsService.insert(dvo);
		return Collections.singletonMap("result", true);
	}
	
	//수정 
	@PostMapping("deptUpdate")
	@ResponseBody
	public Map<String, Object> update(@RequestBody DepartmentsVO dvo) {
		System.out.println(dvo);
		departmentsService.update(dvo);
		return Collections.singletonMap("result", true);
	}
	
	
}
