package com.dyz.service;



import java.util.List;

import com.dyz.entity.Fenye;
import com.dyz.entity.Role;
import com.dyz.entity.User;
import com.dyz.entity.UserRole;

public interface UserService {
	List<Role> selectUserRoles(Integer user_Id);
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
	/**
	 * 查询所有的角色
	 * @return
	 */
	List<Role> selectRoles();
	/**
	 * 创建用户角色
	 * @param userRole
	 * @return
	 */
	Integer insertUserRole(UserRole userRole);
	/**
	 * 移除用户角色
	 * @param userRole
	 * @return
	 */
	Integer delUserRole(UserRole userRole);
	 
	
	/**
	 * 判断用户现有角色
	 * @param user
	 * @return
	 */
/*	Integer panduanXianyoujuese(UserRole userRole);
*/
}
