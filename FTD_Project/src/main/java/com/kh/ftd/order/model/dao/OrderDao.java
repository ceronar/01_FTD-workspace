package com.kh.ftd.order.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.ftd.order.model.vo.Order;

@Repository
public class OrderDao {

	public int paySuccess(SqlSession sqlsession, Order order) {
		return sqlsession.insert("orderMapper.paySuccess", order);
	}

}
