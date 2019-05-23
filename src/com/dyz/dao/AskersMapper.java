package com.dyz.dao;

import java.util.List;

import com.dyz.entity.Askers;
import com.dyz.entity.Fenye;

public interface AskersMapper {
	/**
	 * 分页多条件查询所有的咨询师
	 * @return
	 */
	List<Askers> selectAllAskers(Fenye fenye);
	/**
	 * 查询咨询师的总数
	 * @return
	 */
	Integer selectCountAskers(Fenye fenye);
	/**
	 * 查询已签到的咨询师	
	 * @return
	 */
	List<Askers> selectqiandao();
	/**
	 * 修改咨询师权重
	 * @param askers
	 * @return
	 */
	Integer updateWeight(Askers askers);
	
	
	/**
	 * 修改员工状态
	 * @param askers
	 * @return
	 */
	Integer updateAskers(Askers askers);
	/**
	 * 签退所有的员工
	 * @param askers
	 * @return
	 * 
	 */
	Integer updateQuanasker();
	/**
	 * 添加签到信息
	 * @return
	 */
	Integer insertAskerUsers(Askers askers);
	
	/**
	 * 查询是否有该员工
	 * @param userChecksId
	 * @return
	 */
	Integer selectByUsers(int userChecksId);
}
