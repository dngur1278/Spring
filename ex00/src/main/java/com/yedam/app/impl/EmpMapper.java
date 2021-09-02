package com.yedam.app.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.yedam.app.Departments;

@Repository	//DAO
public interface EmpMapper {
	List<Map> getEmp(String deptid);
	List<Departments> getDept();
	
	// 아래 방법도 가능하다!
	@Select("select sysdate from dual")
	public String getTime();
}
