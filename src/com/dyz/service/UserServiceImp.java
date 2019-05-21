package com.dyz.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.dyz.dao.UserMapper;
import com.dyz.entity.Fenye;
import com.dyz.entity.Module;
import com.dyz.entity.Role;
import com.dyz.entity.User;
import com.dyz.entity.UserRole;
import com.dyz.util.MD5Util;
import com.dyz.util.Result;
import com.dyz.util.SessionSave;
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
	/**
	 * 添加用户
	 */
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
	/**
	 * 删除模块
	 */
	@Override
	public Integer delUser(Integer user_Id) {
		// TODO Auto-generated method stub
		List<Role> i=usermapper.selectUserRole(user_Id);
		if(i==null) {
			return usermapper.delUse(user_Id);
		}
		return 0;
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
	
	
	/*public boolean isUserExist(String username) {
		if (usermapper.findByloginName(username) == null) {
			return false;
		} else {
			return true;
		}
	}*/
 
	//根据提供的用户名拿密码
	public String getPasswordByUsername(String username) {
		return usermapper.findByloginName(username).getPassWord();
	}
	@Override
	public Integer selectByName(String loginName) {
		// TODO Auto-generated method stub
		//Integer i=userService.selectByName(loginName);
		Integer i=usermapper.selectByName(loginName);
		if(i==null) {
			return 0;
		}else {
			return 1;
		}
	}
	/**
	 * 根据用户名和密码查询用户信息
	 */
	/*@Override
	public User selectLogin(User user) {
		// TODO Auto-generated method stub
		return usermapper.selectUse(user);
	}*/
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
	/*@Override
	public Integer selectByNameLockout(String loginName) {
		// TODO Auto-generated method stub
		return usermapper.selectByNameLockout(loginName);
	}*/
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
             node.setModules_path(module.getModules_path());
             node.setParent_id(module.getParentId());
             tree.add(node);
         }//简单的来说，就是把数据库里所有数据查出来之后，然后一条一条的封装，扔进TreeModel里，作为一个个节点，然后放在ArrayList里
         return TreeNode.getTree(tree);
	}
	 /**
	  * 修改用户密码【先判断原密码是否正确】
	  */
	@Override
	public Integer UpdatePwd(User user,String pwd) {
		// TODO Auto-generated method stub
		User u = usermapper.selectUse(user);//查询用户密码是否正确
		if(u!=null) {
			user.setPassWord(MD5Util.MD5(pwd));
			usermapper.updateUserPwd(user);
			return 1;
		}
		return 0;
	}
	@Override
	public Integer insertUser(User user) {
		// TODO Auto-generated method stub
		return usermapper.insertNewUser(user);
	}
	int count=0;
	@Override
	public String getLogin(User user, String yes, String yzm, HttpSession session, HttpServletRequest req,
			HttpServletResponse res, Model model) {
		// TODO Auto-generated method stub
		 String passWord = user.getPassWord();
		 user.setPassWord(MD5Util.MD5(user.getPassWord()));
		 String code =(String) session.getAttribute("randomcode_key");
		 if (!code.equalsIgnoreCase(yzm)) {
			return Result.toClient(false, "验证码不对");
		} else { 
			//根句登录名查询用户id判断是否存在该用户
			Integer nameId = usermapper.selectByName(user.getLoginName());//返回的是用户id
			if (nameId == null) {
				return Result.toClient(false, "用户名不存在");
			} else {
				//根据用户名和密码查询用户信息 判断密码是否正确
				User u = usermapper.selectUse(user);
				if (u == null) {
					count++;
						User use=new User();
						use.setUser_Id(nameId);
						use.setPsdWrongTime(count);
						//修改用户密码错误次数
						usermapper.updateUse(use);
						if(count>3) {
							SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
							String time = s.format(new Date());
							use.setLockTime(time);
							use.setIsLockout(1);
							//锁定用户
							usermapper.lockUse(nameId);
							return Result.toClient(false, "错误次数大于三次，该用户已被锁定，请联系管理员解锁！");
					}
					return Result.toClient(false, "密码不正确");
				} else {
						//判断该用户是否锁定
						Integer lockout = usermapper.selectByNameLockout(user.getLoginName());
						if (lockout != null) {
							return Result.toClient(false, "该用户被锁定，请联系管理员解锁!");
						} else {
							// 登录成功,保存当前用户登录的sessionId
								String sessionID = req.getRequestedSessionId();
								System.out.println("当前用户登录的sessionId：：：：："+sessionID);
								String userName = user.getLoginName();
								if (!SessionSave.getSessionIdSave().containsKey(userName)) {
									SessionSave.getSessionIdSave().put(userName, sessionID);
								}else if(SessionSave.getSessionIdSave().containsKey(userName)&&!sessionID.equals(SessionSave.getSessionIdSave().get(userName))){
									SessionSave.getSessionIdSave().remove(userName);
									SessionSave.getSessionIdSave().put(userName, sessionID);
								}
							   if ("yes".equals(yes)) {
								Cookie lname = new Cookie("loginName", u.getLoginName());
								lname.setPath(req.getContextPath());////默认只对当前路径下的资源有效
								lname.setMaxAge(60*60*24*7);//cookie.setMaxAge();单位为秒
								res.addCookie(lname);
							    Cookie pwd = new Cookie("loginPwd", passWord);
								pwd.setPath(req.getContextPath());
								pwd.setMaxAge(60*60*24*7);
								res.addCookie(pwd);  
							}  
							//该登录时间
							User us=new User();
							SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
							String time = s.format(new Date());
							us.setLoginTime(time);
							us.setUser_Id(u.getUser_Id());
							//登陆成功修改用户最后登录时间
							usermapper.updateUse(us);
							session.setAttribute("user", u);
							return Result.toClient(true, (u != null ? true : false) == true ? "crmIndex" : "登录失败!");
						}
				} 
			}
		 } 
		 
	}
	/**
	 * 根据手机号查询用户
	 */
	@Override
	public Integer selectUserByTel(String protectMTel) {
		// TODO Auto-generated method stub
 		Integer i=usermapper.selectUserByTel(protectMTel);
		if(i>0) {
			return 1;
		}else {
			return 0;
		}
	}
	 
 
	
	

 
}
