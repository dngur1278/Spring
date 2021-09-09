package com.yedam.app.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.app.board.domain.BoardAttachVO;
import com.yedam.app.board.domain.BoardVO;
import com.yedam.app.board.domain.Criteria;
import com.yedam.app.board.mapper.BoardAttachMapper;
import com.yedam.app.board.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	BoardMapper boardMapper;
	
	@Autowired BoardAttachMapper attachMapper;
	
	@Override
	public List<BoardVO> getList(Criteria cri) {
		return boardMapper.getList(cri);
	}

	// 게시글 조회
	@Override
	public BoardVO read(BoardVO vo) {
		// 게시글 조회
		vo =  boardMapper.read(vo);
		// 첨부파일 조회
		vo.setAttachList(attachMapper.findByBno(vo.getBno()));
		return vo;
	}

	@Override
	public int insert(BoardVO vo) {
		boardMapper.insert(vo);	//bno
		// 첨부파일 등록
		if (vo.getAttachList() == null  || vo.getAttachList().size() <= 0) {
			return 1;
		}
		for (BoardAttachVO attach : vo.getAttachList()) {
			attach.setBno(vo.getBno());
			attachMapper.insert(attach);
		}
		return 1;
	}

	@Override
	public int update(BoardVO vo) {
		return boardMapper.update(vo);
	}

	@Override
	public int delete(BoardVO vo) {
		return boardMapper.delete(vo);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		return boardMapper.getTotalCount(cri);
	}

	@Override
	public BoardAttachVO attachRead(String uuid) {
		return attachMapper.read(uuid);
	}
}
