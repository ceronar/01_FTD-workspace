package com.kh.ftd.admin.model.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ftd.admin.model.dao.AdminDao;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDao adminDao;
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int totalMember() {
		return adminDao.totalMember(sqlSession);
	}
	
	@Override
	public int totalSeller() {
		return adminDao.totalSeller(sqlSession);
	}

	@Override
	public int totalMemberBoard() {
		return adminDao.totalMemberBoard(sqlSession);
	}

	@Override
	public int totalSellerBoard() {
		return adminDao.totalSellerBoard(sqlSession);
	}

	@Override
	public int totalSales() {
		return adminDao.totalSales(sqlSession);
	}




}
