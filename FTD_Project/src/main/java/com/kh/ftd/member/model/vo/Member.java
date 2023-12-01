package com.kh.ftd.member.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Member {
	
	private int memberNo;		//	MEMBER_NO	NUMBER
	private String memberId;	//	MEMBER_ID	VARCHAR2(25 BYTE)
	private String memberPwd;	//	MEMBER_PWD	VARCHAR2(100 BYTE)
	private String memberName;	//	MEMBER_NAME	VARCHAR2(15 BYTE)
	private String email;		//	EMAIL	VARCHAR2(40 BYTE)
	private String phone;		//	PHONE	VARCHAR2(13 BYTE)
	private String address;		//	ADDRESS	VARCHAR2(100 BYTE)
	private String gender;		//	GENDER	CHAR(1 BYTE)
	private String status;			//	STATUS	DATE
	private String zipCode;    		 // 	VARCHAR2(5 BYTE)
	private String detailAddress;	// DETAIL_ADDRESS	VARCHAR2(100 BYTE)
}
