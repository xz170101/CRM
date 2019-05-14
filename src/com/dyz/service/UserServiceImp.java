package com.dyz.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dyz.dao.UserMapper;
import com.dyz.entity.Fenye;
import com.dyz.entity.Module;
import com.dyz.entity.Role;
import com.dyz.entity.User;
import com.dyz.entity.UserRole;
import com.dyz.util.TreeModel;
import com.dyz.util.TreeNode;

@Service
public class UserServiceImp implements UserService{
	@Autowired
	private UserMapper usermapper;
	/**
	 * 分页多条件查询所有用户信息
	 */
	@Override
	public Fenye getUsers(Fenye fenye) {
		// TODO Auto-generated method stub
		Integer total=usermapper.getCount(fenye);
		List<User> rows=usermapper.selectUsers(fenye);
		fenye.setTotal(total);
		fenye.setRows(rows);
		return fenye;
	}
	/**
	 * 重置密码
	 */
	@Override
	public Integer updatePassword(String loginName) {
		// TODO Auto-generated method stub
		return usermapper.updatePsd(loginName);
	}
	@Override
	public Integer inertUser(User user) {
		// TODO Auto-generated method stub
		return usermapper.inertUse(user);
	}
	@Override
	public Integer updateUser(User user) {
		// TODO Auto-generated method stub
		return usermapper.updateUse(user);
	}
	@Override
	public Integer delUser(Integer user_Id) {
		// TODO Auto-generated method stub
		return usermapper.delUse(user_Id);
	}
	@Override
	public Integer lockUser(Integer user_Id) {
		// TODO Auto-generated method stub
		return usermapper.lockUse(user_Id);
	}
	@Override
	public Integer unLockUser(Integer user_Id) {
		// TODO Auto-generated method stub
		return usermapper.unLockUse(user_Id);
	}
	@Override
	public User selectUser(String loginName) {
		// TODO Auto-generated method stub
		return usermapper.selectUser(loginName);
	}
	@Override
	public List<Role> selectUserRoles(Integer user_Id) {
		// TODO Auto-generated method stub
		return usermapper.selectUserRole(user_Id);
	}
	@Override
	public List<Role> selectRoles() {
		// TODO Auto-generated method stub
		return usermapper.selectRole();
	}
	@Override
	public Integer insertUserRole(UserRole userRole) {
		// TODO Auto-generated method stub
		Integer i=1;
		System.out.println("用户id:"+userRole.getUserId());
		List<Role> selectRole = usermapper.selectUserRole(userRole.getUserId());
		if(selectRole!=null) {
			for(Role r:selectRole) {
				System.out.println("角色id:"+r.getRoles_Id());
				if(r.getRoles_Id()==userRole.getRoleId()) {
					i=0;
				}
			}
		}
		if(i>0) {
			return usermapper.inertUserRol(userRole);
		}
		return 0;
		
	}
	/**
	 * 移除用户角色
	 */
	@Override
	public Integer delUserRole(UserRole userRole) {
		// TODO Auto-generated method stub
		return usermapper.delUserRol(userRole);
	}
	 
	////////////////////
	
	
	public boolean isUserExist(String username) {
		if (usermapper.findByloginName(username) == null) {
			return false;
		} else {
			return true;
		}
	}
 
	//根据提供的用户名拿密码
	public String getPasswordByUsername(String username) {
		return usermapper.findByloginName(username).getPassWord();
	}
	@Override
	public Integer selectByName(String loginName) {
		// TODO Auto-generated method stub
		return usermapper.selectByName(loginName);
	}
	/**
	 * 根据用户名和密码查询用户信息
	 */
	@Override
	public User selectLogin(User user) {
		// TODO Auto-generated method stub
		return usermapper.selectUse(user);
	}
	@Override
	public Integer updateLockUser(User user) {
		// TODO Auto-generated method stub
		return null;
	}
	/*@Override
	public Integer updateUsers(User user) {
		// TODO Auto-generated method stub
		return usermapper.updateUse(user);
	}*/
	@Override
	public Integer selectByNameLockout(String loginName) {
		// TODO Auto-generated method stub
		return usermapper.selectByNameLockout(loginName);
	}
	/**
	 * 根据角色查询所有模块
	 */
	 @Override
	public ArrayList<TreeModel> selectUsersByroles(Integer user_Id) {
		// TODO Auto-generated method stub
		 ArrayList<Module> list = usermapper.selectRoleModuleByUser(user_Id);
		 ArrayList<TreeModel> tree = new ArrayList<>();
         for (Module module : list) {
             TreeModel node = new TreeModel();
             node.setId(module.getModules_Id());
             node.setText(module.getModules_Name());
             //node.setState(module.getIs_open());
             //node.setLevel_id(module.getLevel_id());
             node.setParent_id(module.getParentId());
             tree.add(node);
         }//简单的来说，就是把数据库里所有数据查出来之后，然后一条一条的封装，扔进TreeModel里，作为一个个节点，然后放在ArrayList里
          System.out.println("yonghu shu:+++++++++++ "+TreeNode.getTree(tree));
         return TreeNode.getTree(tree);
	} 

 
}
