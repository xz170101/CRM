package com.dyz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dyz.dao.RoleMapper;
import com.dyz.entity.Fenye;
import com.dyz.entity.Role;
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

}
