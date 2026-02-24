package com.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mapper.CodeDetailMapper;

@Service
public class CodeDetailServiceImpl implements CodeDetailService{

	@Autowired
	private CodeDetailMapper mapper;
}
