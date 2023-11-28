package com.kh.ftd.notice.model.vo;

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
public class Notice {

	private int noticeNo; //NOTICE_NO	NUMBER
	private String noticeTitle;//NOTICE_TITLE	VARCHAR2(400 BYTE)
	private String noticeContent;//NOTICE_CONTENT	VARCHAR2(3000 BYTE)
	private int count;//COUNT	NUMBER
	private Date createDate;//CREATE_DATE	DATE
	private Date deleteDate;//DELETE_DATE	DATE
	
}
