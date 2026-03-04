package com.project.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.domain.ChargeCoin;
import com.project.mapper.CoinMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CoinServiceImpl implements CoinService{

	private final CoinMapper mapper;

	@Override
	@Transactional
	public void charge(ChargeCoin chargeCoin) throws Exception {
		//코인충전 내역 인서트,사용자 코인충전 총 두 가지가 필요
		mapper.charge(chargeCoin);
		mapper.create(chargeCoin);
	}

	@Override
	public List<ChargeCoin> list(int userNo) throws Exception {
		return mapper.list(userNo);
	}
	
	
	
	
	
}
