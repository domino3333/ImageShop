package com.project.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.domain.Notice;
import com.project.mapper.NoticeMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class NoticeServiceImpl implements NoticeService {

	private final NoticeMapper mapper;

	@Override
	@Transactional
	public int register(Notice notice) throws Exception {
		return mapper.register(notice);
	}

	@Override
	public List<Notice> list() throws Exception {
		return mapper.list();
	}

	@Override
	public Notice read(Notice notice) throws Exception {
		return mapper.read();
	}
	
}
