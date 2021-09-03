package com.yedam.app.board.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	
	private Long bno;		 // 게시글 번호
	private String title;	 // 제목
	private String content;	 // 내용
	private String writer;	 // 작성자
	private Date regdate;	 // 작성일
	private Date updatedate; // 수정일 
}
