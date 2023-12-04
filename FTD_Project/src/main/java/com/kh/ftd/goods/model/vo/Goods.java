package com.kh.ftd.goods.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Goods {
	
	private int goodNo;				//	GOOD_NO	NUMBER
	private int sellerNo;			//	SELLER_NO	NUMBER
	private String goodTitle; 		//	GOOD_TITLE	VARCHAR2(100 BYTE)
	private String goodDetail; 		//	GOOD_DETAIL	VARCHAR2(3000 BYTE)
	private String origin; 			//	ORIGIN	VARCHAR2(100 BYTE)
	private int price; 				//	PRICE	NUMBER
	private String createDate; 		//	CREATE_DATE	DATE
	private String deleteDate;      // DELETE_DATE	DATE
	private String expiration; 		//	EXPIRATION_DATE	DATE
	private int stock; 				//	STOCK	NUMBER
}
