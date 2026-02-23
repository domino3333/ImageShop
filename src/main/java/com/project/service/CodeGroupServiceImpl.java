package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.domain.CodeGroup;
import com.project.mapper.CodeGroupMapper;

@Service
public class CodeGroupServiceImpl implements CodeGroupService {

	@Autowired
	private CodeGroupMapper mapper;

	@Override
	@Transactional
	public int register(CodeGroup groupCode) throws Exception {
		return mapper.create(groupCode);
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

	// 삭제 처리
	@Override
	@Transactional
	public int remove(CodeGroup groupCode) throws Exception {

		return mapper.delete(groupCode);
	}

	// 수정 처리
	@Override
	@Transactional
	public int modify(CodeGroup codeGroup) throws Exception {
		return mapper.modify(codeGroup);
	}

}
