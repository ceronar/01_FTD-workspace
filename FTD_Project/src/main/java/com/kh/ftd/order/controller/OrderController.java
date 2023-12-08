package com.kh.ftd.order.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ftd.member.model.vo.Member;
import com.kh.ftd.order.model.service.OrderService;
import com.kh.ftd.order.model.vo.Cart;
import com.kh.ftd.order.model.vo.Order;

@Controller
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	
	@RequestMapping(value = "basket.me")
	public ModelAndView memberBasketList(HttpSession session, ModelAndView mv) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		int memberNo = loginUser.getMemberNo();
		ArrayList<Cart> list = orderService.memberBasketList(memberNo);
		mv.addObject("list", list).setViewName("member/memberBasket");
		return mv;
	}
	
	@RequestMapping(value = "paySuccess")
	public void paySuccess(Order order, int[] goodNo, int[] goodCount) {
		
		int result = 1;
		
		int result1 = orderService.paySuccess(order);
		
		int orderNo; // 주문번호 조회해오기
		
		if(result1 > 0) {
			for(int i = 0; i < goodNo.length; i++) {
				
				System.out.println(goodNo[i]); // GOOD_NO 로 CART STATUS UPDATE
											// ORDERGOODS 에 GOOD_NO 랑 COUNT 로 INSERT
				System.out.println(goodCount[i]);
			}
		}
		
		
		System.out.println(result1);
		
		
	}
	
}
