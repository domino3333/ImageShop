package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.CodeGroup;
import com.project.mapper.CodeGroupMapper;

@Service
public class CodeGroupServiceImpl implements CodeGroupService {

	@Autowired
	private CodeGroupMapper mapper;

	@Override
	public int register(CodeGroup codeGroup) throws Exception {
		return mapper.create(codeGroup);
	}

	@Override
	public List<CodeGroup> list() throws Exception {
		return mapper.list();
	}

	// 상세 페이지
	@Override
	public CodeGroup read(CodeGroup groupCode) throws Exception {
		return mapper.read(groupCode);
	}

	@Override
	public int remove(CodeGroup groupCode) throws Exception {
		
		return mapper.delete(groupCode);
	}

}
