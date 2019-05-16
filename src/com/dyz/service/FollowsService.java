package com.dyz.service;

import com.dyz.entity.Fenye;
import com.dyz.entity.NetFollows;

public interface FollowsService {
	/**
	 *查询所有跟踪的学生
	 * @param fenye
	 * @return
	 */
	Fenye selectFollows(Fenye fenye);
	/**
	 * 添加跟踪信息
	 * @param follows
	 * @return
	 */
	Integer insertFollows(NetFollows follows);
}
