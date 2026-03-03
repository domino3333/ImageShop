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
	@Transactional
	public void add(Comments comments) throws Exception {
		mapper.add(comments);
		mapper.updatePlusComments(comments);
	}


	@Override
	public List<Comments> read(Long boardNo) throws Exception {
		return mapper.read(boardNo);
	}


	@Override
	@Transactional
	public void remove(Comments comments) throws Exception {
		mapper.remove(comments);
		mapper.updateMinusComments(comments);
		
	}


	@Override
	public void modify(Comments comments) throws Exception {
		mapper.modify(comments);
	}



	
}
