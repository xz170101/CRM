package com.dyz.service;

 
import java.util.ArrayList;
import java.util.List;

import javax.swing.text.html.HTMLDocument.HTMLReader.ParagraphAction;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dyz.dao.ModuleMapper;
import com.dyz.dao.RoleMapper;
import com.dyz.entity.Fenye;
import com.dyz.entity.Module;
import com.dyz.entity.Role;
import com.dyz.entity.RoleModules;
import com.dyz.util.TreeModel;
import com.dyz.util.TreeNode;
 
@Service
public class RoleServiceImp implements RoleService{
	@Autowired
	private RoleMapper roleMapper;
	@Autowired
	private ModuleMapper moduleMapper;

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
	/**
	 * 查询角色模块【树形】
	 */
	@Override
	public ArrayList<TreeModel> selectRoleModules(Integer roles_Id) {
 		ArrayList<Module> roleModu = roleMapper.selectRoleModu(roles_Id);
		ArrayList<Module> list = moduleMapper.selectModules(); //查询所有
 		ArrayList<TreeModel> tree = new ArrayList<>();
        for (Module module : list) {
        	System.out.println("要开始添加了+++++++++++++++++");
        	TreeModel node = new TreeModel();
	        	for(Module module1 : roleModu) {
	        		if(module.getParentId()!=0) {
		        		if(module.getModules_Id()==module1.getModules_Id() ) {
		        			node.setChecked(true); 
		        			System.out.println("备选中的磨块 ："+module1);
		        		}
		        	}
	        	}
	            node.setId(module.getModules_Id());
	            node.setText(module.getModules_Name());
	            node.setParent_id(module.getParentId());
            tree.add(node);
        } 
        return TreeNode.getTree(tree);
	}
	@Override
	public Integer insertRoleModules(String modules_Ids,Integer roles_Id) {
		// TODO Auto-generated method stub
		roleMapper.deleteRoleModuleByRoleId(roles_Id);
		System.out.println("字符串： ++++++++++++++++"+modules_Ids);
		System.out.println(roles_Id);
		 String[] arr=modules_Ids.split(",");
		 Integer module_Id;
		if(modules_Ids!="" && modules_Ids!=null) {
			for(int i=0;i<arr.length;i++) {
				System.out.println("选中模块：+++++++"+arr[i]);
				module_Id=Integer.parseInt(arr[i]);
				roleMapper.insertRoleModule(module_Id,roles_Id);
				System.out.println(i);
			}
		}else {
			return 0;
		}
		//roleMapper.insertRoleModule();
 		return 1;
	}
 

}
