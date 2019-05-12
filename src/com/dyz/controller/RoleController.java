package com.dyz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dyz.entity.Fenye;
import com.dyz.entity.Role;
import com.dyz.entity.User;
import com.dyz.service.RoleService;
import com.dyz.service.UserService;

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
	private Fenye selectRole(Fenye fenye) {
		Integer row = Integer.parseInt((String)fenye.getRows().get(0));
		fenye.setPage((fenye.getPage()-1)*row);
		fenye.setPageSize(row);
		System.out.println(roleService.getRole(fenye));
		return roleService.getRole(fenye);
	}
	/**
	 * 修改角色信息
	 * @param role
	 * @return
	 */
	@RequestMapping(value="/updateRole",method=RequestMethod.POST)
	@ResponseBody
	private Integer updateRole(Role role) {
		return  roleService.updateRole(role);
	}
	@RequestMapping(value="/insertRole",method=RequestMethod.POST)
	@ResponseBody
	private Integer insertRole(Role role) {
		return  roleService.insertRole(role);
	}
	@RequestMapping(value="/delRole",method=RequestMethod.POST)
	@ResponseBody
	private Integer delRole(Integer roles_Id) {
		return  roleService.delRole(roles_Id);
	}
	

}
