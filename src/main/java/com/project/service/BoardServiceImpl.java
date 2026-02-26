package com.project.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.common.domain.PageRequest;
import com.project.domain.Board;
import com.project.mapper.BoardMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService {

	private final BoardMapper mapper;

	@Override
	@Transactional
	public int register(Board board) throws Exception {

		return mapper.register(board);
	}

	@Override
	public List<Board> list() throws Exception {
		return mapper.list();
	}

	@Override
	public List<Board> list(PageRequest pageRequest) throws Exception {
		return mapper.list(pageRequest);
	}

	@Override
	public Board read(Board board) throws Exception {
		return mapper.read(board);
	}

	@Override
	@Transactional
	public int modify(Board board) throws Exception {
		return mapper.modify(board);
	}

	@Override
	@Transactional
	public int remove(Board board) throws Exception {
		return mapper.remove(board);
	}

	@Override
	public int count() throws Exception {
		return mapper.count();
	}

}
