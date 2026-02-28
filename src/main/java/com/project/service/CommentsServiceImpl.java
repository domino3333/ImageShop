package com.project.service;

import org.springframework.stereotype.Service;

import com.project.domain.Comments;
import com.project.mapper.CommentsMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CommentsServiceImpl implements CommentsService{

	private final CommentsMapper mapper;
	
	
	@Override
	public int add(Comments comments) throws Exception {
		return mapper.add(comments);
	}

	
}
