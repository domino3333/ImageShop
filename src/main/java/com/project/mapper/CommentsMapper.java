package com.project.mapper;

import java.util.List;

import com.project.domain.Comments;

public interface CommentsMapper {

	int add(Comments comments) throws Exception;

	List<Comments> read(Long boardNo) throws Exception;

	void remove(Comments comments) throws Exception;

	void updatePlusComments(Comments comments) throws Exception;

	void updateMinusComments(Comments comments) throws Exception;

	void modify(Comments comments) throws Exception;

}
