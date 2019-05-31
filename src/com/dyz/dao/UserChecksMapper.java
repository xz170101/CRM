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
