package com.yedam.app.users.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

// 유저 페이지로 이동 (페이지 이동만)
@Controller
public class UserController {
	
	@GetMapping("/userPage")
	public String userPage() {
		return "users/users";
	}
	
}
