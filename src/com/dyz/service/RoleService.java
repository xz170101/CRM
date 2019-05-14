package com.dyz.service;

 
import java.util.List;
import java.util.Map;

import com.dyz.entity.Fenye;
import com.dyz.entity.Module;
import com.dyz.entity.Role;
import com.dyz.entity.RoleModules;
 

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
	List<Module> selectRoleModules(Integer roles_Id);
	/**
	 * 添加用户模块的方法
	 * @param roleModules
	 * @return
	 */
	Integer saveRoleModules(RoleModules roleModules);
	/**
	 * 所有被选中的角色模块
	 * @param id
	 * @return
	 */
	List<Map<String, Object>> selectAllModulesCheckedByRoles(Integer id);

}
