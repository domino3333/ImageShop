package com.project.service;

import java.util.List;

import com.project.common.domain.Board;

public interface BoardService {

	int register(Board board) throws Exception;

	public List<Board> list() throws Exception;

	Board read(Board board) throws Exception;

}
