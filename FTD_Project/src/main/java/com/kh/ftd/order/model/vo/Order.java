package com.kh.ftd.order.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Order {
	
	private int orderNo; 			//	ORDER_NO	NUMBER
	private int memberNo; 			//	MEMBER_NO	NUMBER
	private String orderName; 		//	ORDER_NAME	VARCHAR2(15 BYTE)
	private String phone; 			//	PHONE		VARCHAR2(13 BYTE)
	private int price; 				//	PRICE		NUMBER
	private String zipCode;			//	ZIP_CODE	NUMBER
	private String address; 		//	ADDRESS		VARCHAR2(100 BYTE)
	private String detailAddress; 	//	DETAIL_		ADDRESS	VARCHAR2(100 BYTE)
	private String request; 		//	REQUEST		VARCHAR2(200 BYTE)
	private String payTid; 			//	PAY_TID		VARCHAR2(100 BYTE)
	private String payMethod;		//	PAY_METHOD	VARCHAR2(100 BYTE)
	private String payDate;			//	PAY_DATE	DATE
	private String payCancel; 		//	PAY_CANCEL	DATE
	private String status;			//	STATUS		DATE
}
