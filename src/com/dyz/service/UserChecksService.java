package com.dyz.service;

import com.dyz.entity.Fenye;

public interface UserChecksService {
	/**
	 * 分页查询签到信息
	 * @param fenye
	 * @return
	 */
	Fenye selectUserChecks(Fenye fenye);
}
