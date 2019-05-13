package com.dyz.dao;

import java.util.List;

import com.dyz.entity.Fenye;
import com.dyz.entity.Role;
import com.dyz.entity.User;
import com.dyz.entity.UserRole;

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
	/**
	 * 根据id查村所有用户的角色
	 * @param user_Id
	 * @return
	 */
	List<Role> selectUserRole(Integer user_Id);
	/**
	 * 查询所有的角色
	 * @return
	 */
	List<Role> selectRole();
	/**
	 * 添加用户角色
	 * @param userRole
	 * @return
	 */
	Integer inertUserRol(UserRole userRole);
	/**
	 * 移除用户角色
	 * @param userRole
	 * @return
	 */
	Integer delUserRol(UserRole userRole);
	/**
	 * 根据用户名查询用户信息
	 */
	User findByloginName(String loginName);
	/**
	 * 注册用户
	 * @param user
	 * @return
	 */
	//Integer addUser(User user);
	/**
	 * 根据用户名查询用户
	 * @param loginName
	 * @return
	 */
	Integer selectByName(String loginName);
	/**
	 * 根据用户名查询是否锁定
	 * @param loginName
	 * @return
	 */
	Integer selectByNameLockout(String loginName);
	/**
	 * 修改最后登录时见
	 * @param user
	 * @return
	 */
	Integer updateUserLoginTime(User user);
	/**
	 * 根据用户名和密码查询用户信息
	 * @param user
	 * @return
	 */
	User selectUse(User user);
}
