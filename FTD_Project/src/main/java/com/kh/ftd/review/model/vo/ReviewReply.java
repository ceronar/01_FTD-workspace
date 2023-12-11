package com.kh.ftd.review.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor //기본 매개변수 생성자
@Getter // getter 메소드들
@Setter // setter 메소드들
@ToString // toString 메소드 오버라이딩
public class ReviewReply {
	
		private int replyNo;	//	REPLY_NO	NUMBER
		private int revNo;	//	REV_NO	NUMBER
		private int memberNo;	//	MEMBER_NO	NUMBER
		private String replyContent;	//	REPLY_CONTENT	VARCHAR2(3000 BYTE)
		private Date createDate;	//	CREATE_DATE	DATE
		private Date dareteDate;	//	DELETE_DATE	DATE
	
}
