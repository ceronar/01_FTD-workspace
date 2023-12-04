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
public class Review {
	
	private int revNo;				//	REV_NO
	private int memberNo;			//	MEMBER_NO
	private int goodNo;				//	GOOD_NO
	private String revTitle;		//	REV_TITLE
	private String revContent;		//	REV_CONTENT
	private int count;				//	COUNT
	private int starRatting;		//	STAR_RATING
	private Date createDate;		//	CREATE_DATE
	private Date deleteDate;		//	DELETE_DATE

}
