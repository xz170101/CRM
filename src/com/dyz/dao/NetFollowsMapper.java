package com.dyz.dao;

import java.util.List;

import com.dyz.entity.Fenye;
import com.dyz.entity.NetFollows;


public interface NetFollowsMapper {
	/**
	 * 查询所有已跟踪的学生
	 * @param fenye
	 * @return
	 */
	List<NetFollows> selectNetFollows(Fenye fenye);
	/**
	 * 查询总条数
	 * @param fenye
	 * @return
	 */
	Integer selectCount(Fenye fenye);
	/**
	 * 添加跟踪信息
	 * @param follows
	 * @return
	 */
	Integer insertFollows(NetFollows follows);
}
