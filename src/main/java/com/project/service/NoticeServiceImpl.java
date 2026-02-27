package com.project.service;

import org.springframework.stereotype.Service;

import com.project.mapper.NoticeMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class NoticeServiceImpl implements NoticeService {

	private final NoticeMapper mapper;
	
}
