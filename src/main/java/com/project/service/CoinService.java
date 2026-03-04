package com.project.service;

import java.util.List;

import com.project.domain.ChargeCoin;
import com.project.domain.Member;
import com.project.domain.PayCoin;

public interface CoinService {

	// 코인 충전
	void charge(ChargeCoin chargeCoin) throws Exception;

	List<ChargeCoin> list(int userNo) throws Exception;

	// 코인 차감
	public void pay(PayCoin payCoin) throws Exception;

	// 구매 내역 등록
	public void createPayHistory(PayCoin payCoin) throws Exception;

	// 구매 내역 조회
	public List<PayCoin> listPayHistory(Member member) throws Exception;

}
