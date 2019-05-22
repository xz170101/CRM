package com.dyz.service;

 
import java.util.ArrayList;
import com.dyz.entity.Fenye;
import com.dyz.entity.Role;
import com.dyz.util.TreeModel;
 

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
	/**
	 * 根据id查询该角色具有的模块
	 * @param roles_Id
	 * @return
	 */
	ArrayList<TreeModel> selectRoleModules(Integer roles_Id);
	/**
	 * 添加用户模块的方法
	 * @param roleModules
	 * @return
	 */
	Integer insertRoleModules(String s,Integer roles_Id);
	/**
	 * 
	 * @param roles_Id
	 * @return
	 */
	String selectbyRolesRid(Integer roles_Id);
 
}
