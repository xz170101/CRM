package com.dyz.service;

import java.util.ArrayList;
 

import com.dyz.entity.Module;
import com.dyz.util.TreeModel;

public interface ModuleService {
	/**
	 * 查询所有模块
	 * @return
	 */
	ArrayList<TreeModel> selectModu();
	/**
	 * 根据Id修改模块
	 */
	Integer updateModu(Module module,Integer k);
	/**
	 * 添加模块信息
	 */
	Integer insertModu(Module module);
	/**
	 * 根据id删除模块
	 */
	Integer delModu(Integer modules_Id);
	/**
	 * 根据id传模块信息
	 * @param modules_Id
	 * @return
	 */
	Module selectModuleById(Integer modules_Id);

}
