package com.dyz.controller;


import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
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
	@RequestMapping(value ="/login", method = RequestMethod.POST)
	@ResponseBody
	public String login( User user,String yes, String yzm,
			HttpSession session,HttpServletRequest req,HttpServletResponse res,Model model) {
		return userService.getLogin(user,yes, yzm, session, req, res, model);
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
		public Integer setPwd(User user,String pwd) {
			user.setPassWord(MD5Util.MD5(user.getPassWord()));
			return userService.UpdatePwd(user,pwd );
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
 		 return userService.selectByName(loginName);
		}
		/**
		 * 根据手机号查询用户 
		 * @param loginName
		 * @return
		 */
		@RequestMapping(value ="/selectUserByTel", method = RequestMethod.POST)
		@ResponseBody
		public Integer selectUserByTel(String protectMTel) {
			System.out.println("开始查询手机号咯+++++++++++++++++");
			return userService.selectUserByTel(protectMTel);
		}
	   //注销方法
    @RequestMapping(value="/outLogin", method = RequestMethod.POST)
    @ResponseBody
    public Integer outLogin(HttpSession session){
        //通过session.invalidata()方法来注销当前的session
    	//User users = (User) session.getAttribute("user");
        session.invalidate();
        return  1;
    } 
    
    /* int p= (int)((Math.random()*9+1)*100000);//获取6位随机验证码
 		IndustrySMS.setTo(phone);//发送到这个手机号
 		String smsContent = "【CRM管理平台】您的验证码为"+p+"，请于30分钟内正确输入，如非本人操作，请忽略此短信。";//发送的内容
 		IndustrySMS.setSmsContent(smsContent);//把发送的信息内容存到这个对象类中
 		IndustrySMS.execute();//执行发送验证码方法
 		request.getSession().setAttribute("p", p);//把验证码存入到键值并存在session中
 		 */
    
    
    /***
           * 找回密码
     * @return
     */
    @RequestMapping(value="/findPwd", method = RequestMethod.POST)
    @ResponseBody
    public Integer findPwd(){
        return  null  ;
    } 
}
