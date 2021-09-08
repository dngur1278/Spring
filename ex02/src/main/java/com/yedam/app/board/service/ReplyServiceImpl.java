package com.yedam.app.board.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.app.board.domain.Criteria;
import com.yedam.app.board.domain.ReplyPageVO;
import com.yedam.app.board.domain.ReplyVO;
import com.yedam.app.board.mapper.BoardMapper;
import com.yedam.app.board.mapper.ReplyMapper;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	ReplyMapper replyMapper; 
	
	@Autowired
	BoardMapper boardMapper;
	
	@Override
	public ReplyPageVO replyGetList(Criteria cri, Long bno) {
		ReplyPageVO vo = new ReplyPageVO();
		vo.setReplyCnt(replyMapper.getCountByBno(bno));
		vo.setList(replyMapper.replyGetList(cri, bno));
		return vo;
	}

	@Override
	public ReplyVO replyRead(ReplyVO vo) {
		return replyMapper.replyRead(vo);
	}

	@Override
	public int replyInsert(ReplyVO vo) {
		boardMapper.updateReplycnt(vo.getBno(), 1L);
		return replyMapper.replyInsert(vo);
	}

	@Override
	public int replyUpdate(ReplyVO vo) {
		return replyMapper.replyUpdate(vo);
	}

	@Override
	public int replyDelete(ReplyVO vo) {
		boardMapper.updateReplycnt(vo.getBno(), -1L);
		return replyMapper.replyDelete(vo);
	}

	@Override
	public int getCountByBno(Long bno) {
		return replyMapper.getCountByBno(bno);
	}

}
