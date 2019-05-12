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
import com.dyz.service.ModuleService;
import com.dyz.service.RoleService;
import com.dyz.util.TreeModel;

@Controller
public class ModuleController {
	@Autowired
	private ModuleService moduleService;
	
	/**
	 * 分页查询所有角色
	 * @param fenye
	 * @return
	 */
	@RequestMapping(value="/selectModule",method=RequestMethod.POST)
	@ResponseBody
	public ArrayList<TreeModel> selectModule() {
		 
		return  moduleService.selectModu();
	}
	/**
	 * 修改角色信息
	 * @param role
	 * @return
	 */
	@RequestMapping(value="/updateModule",method=RequestMethod.POST)
	@ResponseBody
	public Integer updateModule(Module module) {
		return  moduleService.updateModu(module);
	}
	@RequestMapping(value="/insertModule",method=RequestMethod.POST)
	@ResponseBody
	public Integer insertModule(Module module) {
		return  moduleService.insertModu(module);
	}
	@RequestMapping(value="/delModule",method=RequestMethod.POST)
	@ResponseBody
	public Integer delModule(Integer modules_Id) {
		return  moduleService.delModu(modules_Id);
	}

}
