package com.kh.ftd.promotion.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor // 기본생성자
//@AllArgsConstructor // 모든 필드에 대한 매개변수 생성자
//앞으로 모든 필드에 대한 매개변수 생성자를 만들 일이 거의 없음!!
//=> 스프링에서는 개발자인 내가 new 구문을 작성하여 객체를 생성할 일이 거의 없고,
//커맨드 객체 방식으로 스프링이 VO 객체를 만들어 줄 때, 
//	  기본생성자 + setter 로 만들어 주기 때문
@Getter // getter 메소드들
@Setter // setter 메소드들
@ToString // toString 메소드 오버라이딩
public class PromotionFile {

	private int fileNo;			//	FILE_NO
	private int promotionNo;			//	PROMOTION_NO
	private String originalName;			//	ORIGINAL_NAME
	private String changeName;			//	CHANGE_NAME
	private Date createDate;			//	CREATE_DATE
	private Date deleteDate;			//	DELETE_DATE

}
