package com.project.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.domain.Item;
import com.project.mapper.ItemMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ItemServiceImpl implements ItemService{

	
	private final ItemMapper mapper;

	@Override
	@Transactional
	public int register(Item item) throws Exception {
		return mapper.register(item);
	}

	@Override
	public List<Item> list() throws Exception {
		return mapper.list();
	}

	@Override
	public String getPreview(Item item) throws Exception {
		return mapper.getPreview(item);
	}

	@Override
	public String getPicture(Item item) throws Exception {
		return mapper.getPicture(item);
	}

	@Override
	public Item read(Item item) throws Exception {
		return mapper.read(item);
	}

	@Override
	public int modify(Item item) throws Exception {
		return mapper.modify(item);
	}
}
