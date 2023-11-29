package com.kh.ftd.goods.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class SellReply {

	private int replyNo; 			//	REPLY_NO	NUMBER
	private int memberNo; 			//	MEMBER_NO	NUMBER
	private int sellNo;				//	SELL_NO	NUMBER
	private String replyContent; 	//	REPLY_CONTENT	VARCHAR2(100 BYTE)
	private String createDate; 		//	CREATE_DATE	DATE
	private String deleteDate; 		//	DELETE_DATE	DATE
}
