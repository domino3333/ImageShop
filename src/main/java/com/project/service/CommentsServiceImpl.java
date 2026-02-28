package com.project.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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


	@Override
	public List<Comments> read(Long boardNo) throws Exception {
		return mapper.read(boardNo);
	}


	@Override
	@Transactional
	public void remove(Comments comments) throws Exception {
		mapper.remove(comments);
		
	}

	
}
