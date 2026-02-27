package com.project.service;

import java.util.List;

import com.project.common.domain.PageRequest;
import com.project.domain.Board;

public interface BoardService {

	int register(Board board) throws Exception;

	public List<Board> list() throws Exception;

	public List<Board> list(PageRequest pageRequest) throws Exception;

	Board read(Board board) throws Exception;

	int modify(Board board) throws Exception;

	int remove(Board board) throws Exception;

	// public int count() throws Exception;
	
	public int count(PageRequest pageRequest) throws Exception;

}
