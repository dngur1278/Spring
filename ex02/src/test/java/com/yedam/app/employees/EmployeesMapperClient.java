package com.yedam.app.employees;

import static org.junit.Assert.assertEquals;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yedam.app.board.domain.Criteria;
import com.yedam.app.employees.domain.EmployeesVO;
import com.yedam.app.employees.mapper.EmployeesMapper;

import lombok.extern.java.Log;

@Log
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:/spring/*-context.xml")
public class EmployeesMapperClient {

	@Autowired
	EmployeesMapper employeesMapper;
	
	@Test
	public void getList() {
		Criteria cri = new Criteria(1, 10);
		log.info(employeesMapper.getList(cri).toString());
	}
	
	//@Test
	public void read() {
		EmployeesVO evo = new EmployeesVO();
		
		evo.setEmployeeId("100");
		
		evo = employeesMapper.read(evo);
		log.info(evo.toString());
	}
	
	//@Test
	public void insert() throws ParseException {
		DateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");
		Date endDate = dateFormat.parse("2020.01.01");
		EmployeesVO evo = new EmployeesVO();
		evo.setEmployeeId("301");
		evo.setFirstName("Kang");
		evo.setLastName("Ho");
		evo.setEmail("abc@daum.net");
		evo.setPhoneNumber("010.111.2222");
		evo.setHireDate(endDate);
		evo.setJobId("IT_PROG");
		evo.setSalary("4620");
		evo.setDepartmentId("60");
		
		employeesMapper.insert(evo);
		log.info(evo.toString());
		log.info(evo.getEmployeeId());
	}
	
	//@Test
	public void update() {
		EmployeesVO evo = new EmployeesVO();
		evo.setEmployeeId("301");
		evo.setFirstName("Kang");
		evo.setLastName("Ho");
		evo.setEmail("abc@daum.net");
		evo.setPhoneNumber("010.222.3333");
		evo.setJobId("SA_REP");
		evo.setSalary("8020");
		evo.setDepartmentId("60");
		
		int result = employeesMapper.update(evo);
		assertEquals(result, 1);
	}
	
	//@Test
	public void delete() {
		EmployeesVO evo = new EmployeesVO();
		evo.setEmployeeId("301");
		
		int result = employeesMapper.delete(evo);
		assertEquals(result, 1);
	}
}
