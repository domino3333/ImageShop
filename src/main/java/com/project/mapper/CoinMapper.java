package com.project.mapper;

import java.util.List;

import com.project.domain.ChargeCoin;

public interface CoinMapper {

	void charge(ChargeCoin chargeCoin) throws Exception;

	List<ChargeCoin> list(int userNo) throws Exception;

}
