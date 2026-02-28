package com.project.service;

import java.util.List;

import com.project.domain.Comments;

public interface CommentsService {

	public int add(Comments comments) throws Exception;

	public List<Comments> read(Long boardNo) throws Exception;

	public void remove(Comments comments) throws Exception ;
}
