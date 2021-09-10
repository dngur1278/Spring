package com.yedam.app;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yedam.app.employees.domain.EmployeesVO;
import com.yedam.app.employees.mapper.EmployeesMapper;

import lombok.extern.java.Log;

@Log
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:/spring/*-context.xml")
public class EmployeesControllerTest {
	
	@Autowired EmployeesMapper employeesMapper;
	
	//@Test
	public void test() {
		log.info(employeesMapper.getList().toString());
	}
	
	@Test
	public void test1() {
		EmployeesVO vo = new EmployeesVO();
		
		vo.setEmployeeId("100");	
		log.info(employeesMapper.read(vo).toString());
	}
}
