package com.project.service;

import java.util.List;

import com.project.domain.ChargeCoin;

public interface CoinService {

	// 코인 충전
	void charge(ChargeCoin chargeCoin) throws Exception;

	List<ChargeCoin> list(int userNo) throws Exception;

}
	