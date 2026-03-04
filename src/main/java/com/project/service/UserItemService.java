package com.project.service;

import java.util.List;

import com.project.domain.Item;
import com.project.domain.Member;
import com.project.domain.UserItem;

public interface UserItemService {
	
	//구매상품 등록처리
	void register(Member member, Item item) throws Exception;

	List<UserItem> list(Member member) throws Exception;

	UserItem read(UserItem userItem) throws Exception;


}
