package com.project.domain;

import java.util.Date;

import lombok.Data;

@Data
public class UserItem {
	//사용자 구매 테이블
	private int userItemNo;
	private int userNo;
	private int itemId;
	//구매한 상품 테이블 정보 (상품 테이블에서 가져온 필드)
	private String itemName;
	private Integer price;
	private String description;
	private String pictureUrl;
	
	private Date regDate;

}
