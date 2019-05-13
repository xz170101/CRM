package com.dyz.dao;

import java.util.ArrayList;
import java.util.List;

import com.dyz.entity.Fenye;
import com.dyz.entity.Module;
import com.dyz.entity.Role;
import com.dyz.entity.RoleModules;

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
	/**
	 * 根据角色id查询该教师下的模块
	 * @param roles_Id
	 * @return
	 */
	ArrayList<Module> selectRoleModu(Integer roles_Id);
	/**
	 * 创建用户角色
	 * @param roleModules
	 * @return
	 */
	Integer addRoleModule(RoleModules roleModules);
}
