package com.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mapper.CodeMapper;

@Service
public class CodeServiceImpl implements CodeService{
	
	@Autowired
	private CodeMapper mapper;
}
