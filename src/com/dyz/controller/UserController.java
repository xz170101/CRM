package com.dyz.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
 
import com.dyz.entity.Fenye;
import com.dyz.entity.Role;
import com.dyz.entity.User;
import com.dyz.entity.UserRole;
import com.dyz.service.UserService;
import com.dyz.util.MD5Util;
import com.dyz.util.Result;
import com.dyz.util.TreeModel;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	 /**
	 * 分页多条件查询用户信息
	 * @param fenye
	 * @return
	 */
	@RequestMapping(value="/selectUser",method=RequestMethod.POST)
	@ResponseBody
	public Fenye selectUser(Fenye fenye) {
		Integer row = Integer.parseInt((String)fenye.getRows().get(0));
		fenye.setPage((fenye.getPage()-1)*row);
		fenye.setPageSize(row);

		return userService.getUsers(fenye);
	}
	/**
	 * 查询所有角色
	 */
	@RequestMapping(value="/selectRole_user",method=RequestMethod.POST)
	@ResponseBody
	public  List<Role> selectRole_user() {
		 
		return userService.selectRoles();
	}
	/**
	 * 给用户添加角色
	 * @param userRole
	 * @return
	 */
	@RequestMapping(value="/addUserRole",method=RequestMethod.POST)
	@ResponseBody
	public Integer addUserRole(UserRole userRole) {
		 
		return userService.insertUserRole(userRole);
	}
	/**
	 * 给移除用户角色
	 * @param userRole
	 * @return
	 */
	@RequestMapping(value="/delUserRole",method=RequestMethod.POST)
	@ResponseBody
	public Integer delUserRole(UserRole userRole) {
		 
		return userService.delUserRole(userRole);
	}
	/**
	 * 根据id查询用户角色
	 * @return
	 */
	@RequestMapping(value="/selectUserRole",method=RequestMethod.POST)
	@ResponseBody
	public List<Role> selectUserRole(Integer user_Id){
		return userService.selectUserRoles(user_Id);
	}
	/**
	 * 重置密码
	 * @param loginName
	 * @return
	 */
	@RequestMapping(value="/resetPassword",method=RequestMethod.POST)
	@ResponseBody
	public Integer resetPassword(String loginName) {
		 
		return userService.updatePassword(loginName);
	} 
	/**
	 * 添加用户
	 * @return
	 */
	@RequestMapping(value="/addUser",method=RequestMethod.POST)
	@ResponseBody
	public Integer addUser(User user) {
		 user.setPassWord(MD5Util.MD5(user.getPassWord()));
		return  userService.inertUser(user);
	}
	/**
	 * 修改用户信息
	 * @param user
	 * @return
	 */
	@RequestMapping(value="/updateUser",method=RequestMethod.POST)
	@ResponseBody
	public Integer updateUser(User user) {
		return  userService.updateUser(user);
	}
	/**
	 * 删除用户
	 * @param user_Id
	 * @return
	 */
	@RequestMapping(value="/delUser",method=RequestMethod.POST)
	@ResponseBody
	public Integer delUser(Integer user_Id) {
		return  userService.delUser(user_Id);
	}
	/**
	 * 锁定用户
	 * @param user_Id
	 * @return
	 */
	@RequestMapping(value="/lockUser",method=RequestMethod.POST)
	@ResponseBody
	public Integer lockUser(Integer user_Id) {
		return  userService.lockUser(user_Id);
	}
	/**
	 * 解锁用户
	 * @param user_Id
	 * @return
	 */
	@RequestMapping(value="/unLockUser",method=RequestMethod.POST)
	@ResponseBody
	public Integer unLockUser(Integer user_Id) {
		return  userService.unLockUser(user_Id);
	}
		//关于用户登录的表单提交
 
	int count=0;//用来记录错误密码次数
	@RequestMapping(value ="/login", method = RequestMethod.POST)
	@ResponseBody
	public String login(User user, HttpServletResponse res,String reuser, String yzm, HttpSession session,Model model) {
		//String pwd1 = user.getPassWord();
		 System.out.println("登录名："+user.getLoginName());
		 System.out.println("密码："+user.getPassWord());
		String passWord = user.getPassWord();
		 user.setPassWord(MD5Util.MD5(user.getPassWord()));
		 String code =(String) session.getAttribute("randomcode_key");
		 if (!code.equalsIgnoreCase(yzm)) {
			return Result.toClient(false, "验证码不对");
		} else { 
			Integer name = userService.selectByName(user.getLoginName());//返回的是用户id
			if (name == null) {
				return Result.toClient(false, "用户名不存在");
			} else {
				User u = userService.selectLogin(user);
				 
				if (u == null) {
					count++;
						User use=new User();
						use.setUser_Id(name);
						use.setPsdWrongTime(count);
						userService.updateUser(use);
						if(count>3) {
 
							SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
							String time = s.format(new Date());
							use.setLockTime(time);
							use.setIsLockout(1);
							userService.lockUser(name);
							return Result.toClient(false, "输入次数大于三次，该用户已被锁定，请联系管理员解锁");
					}
					return Result.toClient(false, "密码不正确");
				} else {
					Integer lockout = userService.selectByNameLockout(user.getLoginName());
					if (lockout != null) {
						return Result.toClient(false, "该用户被锁定，请联系管理员解锁");
					} else {
						 if ("y".equals(reuser)) {
							Cookie uname = new Cookie("u_name", u.getLoginName());
							uname.setMaxAge(60*60*24*7);
							res.addCookie(uname);
							Cookie pwd = new Cookie("u_pwd", passWord);
							pwd.setMaxAge(60*60*24*7);
							res.addCookie(pwd);
						} 
						//该登录时间
						User us=new User();
						SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
						String time = s.format(new Date());
						us.setLoginTime(time);
						us.setUser_Id(u.getUser_Id());
						userService.updateUser(us);
						session.setAttribute("user", u);
						return Result.toClient(true, (u != null ? true : false) == true ? "crmIndex" : "登录失败");
					}
				}
			}
		 } 
	}
		/**
		 * 管理首页树
		 * @param s
		 * @return
		 */
		@RequestMapping(value ="/getSysRightsHtmlTree", method = RequestMethod.POST)
		@ResponseBody
		public ArrayList<TreeModel> getModules(HttpSession session) {
			User users = (User) session.getAttribute("user");
			return userService.selectUsersByroles(users.getUser_Id());
		}
		/**
		 * 修改密码
		 * @param session
		 * @return
		 */
		@RequestMapping(value ="/setPwd", method = RequestMethod.POST)
		@ResponseBody
		public Integer setPwd(User user) {
			user.setPassWord(MD5Util.MD5(user.getPassWord()));
			return userService.UpdatePwd(user);
		}
		@RequestMapping(value ="/newUser", method = RequestMethod.POST)
		@ResponseBody
		public Integer newUser(User user) {
			 user.setPassWord(MD5Util.MD5(user.getPassWord()));
			return userService.insertUser(user);
		}
		/**
		 * 根据用户名查询用户
		 * @param user
		 * @return
		 */
		@RequestMapping(value ="/selectUserByName", method = RequestMethod.POST)
		@ResponseBody
		public Integer selectUserByName(String loginName) {
 			Integer i=userService.selectByName(loginName);
			if(i==null) {
				return 0;
			}else {
				return 1;
			}
		}
	   //注销方法
    @RequestMapping(value="/outLogin", method = RequestMethod.POST)
    @ResponseBody
    public Integer outLogin(HttpSession session){
        //通过session.invalidata()方法来注销当前的session
        session.invalidate();
        return 1;
    } 
}
