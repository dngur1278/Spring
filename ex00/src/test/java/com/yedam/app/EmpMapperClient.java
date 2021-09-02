package com.yedam.app;

import static org.junit.Assert.*;

import java.util.List;
import java.util.Map;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yedam.app.impl.EmpMapper;

import lombok.extern.java.Log;

@Log
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:/spring/*-context.xml")
public class EmpMapperClient {

	@Autowired EmpMapper dao;
	@Autowired SqlSessionTemplate mybatis;
	
	
	@Test
	public void mybatisTest() {
		List<Employees> list = mybatis.selectList("com.yedam.app.impl.EmpMapper.getEmp", "50");
		//List<Departments> list	= mybatis.selectList("com.yedam.app.impl.EmpMapper.getDept");
		log.info(list.get(0).getJobId());	// jps ${emp.XXXX}
	}
	
	@Ignore @Test
	public void test() {
		log.info(dao.getEmp("50").toString());
	}
	
	@Ignore @Test
	public void test1( ) {
		log.info("time==" + dao.getTime());
	}

}
