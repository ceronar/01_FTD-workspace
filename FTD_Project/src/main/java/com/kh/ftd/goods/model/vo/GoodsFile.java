package com.kh.ftd.goods.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class GoodsFile {
	
	private int fileNo;				//	FILE_NO	NUMBER
	private int sellNo;				//	SELL_NO	NUMBER
	private String originalName; 	//	ORIGINAL_NAME	VARCHAR2(300 BYTE)
	private String changeName; 		//	CHANGE_NAME	VARCHAR2(300 BYTE)
	private String createDate; 		//	CREATE_DATE	DATE
	private String deleteDate;		//	DELETE_DATE	DATE
	
	
	public GoodsFile(String originalName, String changeName) {
		super();
		this.originalName = originalName;
		this.changeName = changeName;
	}
		
}


