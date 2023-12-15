package com.kh.ftd.order.model.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ftd.order.model.dao.OrderDao;
import com.kh.ftd.order.model.vo.Cart;
import com.kh.ftd.order.model.vo.Order;
import com.kh.ftd.order.model.vo.OrderGoods;

@Service
public class OrderService{
	
	@Autowired
	private SqlSession sqlsession;
	
	@Autowired
	private OrderDao orderDao;
	
	// 장바구니 list 조회
	public ArrayList<Cart> memberBasketList(int memberNo) {
		return orderDao.memberBasketList(sqlsession, memberNo);
	}
	
	// 주문 성공 insert
	public int paySuccess(Order order) {
		return orderDao.paySuccess(sqlsession, order);
	}
	
	// 주문번호 조회
	public Integer selectPeyNumber(Order order) {
		return orderDao.selectPeyNumber(sqlsession, order);
	}

	public int insertOrderGoods(OrderGoods orderGoods) {
		return orderDao.insertOrderGoods(sqlsession, orderGoods);
	}

	public int updateBuyCart(Cart cart) {
		return orderDao.updateBuyCart(sqlsession, cart);
	}

	public int ajaxDeleteCart(Cart cart) {
		return orderDao.ajaxDeleteCart(sqlsession, cart);
	}

	public ArrayList<Order> memberOrderList(int memberNo) {
		return orderDao.memberOrderList(sqlsession, memberNo);
	}
	
	public ArrayList<OrderGoods> sellerOrderGoodsList(int sellerNo) {
		return orderDao.sellerOrderGoodsList(sqlsession, sellerNo);
	}

}
