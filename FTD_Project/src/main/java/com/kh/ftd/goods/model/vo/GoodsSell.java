package com.kh.ftd.goods.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class GoodsSell {

	private int sellNo;  			//	SELL_NO	NUMBER
	private int sellerNo; 			//	SELLER_NO	NUMBER
	private int goodNo; 			//	GOOD_NO	NUMBER
	private String sellTitle; 		//	SELL_TITLE	VARCHAR2(100 BYTE)
	private String sellContent; 	//	SELL_CONTENT	VARCHAR2(3000 BYTE)
	private int count; 				//	COUNT	NUMBER
	private String createDate; 		//	CREATE_DATE	DATE
	private String deleteDate; 		//	DELETE_DATE	DATE
}
