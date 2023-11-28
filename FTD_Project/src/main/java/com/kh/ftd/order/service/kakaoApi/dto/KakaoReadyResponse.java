package com.kh.ftd.order.service.kakaoApi.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
* 
* 결제 요청 시 카카오에게 받음
*/
@Getter
@Setter
@ToString
public class KakaoReadyResponse {

    private String tid; // 결제 고유 번호
    private String next_redirect_pc_url; // 결제 페이지
    private String created_at;
}
