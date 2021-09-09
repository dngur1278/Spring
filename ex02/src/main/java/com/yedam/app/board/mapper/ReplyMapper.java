package com.yedam.app.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.app.board.domain.Criteria;
import com.yedam.app.board.domain.ReplyVO;

public interface ReplyMapper {
	
	public List<ReplyVO> replyGetList(@Param("cri") Criteria cri, 
								 	  @Param("bno") Long bno);
	
	public ReplyVO replyRead(ReplyVO vo);
	
	public int replyInsert(ReplyVO vo);
	
	public int replyUpdate(ReplyVO vo);
	
	public int replyDelete(ReplyVO vo);
	
	// 전체 댓글 수
	public int getCountByBno(Long bno);
	
	public void replyDeleteAll(Long bno);
}
