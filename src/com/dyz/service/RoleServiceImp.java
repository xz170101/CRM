package com.dyz.service;

 
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dyz.dao.ModuleMapper;
import com.dyz.dao.RoleMapper;
import com.dyz.entity.Fenye;
import com.dyz.entity.Module;
import com.dyz.entity.Role;
import com.dyz.util.TreeModel;
import com.dyz.util.TreeNode;
 
@Service
public class RoleServiceImp implements RoleService{
	@Autowired
	private RoleMapper roleMapper;
	@Autowired
	private ModuleMapper moduleMapper;
	/**
	 * 分页查询所有的角色
	 */
	@Override
	public Fenye getRole(Fenye fenye) {
		Integer total=roleMapper.getCont(fenye);
		List<Role> rows=roleMapper.selectRoles(fenye);
		fenye.setTotal(total);
		fenye.setRows(rows);
		return fenye;
	}
	/**
	 * 修改角色信息
	 */
	@Override
	public Integer updateRole(Role role) {
		// TODO Auto-generated method stub
		return roleMapper.updateRole(role);
	}
/**
 * 添加角色
 */
	@Override
	public Integer insertRole(Role role) {
		// TODO Auto-generated method stub
		return roleMapper.insertRole(role);
	}
	/**
	 * 删除角色
	 * 先查询该角色是否拥有模块
	 * 若没有角色则删
	 */
	@Override
	public Integer delRole(Integer roles_Id) {
		// TODO Auto-generated method stub
		ArrayList<Module> i=roleMapper.selectRoleModu(roles_Id);
		System.out.println("角色：：：：："+i);
		if(i.isEmpty()) {
			return roleMapper.delRole(roles_Id);
		}else {
			return 0;
		}
	}
	/**
	 * 查询角色模块【树形】
	 * 返回树形json
	 */
	@Override
	public ArrayList<TreeModel> selectRoleModules(Integer roles_Id) {
 		ArrayList<Module> roleModu = roleMapper.selectRoleModu(roles_Id);//查询该角色具有的模块
		ArrayList<Module> list = moduleMapper.selectModules(); //查询所有模块
 		ArrayList<TreeModel> tree = new ArrayList<>();
        for (Module module : list) {
         	TreeModel node = new TreeModel();
        		if(module.getParentId()!=0) {//排除父节点，不让父节点Checked为true
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
	/**
	 * 根据角色id查询角色名称
	 */
	@Override
	public String selectbyRolesRid(Integer roles_Id) {
		// TODO Auto-generated method stub
		return roleMapper.selectbyRolesRid(roles_Id);
	}
 

}
