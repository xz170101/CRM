package com.dyz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dyz.dao.UserMapper;
import com.dyz.entity.Fenye;
import com.dyz.entity.Role;
import com.dyz.entity.User;
import com.dyz.entity.UserRole;

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
 
}
