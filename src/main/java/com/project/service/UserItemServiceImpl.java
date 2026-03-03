package com.project.service;

import org.springframework.stereotype.Service;

import com.project.mapper.CoinMapper;
import com.project.mapper.UserItemMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserItemServiceImpl implements UserItemService{
	
	private final UserItemMapper mapper;
	private final CoinMapper coinMapper;

	
	

}
