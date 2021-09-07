package com.yedam.app.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.yedam.app.board.domain.Criteria;
import com.yedam.app.board.domain.ReplyVO;
import com.yedam.app.board.service.ReplyService;

@RestController
@RequestMapping("/reply/*")
public class ReplyRestController {
	
	@Autowired
	ReplyService replyService;
	
	// 헤당 게시글의 댓글만
	@GetMapping("/")
	public List<ReplyVO> replyGetList(Criteria cri, @RequestParam Long bno) {
		return replyService.replyGetList(cri, bno);
	}
	
	// 댓글 조회
	@GetMapping("/{rno}")
	public ReplyVO replyRead(@PathVariable Long rno, ReplyVO vo) {
		vo.setRno(rno);
		return replyService.replyRead(vo);
	}
	
	// 댓글 등록
	@PostMapping("/")		// post: 파라미터 질의문자열(query string) -> ?id=100&pw=111&name=choi
	public ReplyVO replyInsert(ReplyVO vo) {
		replyService.replyInsert(vo);
		return vo;
	}
	
	// 댓글 수정
	@PutMapping("/")		// put, delete : 파라미터 json -> { id:100, pw:"111", name:"choi" }
	public ReplyVO replyUpdate(@RequestBody ReplyVO vo) {
		replyService.replyUpdate(vo);
		return replyService.replyRead(vo);
	}
	
	// 댓글 삭제
	@DeleteMapping("/{rno}")
	public boolean replyDelete(@PathVariable Long rno, ReplyVO vo) {
		vo.setRno(rno);
		int result = replyService.replyDelete(vo);
		return result == 1 ? true : false;
	}
}
