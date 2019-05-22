package com.dyz.service;



import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.dyz.entity.Fenye;
import com.dyz.entity.Role;
import com.dyz.entity.User;
import com.dyz.entity.UserRole;
import com.dyz.util.TreeModel;

public interface UserService {
	List<Role> selectUserRoles(Integer user_Id);
	/**
	 * 分页查询是所有用户信息
	 * @param fenye
	 * @return
	 */
	Fenye getUsers(Fenye fenye);
	/**
	 * 重置密码
	 * @param loginName
	 * @return
	 */
	Integer updatePassword(String loginName);
	/**
	 * 添加用户
	 * @param user
	 * @return
	 */
	Integer inertUser(User user);
	/**
	 * 修改用户新息
	 * @param user
	 * @return
	 */
	 Integer updateUser(User user);
	/**
	 * 根据id删除用户
	 * @param user_Id
	 * @return
	 */
	Integer delUser(Integer user_Id);
	/**
	 * 根据id锁定用户
	 * @param user_Id
	 * @return
	 */
	Integer lockUser(Integer user_Id);
	/**
	 * 根据id解锁用户
	 * @param user_Id
	 * @return
	 */
	Integer unLockUser(Integer user_Id);
	/**
	 * 检验用户名是否重复
	 * @param loginName
	 * @return
	 */
	User selectUser(String loginName);
	/**
	 * 查询所有的角色
	 * @return
	 */
	List<Role> selectRoles();
	/**
	 * 创建用户角色
	 * @param userRole
	 * @return
	 */
	Integer insertUserRole(UserRole userRole);
	/**
	 * 移除用户角色
	 * @param userRole
	 * @return
	 */
	Integer delUserRole(UserRole userRole);
	  
	String getPasswordByUsername(String username);
	/**
	 * 根据名字查询数据
	 * @param loginName
	 * @return
	 */
	 Integer selectByName(String loginName);
	/**
	 * 用户登录
	 * @param user
	 * @return
	 */
	//User selectLogin(User user);
	/**
	 * 修改用户的锁定状态
	 * @param user
	 * @return
	 */
	Integer updateLockUser(User user);
	
	/**
	 * 根据名字查询是否锁定
	 * @param loginName
	 * @return
	 */
	//Integer selectByNameLockout(String loginName);
	/**
	 * 根据角色查询
	 * @param user_Id
	 * @return
	 */
 	ArrayList<TreeModel> selectUsersByroles(Integer user_Id);
 	/**
 	 * 修改密码
 	 * @param user
 	 * @param pwd 
 	 * @return
 	 */
 	Integer UpdatePwd(User user, String pwd);
 	/**
 	 *注册用户
 	 * @param user
 	 * @return
 	 */
	Integer insertUser(User user);
	 /**
	  * 登录时的判断
	  * @param user
	  * @param yes
	  * @param yzm
	  * @param session
	  * @param req
	  * @param res
	  * @param model
	  * @return
	  */
	String getLogin(User user, String yes, String yzm, HttpSession session, HttpServletRequest req,
			HttpServletResponse res, Model model);
	/**
	 * 根据手机号查询用户
	 * @param protectMTel
	 * @return
	 */
	Integer selectUserByTel(String protectMTel);
	/**
	 * 找回密码
	 * @param user
	 * @param phoneCode
	 * @param request 
	 * @return
	 */
	//String findPassWord(User user, String phoneCode, HttpServletRequest request);
	/**
	 * 发送验证码
	 * @param user
	 * @return
	 */
	Integer sendToPhoneCode(User user,HttpServletRequest request);
	/**
	 * 发送密码到手机号
	 * @param user
	 * @param request
	 * @return
	 */
	Integer sendPwdToPhone(User user, HttpServletRequest request);
 
	/**
	 * 返回角色id
	 * @param u_id
	 * @return
	 */
	Integer selectLoginR_id(int userId);
	 
	 
}
