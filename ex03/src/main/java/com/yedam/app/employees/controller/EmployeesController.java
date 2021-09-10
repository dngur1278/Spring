package com.yedam.app.employees.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.app.employees.domain.EmployeesVO;
import com.yedam.app.employees.service.DepartmentsService;
import com.yedam.app.employees.service.EmployeesService;
import com.yedam.app.employees.service.JobsService;

@Controller
@RequestMapping("/employee/*")
public class EmployeesController {

	@Autowired EmployeesService employeesService;
	@Autowired JobsService jobsService;
	@Autowired DepartmentsService departmentsService;
	
	// 전체조회
	@GetMapping("/list")
	public void list(Model model) {
		model.addAttribute("list", employeesService.getList());
	}
	
	// 단건조회 (수정/삭제)
	@GetMapping("/get")
	public void read(Model model, EmployeesVO evo)	{
		model.addAttribute("employee", employeesService.read(evo));
	}
	
	// Model 여러개 보내야 할때 Map을 이용해서 보냄
	@ModelAttribute("opt")
	public Map<String, Object> jobs() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("jobs", jobsService.getJobList());
		map.put("depts", departmentsService.getDeptList());
		return map;
	}
	
	// 등록폼
	@GetMapping("/register")
	public String registerForm(EmployeesVO evo) { 	
		return "employee/register";
	}
	
	// 수정폼
	@GetMapping("/update")
	public String updateForm(EmployeesVO evo, Model model) { 	
		model.addAttribute("emp", employeesService.read(evo));
		return "employee/register";
	}
	
	// 등록처리
	@PostMapping("/register")
	public String register(EmployeesVO evo) {
		
		if (evo.getEmployeeId() == null) {
			employeesService.insert(evo);
		} else {
			employeesService.update(evo);
		}
		return "redirect:/employee/list";
	}
	
	// 검색처리
	@GetMapping("/empSearch")
	public String empSearch(Model model, EmployeesVO evo) {
		model.addAttribute("list", employeesService.getList());
		return "employee/empSearch";
	}
	
	
	@GetMapping("/ajaxEmp")
	@ResponseBody
	public EmployeesVO ajaxEmp(EmployeesVO vo) {
		return employeesService.read(vo);
	}
	
}
