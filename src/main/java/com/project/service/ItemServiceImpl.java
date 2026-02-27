package com.project.service;

import org.springframework.stereotype.Service;

import com.project.mapper.ItemMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ItemServiceImpl implements ItemService{

	
	private final ItemMapper mapper;
}
