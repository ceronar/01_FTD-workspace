package com.kh.ftd.admin.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Chart {
	
	private String postingDate;	// POSTING_DATE
	private int postCount;		// POST_COUNT
	private String payDate;		// PAY_DATE
	private int dayPayPrice;	// DAY_PAYPRICE
}
