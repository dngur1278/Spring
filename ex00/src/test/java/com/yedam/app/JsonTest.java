package com.yedam.app;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.java.Log;

@Log
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:/spring/*-context.xml")
public class JsonTest {
	
	@Test
	public void test1() {
		ObjectMapper mapper = new ObjectMapper();
		Employees emp = new Employees();
		emp.setFirstName("choi");
		emp.setEmploiyeeId("100");
		
		try {
			String str = mapper.writeValueAsString(emp);
			System.out.println(str);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
	}
}
