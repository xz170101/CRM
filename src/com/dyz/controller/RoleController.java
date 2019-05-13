package com.dyz.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.dyz.entity.Fenye;
import com.dyz.entity.Module;
import com.dyz.entity.Role;
import com.dyz.entity.RoleModules;
import com.dyz.service.RoleService;
import com.dyz.util.TreeModel;

@Controller
public class RoleController {
	@Autowired
	private RoleService roleService;
	
	/**
	 * 分页查询所有角色
	 * @param fenye
	 * @return
	 */
	@RequestMapping(value="/selectRole",method=RequestMethod.POST)
	@ResponseBody
	public Fenye selectRole(Fenye fenye) {
		Integer row = Integer.parseInt((String)fenye.getRows().get(0));
		fenye.setPage((fenye.getPage()-1)*row);
		fenye.setPageSize(row);
 		return roleService.getRole(fenye)
	}
	/**
	 * 修改角色信息
	 * @param role
	 * @return
	 */
	@RequestMapping(value="/updateRole",method=RequestMethod.POST)
	@ResponseBody
	public Integer updateRole(Role role) {
		return  roleService.updateRole(role);
	}
	@RequestMapping(value="/insertRole",method=RequestMethod.POST)
	@ResponseBody
	public Integer insertRole(Role role) {
		return  roleService.insertRole(role);
	}
	@RequestMapping(value="/delRole",method=RequestMethod.POST)
	@ResponseBody
	public Integer delRole(Integer roles_Id) {
		return  roleService.delRole(roles_Id);
	}
	/**
	 * 根据id查询角色具有的模块
	 * @param roles_Id
	 * @return
	 */
	@RequestMapping(value="/selectModuleByRoleId",method=RequestMethod.POST)
	@ResponseBody
	public List<Module> selectRoleMod(Integer roles_Id) {
		return  roleService.selectRoleModules(roles_Id);
	}
	
	@RequestMapping(value="/saveRoleMod",method=RequestMethod.POST)
	@ResponseBody
	public Integer saveRoleMod(RoleModules roleModules) {
		System.out.println("+++++++++++++"+roleModules);
		return  roleService.saveRoleModules(roleModules);
	}
}
