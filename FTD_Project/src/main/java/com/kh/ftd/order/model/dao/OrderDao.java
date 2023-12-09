package com.kh.ftd.order.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.ftd.order.model.vo.Cart;
import com.kh.ftd.order.model.vo.Order;
import com.kh.ftd.order.model.vo.OrderGoods;

@Repository
public class OrderDao {
	
	public ArrayList<Cart> memberBasketList(SqlSession sqlsession, int memberNo) {
		return (ArrayList)sqlsession.selectList("orderMapper.memberBasketList", memberNo);
	}
	
	public int paySuccess(SqlSession sqlsession, Order order) {
		return sqlsession.insert("orderMapper.paySuccess", order);
	}

	public Integer selectPeyNumber(SqlSession sqlsession, Order order) {
		return sqlsession.selectOne("orderMapper.selectPeyNumber", order);
	}

	public int insertOrderGoods(SqlSession sqlsession, OrderGoods orderGoods) {
		return sqlsession.insert("orderMapper.insertOrderGoods", orderGoods);
	}

	public int updateBuyCart(SqlSession sqlsession, Cart cart) {
		return sqlsession.update("orderMapper.updateBuyCart", cart);
	}

	public int ajaxDeleteCart(SqlSession sqlsession, Cart cart) {
		return sqlsession.delete("orderMapper.ajaxDeleteCart", cart);
	}

}
