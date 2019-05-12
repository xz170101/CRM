package com.dyz.service;

import com.dyz.entity.Fenye;
import com.dyz.entity.Role;

public interface RoleService {
	/**
	 * 分页查询所有角色信息
	 * @param fenye
	 * @return
	 */
		Fenye getRole(Fenye fenye);
	/**
	 * 修改角色
	 * @param role
	 * @return
	 */
	Integer updateRole(Role role);
	/**
	 * 添加角色
	 * @param role
	 * @return
	 */
	Integer insertRole(Role role);
	/**
	 * 删除角色
	 * @param role_Id
	 * @return
	 */
	Integer delRole(Integer roles_Id);

}
