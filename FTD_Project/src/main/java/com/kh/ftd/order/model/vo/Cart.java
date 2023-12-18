package com.kh.ftd.order.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Cart {
	
	private	int cartNo;			//	CART_NO	NUMBER
	private	int memberNo;		//	MEMBER_NO	NUMBER
	private	int goodNo;			//	GOOD_NO	NUMBER
	private	int count;			//	COUNT	NUMBER
	private	String status;		//	STATUS	CHAR(1 BYTE)
	private String changeName; 	// CHANGE_NAME GOODS_FILE 에서 이미지 조회용
	private String goodTitle;	// GOOD_TITLE 상품 이름
	private int price;			// PRICE 상품 개별 가격
	private int stock;			// STOCK 상품 최대 개수
}
