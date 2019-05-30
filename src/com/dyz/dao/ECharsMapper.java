package com.dyz.dao;

import java.util.List;
import java.util.Map;

import com.dyz.entity.Role;
import com.dyz.entity.Student;

public interface ECharsMapper {
	
	/**
	 * 查询所有的用户
	 * @return
	 */
	Integer selectUserCount();
	/**
	 * 查询所有的客户
	 * @return
	 */
	Integer selectStudentCount();
	/**
	 * 查询成交的数量
	 * @return
	 */
	Integer selectTransactionCount();
	/**
	 * 查询今日上班的人数
	 * @return
	 */
	Integer selectUserCheckCount();
	/**
	 * 查看各角色的人 数
	 * @return
	 */
	List<Map<Integer, String>> selectRoseCount();
	/**
	 * 饼图查看客户来源
	 * @return
	 */
	List<Map<Integer, String>> selectStuSourceUrl();

}
