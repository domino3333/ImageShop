package com.project.service;

import java.util.List;

import com.project.domain.CodeDetail;

public interface CodeDetailService {

	// 등록 처리
	public int register(CodeDetail codeDetail) throws Exception;

	// 목록 페이지
	public List<CodeDetail> list() throws Exception;

	// 상세 페이지
	
	// 삭제 처리

	// 수정 처리

}
