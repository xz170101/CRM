package com.dyz.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dyz.dao.RoleMapper;
import com.dyz.entity.Fenye;
import com.dyz.entity.Module;
import com.dyz.entity.Role;
import com.dyz.entity.RoleModules;
import com.dyz.util.TreeModel;
import com.dyz.util.TreeNode;
@Service
public class RoleServiceImp implements RoleService{
	@Autowired
	private RoleMapper roleMapper;

	@Override
	public Fenye getRole(Fenye fenye) {
		Integer total=roleMapper.getCont(fenye);
		List<Role> rows=roleMapper.selectRoles(fenye);
		fenye.setTotal(total);
		fenye.setRows(rows);
		return fenye;
	}
	@Override
	public Integer updateRole(Role role) {
		// TODO Auto-generated method stub
		return roleMapper.updateRole(role);
	}

	@Override
	public Integer insertRole(Role role) {
		// TODO Auto-generated method stub
		return roleMapper.insertRole(role);
	}

	@Override
	public Integer delRole(Integer roles_Id) {
		// TODO Auto-generated method stub
		return roleMapper.delRole(roles_Id);
	}
	/**
	 * 查询角色模块【树形】
	 */
	@Override
	public List<Module> selectRoleModules(Integer roles_Id) {
		 return roleMapper.selectRoleModu(roles_Id);
	}
	@Override
	public Integer saveRoleModules(RoleModules roleModules) {
		// TODO Auto-generated method stub
		System.out.println("被选到的模块"+roleModules.getModules_Id());
		return roleMapper.addRoleModule(roleModules);
	}
	// 所有被选中的角色模块
	@Override
	public List<Map<String, Object>> selectAllModulesCheckedByRoles(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

}
