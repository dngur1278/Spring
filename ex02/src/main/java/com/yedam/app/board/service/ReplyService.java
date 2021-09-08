package com.yedam.app.board.service;

import org.apache.ibatis.annotations.Param;

import com.yedam.app.board.domain.Criteria;
import com.yedam.app.board.domain.ReplyPageVO;
import com.yedam.app.board.domain.ReplyVO;

public interface ReplyService {

	public ReplyPageVO replyGetList(@Param("cri") Criteria cri, @Param("bno") Long bno);

	public ReplyVO replyRead(ReplyVO vo);

	public int replyInsert(ReplyVO vo);

	public int replyUpdate(ReplyVO vo);

	public int replyDelete(ReplyVO vo);
	
	// 전체 댓글 수
	public int getCountByBno(Long bno);
}
