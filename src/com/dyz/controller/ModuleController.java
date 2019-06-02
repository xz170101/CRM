package com.dyz.controller;

import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.dyz.entity.Module;
import com.dyz.service.ModuleService;
import com.dyz.util.TreeModel;

@Controller
public class ModuleController {
	@Autowired
	private ModuleService moduleService;
	
	/**
	 * 查询所有模块
	 * @param fenye
	 * @return
	 */
	@RequestMapping(value="/selectModule",method=RequestMethod.POST)
	@ResponseBody
	public ArrayList<TreeModel> selectModule() {
		 
		return  moduleService.selectModu();
	}
	@RequestMapping(value="/selectModuleById",method=RequestMethod.POST)
	@ResponseBody
	public Module selectModuleById(Integer modules_Id) {
		return  moduleService.selectModuleById(modules_Id);
	}
	/**
	 * 修改角色信息
	 * @param role
	 * @return
	 */
	@RequestMapping(value="/updateModule",method=RequestMethod.POST)
	@ResponseBody
	public Integer updateModule(Module module,Integer k) {
		return  moduleService.updateModu(module,k);
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
