package com.project.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Comments {
	private Long commentNo;
    private Long boardNo;
    private String writer;
    private String content ;
    private Date createdAt;
	
}
