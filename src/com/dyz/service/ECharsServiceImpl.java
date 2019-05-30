package com.dyz.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dyz.dao.ECharsMapper;
import com.dyz.entity.Role;
@Service
public class ECharsServiceImpl implements ECharsService {
	
	@Autowired
	private ECharsMapper eCharsMapper;
	/**
	 * 查询所有的员工
	 */
	@Override
	public Integer selectUserCount() {
		// TODO Auto-generated method stub
		return eCharsMapper.selectUserCount();
	}
	/**
	 * 查寻所有的客户
	 */
	@Override
	public Integer selectStudentCount() {
		// TODO Auto-generated method stub
		return eCharsMapper.selectStudentCount();
	}
	/**
	 * 查询成交客户数量
	 */
	@Override
	public Integer selectTransactionCount() {
		// TODO Auto-generated method stub
		return eCharsMapper.selectTransactionCount();
	}
	/**
	 * 查询当日上班人数
	 */
	@Override
	public Integer selectUserCheckCount() {
		// TODO Auto-generated method stub
		return eCharsMapper.selectUserCheckCount();
	}
	/**
	 * 查看各角色的人数
	 */
	@Override
	public List<Map<Integer, String>> selectRoseCount() {
		// TODO Auto-generated method stub
		System.out.println("*************"+eCharsMapper.selectRoseCount());
		return eCharsMapper.selectRoseCount();
	}
	/**
	 * 饼图查看客户来源
	 */
	@Override
	public List<Map<Integer, String>> selectStuSourceUrl() {
		// TODO Auto-generated method stub
		return eCharsMapper.selectStuSourceUrl();
	}
	

}
