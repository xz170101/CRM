package com.dyz.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dyz.dao.ModuleMapper;
import com.dyz.entity.Module;
import com.dyz.util.TreeModel;
import com.dyz.util.TreeNode;
@Service
public class ModuleServiceImp implements ModuleService {
	@Autowired
	private ModuleMapper moduleMapper;
	@Override
	public ArrayList<TreeModel> selectModu() {
		// TODO Auto-generated method stub
		ArrayList<TreeModel> root = new ArrayList<>();
		ArrayList<Module> list = moduleMapper.selectModules();
		   ArrayList<TreeModel> tree = new ArrayList<>();
           for (Module module : list) {
               TreeModel node = new TreeModel();
               node.setId(module.getModules_Id());
               node.setText(module.getModules_Name());
               //node.setState(module.getIs_open());
             //  node.setLevel_id(module.getLevel_id());
               node.setParent_id(module.getParentId());
               tree.add(node);
           }//简单的来说，就是把数据库里所有数据查出来之后，然后一条一条的封装，扔进TreeModel里，作为一个个节点，然后放在ArrayList里
           // 构造树
          // root = TreeNode.getTree(tree);
       return TreeNode.getTree(tree);
	//	return moduleMapper.selectModules();
	}

	@Override
	public Integer updateModu(Module module) {
		// TODO Auto-generated method stub
		return moduleMapper.updateModule(module);
	}

	@Override
	public Integer insertModu(Module module) {
		// TODO Auto-generated method stub
		return moduleMapper.insertModule(module);
	}

	@Override
	public Integer delModu(Integer modules_Id) {
		// TODO Auto-generated method stub
		return moduleMapper.delModule(modules_Id);
	}

}
