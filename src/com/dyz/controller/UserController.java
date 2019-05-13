package com.dyz.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dyz.entity.Fenye;
import com.dyz.entity.Role;
import com.dyz.entity.User;
import com.dyz.entity.UserRole;
import com.dyz.service.UserService;
import com.dyz.util.RandomValidateCode;
import com.dyz.util.Result;

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
			
		//关于用户登录的表单提交
		int count=0;//用来记录错误密码次数
		@RequestMapping(value ="/login", method = RequestMethod.POST)
		@ResponseBody
		public String login(User user, HttpServletResponse res,  String yzm, HttpSession session) {
			//String pwd1 = user.getPassWord();
			 System.out.println("登录名："+user.getLoginName());
			 System.out.println("密码："+user.getPassWord());
			String code = (String) session.getAttribute("code");
			/*if (!code.equalsIgnoreCase(yzm)) {
				return Result.toClient(false, "验证码不对");
			} else {*/
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
							/*if (yzm.equals("y")) {
								Cookie uname = new Cookie("u_name", u.getLoginName());
								uname.setMaxAge(24 * 60 * 7);
								res.addCookie(uname);
								Cookie pwd = new Cookie("u_pwd", pwd1);
								pwd.setMaxAge(24 * 60 * 7 * 60);
								res.addCookie(pwd);
							}*/
							//该登录时间
							User us=new User();
							SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
							String time = s.format(new Date());
							us.setLoginTime(time);
							us.setUser_Id(u.getUser_Id());
							userService.updateUser(us);
							session.setAttribute("user", u);
							return Result.toClient(true, (u != null ? true : false) == true ? "登录成功" : "登录失败");
						}
					}
				}

			/*}*/
		}

	 
	/*  //注销方法
    @RequestMapping("/outLogin")
    public String outLogin(HttpSession session){
        //通过session.invalidata()方法来注销当前的session
        session.invalidate();
        return "login";
    }*/
}
