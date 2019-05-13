package com.dyz.service;

import com.dyz.entity.Fenye;

public interface FollowsService {
	/**
	 *查询所有跟踪的学生
	 * @param fenye
	 * @return
	 */
	Fenye selectFollows(Fenye fenye);
}
