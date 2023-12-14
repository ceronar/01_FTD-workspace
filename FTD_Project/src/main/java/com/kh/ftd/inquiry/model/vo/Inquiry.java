package com.kh.ftd.inquiry.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Inquiry {

	private int inqNo; 				//INQ_NO	NUMBER
	private String sellerNo; 		//SELLER_NO	NUMBER
	private String memberNo; 		//MEMBER_NO	NUMBER
	private String inqTitle;		//INQ_TITLE	VARCHAR2(400 BYTE)
	private String inqContent; 		//INQ_CONTENT	VARCHAR2(3000 BYTE)
	private int count; 				//COUNT	NUMBER
	private Date createDate;		//CREATE_DATE	DATE
	private Date deleteDate;		//DELETE_DATE	DATE
	private String responseContent;	//RESPONSE_CONTENT	VARCHAR2(4000 BYTE)
	private Date responseDate;		//RESPONSE_DATE	DATE
	private String memberId;	
	private String companyName;		// COMPANY_NAME 상호명 조회용
}
