package com.dyz.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dyz.dao.ModuleMapper;
import com.dyz.entity.Module;
import com.dyz.entity.Role;
import com.dyz.util.TreeModel;
import com.dyz.util.TreeNode;
@Service
public class ModuleServiceImp implements ModuleService {
	@Autowired
	private ModuleMapper moduleMapper;
	@Override
	public ArrayList<TreeModel> selectModu() {
 		ArrayList<Module> list = moduleMapper.selectModules();
		   ArrayList<TreeModel> tree = new ArrayList<>();
           for (Module module : list) {
               TreeModel node = new TreeModel();
               node.setId(module.getModules_Id());
               node.setText(module.getModules_Name());
               node.setParent_id(module.getParentId());
               tree.add(node);
           }//简单的来说，就是把数据库里所有数据查出来之后，然后一条一条的封装，扔进TreeModel里，作为一个个节点，然后放在ArrayList里
           // 构造树
          // root = TreeNode.getTree(tree);
       return TreeNode.getTree(tree);
 	}
	/**
	 * 修改节点
	 */
	@Override
	public Integer updateModu(Module module) {
		// TODO Auto-generated method stub
 		Integer parentId = module.getParentId();
		String modules_Name = module.getModules_Name();
 		List<Module> modules=moduleMapper.selectModulesByParentId(parentId);//查询该模块下的所有节点
 		System.out.println("父节点下的所有模块"+modules);
 		/*if(modules!=null && modules.size() !=0) {
 			for(int i=0;i<modules.size();i++) {
  				if(modules_Name.equals(modules.get(i).getModules_Name())) {
 					return 0;
				} 
			}
		} */
		return moduleMapper.updateModule(module);
	}
/**
 * 添加节点
 */
	@Override
	public Integer insertModu(Module module) {
		// TODO Auto-generated method stub
		Integer parentId = module.getParentId();
		String modules_Name = module.getModules_Name();
 		List<Module> modules=moduleMapper.selectModulesByParentId(parentId);
 		System.out.println("父节点下的所有模块"+modules);
 		if(modules!=null && modules.size() !=0) {
			for(int i=0;i<modules.size();i++) {
				System.out.println("添加节点名称：：：：："+modules_Name);
				System.out.println("源节点名称：：：：："+modules.get(i).getModules_Name());
				if(modules_Name.equals(modules.get(i).getModules_Name())) {
 					return 0;
				} 
			}
		} 
			return moduleMapper.insertModule(module);
	}

	@Override
	public Integer delModu(Integer modules_Id) {
		// TODO Auto-generated method stub
		List<Role> i=moduleMapper.selectRoleByModuleId(modules_Id);
		if(i.isEmpty()) {
			return moduleMapper.delModule(modules_Id);
		}
		return 0;
	}

	@Override
	public Module selectModuleById(Integer modules_Id) {
		// TODO Auto-generated method stub
		return moduleMapper.selectModuleByMId(modules_Id);
	}

}
