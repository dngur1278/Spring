package com.yedam.app.employees.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class EmployeesVO {
	
	private String employeeId;		// 사원번호
	private String firstName;		// 성
	private String lastName;		// 이름
	private String email;			// 이메일
	private String phoneNumber;		// 전화번호
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date hireDate;			// 입사일
	private String jobId;			// 업무
	private String salary;			// 급여
	private String commissionPct;	// 커미션
	private String managerId;		// 매니저 id
	private String departmentId;	// 부서 번호
}
