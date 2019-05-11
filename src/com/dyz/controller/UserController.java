package com.dyz.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dyz.entity.Fenye;
import com.dyz.entity.User;
import com.dyz.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	@RequestMapping(value="/selectUser",method=RequestMethod.POST)
	@ResponseBody
	private Fenye selectUser(Fenye fenye) {
		Integer row = Integer.parseInt((String)fenye.getRows().get(0));
		fenye.setPage((fenye.getPage()-1)*row);
		fenye.setPageSize(row);
		return userService.getUsers(fenye);
	}
	//重置密码
	@RequestMapping(value="/resetPassword",method=RequestMethod.POST)
	@ResponseBody
	private Integer resetPassword(String loginName) {
		 
		return userService.updatePassword(loginName);
	} 
	/**
	 * 添加用户
	 * @return
	 */
	@RequestMapping(value="/addUser",method=RequestMethod.POST)
	@ResponseBody
	private Integer addUser(User user) {
		 
		return  userService.inertUser(user);
	}
	/**
	 * 修改用户信息
	 * @param user
	 * @return
	 */
	@RequestMapping(value="/updateUser",method=RequestMethod.POST)
	@ResponseBody
	private Integer updateUser(User user) {
		return  userService.updateUser(user);
	}
	/**
	 * 删除用户
	 * @param user_Id
	 * @return
	 */
	@RequestMapping(value="/delUser",method=RequestMethod.POST)
	@ResponseBody
	private Integer delUser(Integer user_Id) {
		return  userService.delUser(user_Id);
	}
	/**
	 * 锁定用户
	 * @param user_Id
	 * @return
	 */
	@RequestMapping(value="/lockUser",method=RequestMethod.POST)
	@ResponseBody
	private Integer lockUser(Integer user_Id) {
		return  userService.lockUser(user_Id);
	}
	/**
	 * 解锁用户
	 * @param user_Id
	 * @return
	 */
	@RequestMapping(value="/unLockUser",method=RequestMethod.POST)
	@ResponseBody
	private Integer unLockUser(Integer user_Id) {
		return  userService.unLockUser(user_Id);
	}
/**
 * 检验是否重复
 * @param loginName
 
	@RequestMapping(value="/check",method=RequestMethod.POST) 
	@ResponseBody 
	private User  checkout(String loginName){ 
			System.out.println("检验执行"); 
			PrintWriter out = null; 
			//调用service层方法findXueyuan(xueyuan_name) 
			User list=  userService.selectUser(loginName); 
			//if(null != list && !list.isEmpty()) 判断集合是否为空，如果为空说明当前没有学院名，否则改学院已经存在 
			if(list==null){ 
				return  1;
				}else{ 
				return 2;
			} 
		 
		}
		*/
	 
}
