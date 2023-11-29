package com.kh.ftd.order.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class OrderGoods {

	private int orderDetailNo; 	//	ORDER_DETAIL_NO	NUMBER
	private int orderNo; 		//	ORDER_NO	NUMBER
	private int goodNo; 		//	GOOD_NO	NUMBER
	private int count;			//	COUNT	NUMBER
	private int price; 			//	PRICE	NUMBER
	private String status;		//	STATUS	CHAR(1 BYTE)
}
