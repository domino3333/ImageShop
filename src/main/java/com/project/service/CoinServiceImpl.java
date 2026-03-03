package com.project.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.project.domain.ChargeCoin;
import com.project.mapper.CoinMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CoinServiceImpl implements CoinService{

	private final CoinMapper mapper;

	@Override
	public void charge(ChargeCoin chargeCoin) throws Exception {
		mapper.charge(chargeCoin);
	}

	@Override
	public List<ChargeCoin> list(int userNo) throws Exception {
		return mapper.list(userNo);
	}
	
	
	
	
	
}
