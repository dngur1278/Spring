package com.yedam.app.employees.mapper;

import java.util.List;

import com.yedam.app.board.domain.Criteria;
import com.yedam.app.employees.domain.EmployeesVO;

public interface EmployeesMapper {
	
	//CRUD
	// 전체조회
	public List<EmployeesVO> getList(Criteria cri);
	
	// 단건조회
	public EmployeesVO read(EmployeesVO vo);
	
	// 등록
	public int insert(EmployeesVO vo);
	
	// 수정
	public int update(EmployeesVO vo);
	
	// 삭제
	public int delete(EmployeesVO vo);
	
	// 전체 데이터 건수
	public int getTotalCounts(Criteria cri);
}
