package com.yedam.app.board;

import static org.junit.Assert.assertEquals;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yedam.app.board.domain.BoardVO;
import com.yedam.app.board.domain.Criteria;
import com.yedam.app.board.mapper.BoardMapper;
import com.yedam.app.board.service.BoardService;

import lombok.extern.java.Log;

@Log
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:/spring/*-context.xml")
public class BoardMapperClient {

	@Autowired
	BoardMapper boardMapper;
	
	@Test
	public void getList() {
		Criteria cri = new Criteria(1,20);
		cri.setType("W");
		cri.setKeyword("kang");
		log.info(boardMapper.getList(cri).toString());
	}
	
	//@Test
	public void insert() {
		//BoardVO 생성
		BoardVO bvo = new BoardVO();
		bvo.setTitle("새로 작성하는 글");
		bvo.setContent("새로 작성하는 글");
		bvo.setWriter("newbie");
		
		boardMapper.insert(bvo);
		
		log.info(bvo.toString());
		log.info(Long.toString(bvo.getBno()));	// 등록된 게시글 번호 확인
	}
	
	//@Test
	public void read() {
		BoardVO bvo = new BoardVO();
		bvo.setBno(5L);
		
		bvo = boardMapper.read(bvo);
		log.info(bvo.toString());
	}
	
	//@Test
	//@Rollback
	public void update() {
		BoardVO bvo = new BoardVO();
		bvo.setBno(2L);
		bvo.setTitle("Update 테스트");
		bvo.setContent("Update 되나??");
		bvo.setWriter("user1");
		
		int result = boardMapper.update(bvo);
		assertEquals(result, 1);
	}
	
	//@Test
	public void delete() {
		BoardVO bvo = new BoardVO();
		bvo.setBno(2L);
		
		int result = boardMapper.delete(bvo);
		assertEquals(result, 1);
	}
}
