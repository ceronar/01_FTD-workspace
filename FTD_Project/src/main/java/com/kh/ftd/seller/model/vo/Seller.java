package com.kh.ftd.seller.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Seller {
	
	private int sellerNo;		//	SELLER_NO		NUMBER
	private String companyName;	//	COMPANY_NAME	VARCHAR2(100 BYTE)
	private String sellerId;	//	SELLER_ID		VARCHAR2(25 BYTE)
	private String sellerPwd;	//	SELLER_PWD		VARCHAR2(100 BYTE)
	private String sellerName;	//	SELLER_NAME		VARCHAR2(15 BYTE)
	private String companyNo;	//	COMPANY_NO		VARCHAR2(12 BYTE)
	private String businessNo;	//	BUSINESS_NO		VARCHAR2(30 BYTE)
	private String address;		//	ADDRESS			VARCHAR2(30 BYTE)
	private String email;		//	EMAIL			VARCHAR2(40 BYTE)
	private String phone;		//	PHONE			VARCHAR2(13 BYTE)
	private String accountNo;	//	ACCOUNT_NO		VARCHAR2(30 BYTE)
	private String deleteDate;	//	DELETE_DATE		DATE
	private String enrollDate;	//	ENROLL_DATE		DATE
	private String acceptDate;	//	ACCEPT_DATE		DATE
	private String refuseReason;//	REFUSE_REASON	VARCHAR2(30 BYTE)
	private String changeName; 	//  판매자 이미지 path
	private int subscribeCount; // 찜 갯수
	private double starRating;	// 별점
}
