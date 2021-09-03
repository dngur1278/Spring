package com.yedam.app.board.mapper;

import java.util.List;

import com.yedam.app.board.domain.BoardVO;

public interface BoardMapper {
	//CRUD 
	
	//전체조회 getList
	public List<BoardVO> getList();
	
	//단건조회	read
	public BoardVO read(BoardVO vo);
	
	//등록 insert
	public int insert(BoardVO vo);
	
	//수정 update
	public int update(BoardVO vo);
	
	//삭제 delete
	public int delete(BoardVO vo);
}
