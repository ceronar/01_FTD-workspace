package com.kh.ftd.order.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ftd.member.model.vo.Member;
import com.kh.ftd.order.model.service.OrderService;
import com.kh.ftd.order.model.vo.Cart;
import com.kh.ftd.order.model.vo.Order;
import com.kh.ftd.order.model.vo.OrderGoods;

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
	
	@PostMapping(value = "paySuccess")
	public String paySuccess(Cart cart, OrderGoods orderGoods, Model model, Order order, int[] goodNo, int[] goodCount, int[] goodPrice) {
		
		Integer beforeResult = orderService.selectPeyNumber(order); // tid가 이미 있는지 체크
		if(beforeResult != null) { // 있으면 이미 진행된 결제
			model.addAttribute("errorMsg", "이미 결제된 내역입니다.");
			return "common/errorPage";
		} else {
			int result = orderService.paySuccess(order);
			int memberNo = order.getMemberNo();
			cart.setMemberNo(memberNo);
			int result1 = 1;
			if(result > 0) {
				int orderNo = orderService.selectPeyNumber(order); // 주문번호 조회해오기
				for(int i = 0; i < goodNo.length; i++) {
					orderGoods.setOrderNo(orderNo);
					orderGoods.setGoodNo(goodNo[i]);
					orderGoods.setCount(goodCount[i]);
					orderGoods.setPrice(goodPrice[i]);
					// GOOD_NO 로 CART STATUS UPDATE
					// ORDERGOODS 에 GOOD_NO 랑 COUNT 로 INSERT
					result1 *= orderService.insertOrderGoods(orderGoods);
					// CART 에 memberNo 와 goodNo 로 산 STATUS update
					cart.setGoodNo(goodNo[i]);
					result1 *= orderService.updateBuyCart(cart);
				}
				// 모든 orderGoods 가 제대로 완료 되었다면 result1 > 0
				if(result1 > 0) {
					// 결제 성공 페이지로
					return "order/paySuccessView";
				} else { 
					// 하나라도 실패
					model.addAttribute("errorMsg", "주문 실패. 관리자에게 문의 바랍니다.");
					return "common/errorPage";
				}
			}
			// paySuccess 실패했을 경우
			model.addAttribute("errorMsg", "결제 실패. 관리자에게 문의 바랍니다.");
			return "common/errorPage";
		}
	}
	
	@ResponseBody
	@RequestMapping("ajaxDeleteCart.me")
	public String ajaxDeleteCart(Cart cart, int memberNo, int goodNo) {
		System.out.println(cart);
		cart.setMemberNo(memberNo);
		cart.setGoodNo(goodNo);
		int result = orderService.ajaxDeleteCart(cart);
		if(result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
}
