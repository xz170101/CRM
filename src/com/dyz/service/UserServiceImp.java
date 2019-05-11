package com.dyz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dyz.dao.UserMapper;
import com.dyz.entity.Fenye;
import com.dyz.entity.User;

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

}
