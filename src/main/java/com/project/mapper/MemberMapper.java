package com.project.mapper;

import java.util.List;

import com.project.domain.Member;
import com.project.domain.MemberAuth;

public interface MemberMapper {

	// 등록 처리
	public int create(Member member) throws Exception;

	// 권한 생성
	public void createAuth(MemberAuth memberAuth) throws Exception;

	// 멤버 목록
	public List<Member> list() throws Exception;

	// 멤버 상세
	public Member read(Member member) throws Exception;

}
