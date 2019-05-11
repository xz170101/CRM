package com.dyz.service;

import java.util.List;

import com.dyz.entity.Fenye;
import com.dyz.entity.User;

public interface UserService {
	/**
	 * 分页查询是所有用户信息
	 * @param fenye
	 * @return
	 */
	Fenye getUsers(Fenye fenye);
	/**
	 * 重置密码
	 * @param loginName
	 * @return
	 */
	Integer updatePassword(String loginName);
	/**
	 * 添加用户
	 * @param user
	 * @return
	 */
	Integer inertUser(User user);
	/**
	 * 修改用户新息
	 * @param user
	 * @return
	 */
	Integer updateUser(User user);
	/**
	 * 根据id删除用户
	 * @param user_Id
	 * @return
	 */
	Integer delUser(Integer user_Id);
	/**
	 * 根据id锁定用户
	 * @param user_Id
	 * @return
	 */
	Integer lockUser(Integer user_Id);
	/**
	 * 根据id解锁用户
	 * @param user_Id
	 * @return
	 */
	Integer unLockUser(Integer user_Id);
	/**
	 * 检验用户名是否重复
	 * @param loginName
	 * @return
	 */
	User selectUser(String loginName);
	 

}
