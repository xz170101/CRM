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
}
