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
		ArrayList<Module> i=roleMapper.selectRoleModu(roles_Id);
		if(i==null) {
			return roleMapper.delRole(roles_Id);
		}
		return 0;
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
         	TreeModel node = new TreeModel();
        		if(module.getParentId()!=0) {
        			for(Module module1 : roleModu) {
        				if(module1.getParentId()!=0) {
			        		if(module.getModules_Id()==module1.getModules_Id() ) {
			        			node.setChecked(true); 
			         		}
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
	/**
	 * 添加角色模块
	 */
	@Override
	public Integer insertRoleModules(String modules_Ids,Integer roles_Id) {
		// TODO Auto-generated method stub
		 int nn=roleMapper.deleteRoleModuleByRoleId(roles_Id);
		 System.out.println("本次删除角色模块：："+nn);
		 System.out.println("角色id::::::::::::"+roles_Id);
		 String[] arr=modules_Ids.split(",");
		 System.out.println("数组长度+++++++："+arr.length);
		 Integer module_Id;
		if(modules_Ids!="" && modules_Ids!=null) {
			for(int i=0;i<arr.length;i++) {
				 System.out.println("第"+i+"次添加");
				module_Id=Integer.parseInt(arr[i]);
 				roleMapper.insertRoleModule(module_Id,roles_Id);
			}
		}else {
			return 0;
		}
		//roleMapper.insertRoleModule();
 		return 1;
	}
 

}
