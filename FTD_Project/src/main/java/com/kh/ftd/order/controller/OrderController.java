package com.kh.ftd.order.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.ftd.order.model.service.OrderService;
import com.kh.ftd.order.model.vo.Order;

@Controller
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	
	@RequestMapping(value = "basket.me")
	public String memberBasketList() {
		return "member/memberBasket";
	}
	
	@RequestMapping(value = "paySuccess")
	public void paySuccess(Order order, int[] goodNo, int[] goodCount) {
		
		System.out.println(order);
		
		int result1 = orderService.paySuccess(order);
		
		for(int i = 0; i < goodNo.length; i++) {
			System.out.println(goodNo[i]);
		}
		for(int i = 0; i < goodCount.length; i++) {
			System.out.println(goodCount[i]);
		}
		
		System.out.println(result1);
		
		
	}
	
}
