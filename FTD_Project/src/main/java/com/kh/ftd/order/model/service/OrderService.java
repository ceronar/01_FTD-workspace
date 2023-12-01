package com.kh.ftd.order.model.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ftd.order.model.dao.OrderDao;
import com.kh.ftd.order.model.vo.Order;

@Service
public class OrderService{
	
	@Autowired
	private SqlSession sqlsession;
	
	@Autowired
	private OrderDao orderDao;
	
	public int paySuccess(Order order) {
		return orderDao.paySuccess(sqlsession, order);
	}

}
