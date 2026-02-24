package com.project.mapper;

import com.project.domain.CodeDetail;

public interface CodeDetailMapper {
	// 등록 처리
	public Integer create(CodeDetail codeDetail) throws Exception;
	// 그룹코드 정렬 순서의 최대값
	public Integer getMaxSortSeq(String groupCode) throws Exception;
	// 목록 페이지
	
	// 상세 페이지
	
	// 삭제 처리

	// 수정 처리

}
