package com.project.mapper;

import java.util.List;

import com.project.domain.Member;
import com.project.domain.UserItem;

public interface UserItemMapper {

	void create(UserItem userItem) throws Exception;

	List<UserItem> list(Member member) throws Exception;

	UserItem read(UserItem userItem) throws Exception;

}
