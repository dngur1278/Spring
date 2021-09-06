package com.yedam.app.employees.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yedam.app.board.domain.Criteria;
import com.yedam.app.board.domain.PageVO;
import com.yedam.app.employees.domain.EmployeesVO;
import com.yedam.app.employees.service.EmployeesService;

@Controller
@RequestMapping("/employee/*")
public class EmployeesController {
	
	@Autowired
	EmployeesService employeesService;
	
	// 전체조회
	@GetMapping("/list")
	public void elist(Model model, Criteria cri) {
		int total = employeesService.getTotalCounts(cri);
		model.addAttribute("list", employeesService.getList(cri));
		model.addAttribute("pageMaker", new PageVO(cri, total));
	}
	
	// 단건조회(수정페이지)
	@GetMapping("/get")
	public void eget(Model model, EmployeesVO employee,  @ModelAttribute("cri") Criteria cri) {
		model.addAttribute("employee", employeesService.read(employee));
	}
	
	// 등록페이지로
	@GetMapping("/register")
	public void eregisterForm() {}
	
	// 등록처리
	@PostMapping("/register")
	public String eregister(EmployeesVO vo, RedirectAttributes rttr) {
		employeesService.insert(vo);
		rttr.addFlashAttribute("result", vo.getEmployeeId());
		return "redirect:/employee/list";
	}
	
	// 수정처리
	@PostMapping("/modify")
	public String modify(EmployeesVO vo,
						 @ModelAttribute("cri") Criteria cri,
						 RedirectAttributes rttr) {
		int result = employeesService.update(vo);
		if (result == 1) {
			rttr.addFlashAttribute("result", "success");
		}
		System.out.println("modify=" + cri);
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		return "redirect:/employee/list";
	}
	
	// 삭제처리
	@PostMapping("/delete")
	public String delete(EmployeesVO vo, 
			  			 @ModelAttribute("cri") Criteria cri,
						 RedirectAttributes rttr) {
		int result = employeesService.delete(vo);
		if (result == 1) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		return "redirect:/employee/list";
	}
}