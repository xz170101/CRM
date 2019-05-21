package com.dyz.dao;

import java.util.List;

import com.dyz.entity.Fenye;
import com.dyz.entity.UserChecks;

public interface UserChecksMapper {
	/**
	 * 分页多条件查询签到信息
	 * @param fenye
	 * @return
	 */
	List<UserChecks> selectUserChecks(Fenye fenye);
	/**
	 * 查询总条数
	 * @param fenye
	 * @return
	 */
	Integer selectCount(Fenye fenye);
	
	/**
	 * 修改签到信息
	 * @param userchecks
	 * @return
	 */
	Integer updateUserchecks(UserChecks userchecks);
	/**
	 * 查询修改户的签到状态
	 * @param userid
	 * @return
	 */
	Integer selectcheckstate(int user_Id);
	/**
	 * 签退所有的员工
	 * @return
	 */
	Integer updateQuanTui();
}
