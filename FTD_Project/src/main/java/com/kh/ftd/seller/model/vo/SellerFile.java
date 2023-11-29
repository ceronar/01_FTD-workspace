package com.kh.ftd.seller.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class SellerFile {

	private int fileNo;  			//	FILE_NO	NUMBER
	private int sellerNo; 			//	SELLER_NO	NUMBER
	private String originalName; 	//	ORIGINAL_NAME	VARCHAR2(400 BYTE)
	private String changeName; 		//	CHANGE_NAME	VARCHAR2(400 BYTE)
	private String createDate; 		//	CREATE_DATE	DATE
	private String deleteDate; 		//	DELETE_DATE	DATE
}
