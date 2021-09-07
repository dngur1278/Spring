package com.yedam.app.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.app.board.domain.Criteria;
import com.yedam.app.board.domain.ReplyVO;
import com.yedam.app.board.mapper.ReplyMapper;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	ReplyMapper replyMapper; 
	
	@Override
	public List<ReplyVO> replyGetList(Criteria cri, Long bno) {
		return replyMapper.replyGetList(cri, bno);
	}

	@Override
	public ReplyVO replyRead(ReplyVO vo) {
		return replyMapper.replyRead(vo);
	}

	@Override
	public int replyInsert(ReplyVO vo) {
		return replyMapper.replyInsert(vo);
	}

	@Override
	public int replyUpdate(ReplyVO vo) {
		return replyMapper.replyUpdate(vo);
	}

	@Override
	public int replyDelete(ReplyVO vo) {
		return replyMapper.replyDelete(vo);
	}

}
