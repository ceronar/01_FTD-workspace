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
public class NoticeFile {
	
	private int fileNo;			//FILE_NO	NUMBER
	private int noticeNo;		//NOTICE_NO	NUMBER
	private String originName;	//ORIGIN_NAME	VARCHAR2(400 BYTE)
	private String changeName;	//CHANGE_NAME	VARCHAR2(400 BYTE)
	private Date createDate;	//CREATE_DATE	DATE
	private Date deleteDate;	//DELETE_DATE	DATE
	
}
