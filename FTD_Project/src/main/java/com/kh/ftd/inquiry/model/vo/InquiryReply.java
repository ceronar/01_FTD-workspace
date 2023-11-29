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
public class InquiryReply {
	
	private int replyNo;			//REPLY_NO	NUMBER
	private int inqNo;				//INQ_NO	NUMBER
	private String memberNo;		//MEMBER_NO	NUMBER
	private String replyContent;	//REPLY_CONTENT	VARCHAR2(3000 BYTE)
	private Date createDate;		//CREATE_DATE	DATE
	private Date deleteDate;		//DELETE_DATE	DATE
	
}
