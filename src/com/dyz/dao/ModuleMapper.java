package com.dyz.dao;

import java.util.ArrayList;
import java.util.List;

import com.dyz.entity.Module;
import com.dyz.entity.Role;

  

public interface ModuleMapper {
	/**
	 * 查询所有模块
	 * @return
	 */
	ArrayList<Module> selectModules();
	/**
	 * 根据Id修改模块
	 */
	Integer updateModule(Module module);
	/**
	 * 添加模块信息
	 */
	Integer insertModule(Module module);
	/**
	 * 根据id删除模块
	 */
	Integer delModule(Integer modules_Id);
	/**
	 * 根据id查询模块信息
	 * @param modules_Id
	 * @return
	 */
	Module selectModuleByMId(Integer modules_Id);
	/**
	 * 查是否有角色引用这个模块
	 * @param modules_Id
	 * @return
	 */
	List<Role> selectRoleByModuleId(Integer modules_Id);

}
