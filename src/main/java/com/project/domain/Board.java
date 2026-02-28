package com.project.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Board {
	private Long boardNo;
	private String title;
	private String content;
	private String writer;
	private Date regDate;
	private int commentCount;
	
}
