package com.project.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.domain.Item;
import com.project.domain.Member;
import com.project.domain.PayCoin;
import com.project.domain.UserItem;
import com.project.mapper.CoinMapper;
import com.project.mapper.UserItemMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserItemServiceImpl implements UserItemService {

	private final UserItemMapper mapper;
	private final CoinMapper coinMapper;

	@Override
	public List<UserItem> list(Member member) throws Exception {
		return mapper.list(member);
	}

	@Override
	public UserItem read(UserItem userItem) throws Exception {
		return mapper.read(userItem);
	}

	// 구매 상품 등록 처리
	@Transactional
	@Override
	public void register(Member member, Item item) throws Exception {
		//사용자의 PK
		int userNo = member.getUserNo();
		
		//구입한 물건 정보
		int itemId = item.getItemId();
		int price = item.getPrice();
		String itemName = item.getItemName();
		
		//장바구니 등록
		UserItem userItem = new UserItem();
		userItem.setUserNo(userNo);
		userItem.setItemId(itemId);
		
		//구입한 물건에 대한 코인 지급
		PayCoin payCoin = new PayCoin();
		payCoin.setUserNo(userNo);
		payCoin.setItemId(itemId);
		payCoin.setAmount(price);
		payCoin.setItemName(itemName);
		coinMapper.pay(payCoin); // 코인 차감
		coinMapper.createPayHistory(payCoin); // 구매 내역 등록
		
		//장바구니 생성
		mapper.create(userItem);
	}

}
