package com.yedam.app.board.service;

import java.util.List;

import com.yedam.app.board.domain.BoardAttachVO;
import com.yedam.app.board.domain.BoardVO;
import com.yedam.app.board.domain.Criteria;

public interface BoardService {
	
	//전체조회 getList
	public List<BoardVO> getList(Criteria cri);
	
	//단건조회	read
	public BoardVO read(BoardVO vo);
	
	//등록 insert
	public int insert(BoardVO vo);
	
	//수정 update
	public int update(BoardVO vo);
	
	//삭제 delete
	public int delete(BoardVO vo);
	
	//전체 데이터 건수
	public int getTotalCount(Criteria cri);
	
	// 첨부 파일 단건 조회
	public BoardAttachVO attachRead(String uuid);
}
