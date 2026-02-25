package com.project.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.domain.Member;
import com.project.domain.MemberAuth;
import com.project.mapper.MemberMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService{

	
	private final MemberMapper mapper;

	@Override
	@Transactional
	public int register(Member member) throws Exception {
		
		int count = mapper.create(member);
		// 회원 권한 생성
		if(count!=0) {
			MemberAuth memberAuth = new MemberAuth();
			memberAuth.setAuth("ROLE_MEMBER");
			mapper.createAuth(memberAuth);
		}
		return count;

	}

	@Override
	public List<Member> list() throws Exception {
		
		return mapper.list();
	}
	
}
