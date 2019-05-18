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
}
