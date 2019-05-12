package com.dyz.dao;

import java.util.ArrayList;
import java.util.List;

import com.dyz.entity.Module;

  

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

}
