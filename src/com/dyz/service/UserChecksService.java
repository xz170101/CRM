package com.dyz.service;

import com.dyz.entity.Fenye;
import com.dyz.entity.UserChecks;

public interface UserChecksService {
	/**
	 * 分页查询签到信息
	 * @param fenye
	 * @return
	 */
	Fenye selectUserChecks(Fenye fenye);
	
	/**
	 * 签退所有的员工
	 * @return
	 */
	Integer updateQuanTui();
	/**
	 * 修改签到信息
	 * @param userchecks
	 * @return
	 */
	Integer updateUserchecks(UserChecks userchecks);
	/**
	 * 查询改户的签到状态
	 * @param userid
	 * @return
	 */
	Integer selectcheckstate(int user_Id);
	/**
	 * 查询当天已签到的员工
	 * @param checkid
	 * @return
	 */
	Integer selectdangtian(Integer user_Id);
	/**
	 * 查询签到表是否有该员工
	 * @param user_Id
	 * @return
	 */
	Integer selectByUserCheck(Integer user_Id);
	/**
	 * 添加员工签到信息
	 * @param usercheck
	 * @return
	 */
	Integer insertUserChecks(UserChecks usercheck);
}
