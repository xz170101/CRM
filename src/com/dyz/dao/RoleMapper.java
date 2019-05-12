package com.dyz.dao;

import java.util.List;

import com.dyz.entity.Fenye;
import com.dyz.entity.Role;

public interface RoleMapper {
	/**
	 * 查询所有角色
	 */
	Integer getCont(Fenye fenye);
	/**
	 * 分页查询所有角色
	 * @return
	 */
	List<Role> selectRoles(Fenye fenye);
	/**
	 * 根据Id修改角色
	 */
	Integer updateRole(Role role);
	/**
	 * 添加角色信息
	 */
	Integer insertRole(Role role);
	/**
	 * 根据id删除角色
	 */
	Integer delRole(Integer roles_Id);
}
