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
	

	// UserDetailsService에서 사용하는 read
	public Member readByUserId(Member m) throws Exception;

	public int modify(Member member) throws Exception;

	// 권한 삭제
	public void deleteAuth(Member member) throws Exception;

	// 권한 수정
	public void modifyAuth(MemberAuth memberAuth) throws Exception;

	// 회원 삭제
	public int remove(Member member) throws Exception;

	// 전체 회원 수 반환
	public int countAll() throws Exception;

	public int getCoin(Member member) throws Exception;

}
