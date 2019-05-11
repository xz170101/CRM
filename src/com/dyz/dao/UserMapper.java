package com.dyz.dao;

import java.util.List;

import com.dyz.entity.Fenye;
import com.dyz.entity.User;

public interface UserMapper {
	/**
	 * 查询用户总条数
	 * @param fenye
	 * @return
	 */
	Integer getCount(Fenye fenye);
	/**
	 *分页 查询用户所有数据
	 * @param fenye
	 * @return
	 */
	List<User> selectUsers(Fenye fenye);
	/**
	 * 检验用户名是否存在
	 * @param loginName
	 * @return
	 */
	User selectUser(String loginName);
	/**
	 * 重置密码
	 */
	Integer updatePsd(String loginName);
	/**
	 * 添加用户
	 * @param user
	 * @return
	 */
	Integer inertUse(User user);
	/**
	 * 修改用户
	 * @param user
	 * @return
	 */
	Integer updateUse(User user);
	/**
	 * 根据id删除用户信息
	 * @param user_Id
	 * @return
	 */
	Integer delUse(Integer user_Id);
	/**
	 * 根据id锁定用户
	 * @param user_Id
	 * @return
	 */
	Integer lockUse(Integer user_Id);
	/**
	 * 跟据id解锁用户
	 * @param user_Id
	 * @return
	 */
	Integer unLockUse(Integer user_Id);

}
