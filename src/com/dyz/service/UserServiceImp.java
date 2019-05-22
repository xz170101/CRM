
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
import com.dyz.util.IndustrySMS;
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
	public Integer updatePassword(User user) {
 			String pwd="ysd123";
			user.setPassWord(MD5Util.MD5(pwd));
			System.out.println("重置后的密码：：：：：："+user.getPassWord());
		return usermapper.updatePsd(user);
	}
	/**
	 * 添加用户
	 */
	@Override
	public Integer inertUser(User user) {
		// TODO Auto-generated method stub
		return usermapper.inertUse(user);
	}
	/**
	 * 修改用户信息
	 */
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
 		if(i != null && i.size() != 0  ) {
			return 0;
		}else {
			return usermapper.delUse(user_Id);
		}
	}
	/**
	 * 锁定用户
	 */
	@Override
	public Integer lockUser(Integer user_Id) {
		// TODO Auto-generated method stub
		return usermapper.lockUse(user_Id);
	}
	/**
	 * 解锁用户
	 */
	@Override
	public Integer unLockUser(Integer user_Id) {
		// TODO Auto-generated method stub
		return usermapper.unLockUse(user_Id);
	}
	/**
	 * 根据登录名查询用户
	 */
	/*@Override
	public User selectUser(String loginName) {
		// TODO Auto-generated method stub
		return usermapper.selectUser(loginName);
	}*/
	/**
	 * 根据用户id查询所有角色
	 */
	@Override
	public List<Role> selectUserRoles(Integer user_Id) {
		// TODO Auto-generated method stub
		return usermapper.selectUserRole(user_Id);
	}
	 /**
	  * 查询所有的角色
	  */
	@Override
	public List<Role> selectRoles() {
		// TODO Auto-generated method stub
		return usermapper.selectRole();
	}
	/**
	 * 添加角色
	 * 0：已存在该角色
	 */
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
	/**
	 * 根据提供的用户名拿密码
	 */
	public String getPasswordByUsername(String username) {
		return usermapper.findByloginName(username).getPassWord();
	}
	/**
	 * 根据登录名查询用户
	 */
	@Override
	public Integer selectByName(String loginName) {
		// TODO Auto-generated method stub
		//Integer i=userService.selectByName(loginName);
		Integer i=usermapper.selectByName(loginName);//返回值为user_id
		if(i==null) {
			return 0;
		}else {
			return i;
		}
	}
 
/*	@Override
	public Integer updateLockUser(User user) {
		// TODO Auto-generated method stub
		return null;
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
	/**
	 * 添加用户
	 */
	@Override
	public Integer insertUser(User user) {
		// TODO Auto-generated method stub
		return usermapper.insertNewUser(user);
	}
	/**
	 * 登录
	 */
	int psdWrongTime=0;
	@Override
	public String getLogin(User user, String yes, String yzm, HttpSession session, HttpServletRequest req,
			HttpServletResponse response, Model model) {
		// TODO Auto-generated method stub
		 //String passWord = user.getPassWord();
		 user.setPassWord(MD5Util.MD5(user.getPassWord()));
		 String code =(String) session.getAttribute("randomcode_key");
		 if (!code.equalsIgnoreCase(yzm)) {
			return Result.toClient(false, "验证码不正确！");
		} else { 
			//根句登录名查询用户id判断是否存在该用户
			Integer nameId = usermapper.selectByName(user.getLoginName());//返回的是用户id
			if (nameId == null) {
				return Result.toClient(false, "用户名不存在");
			} else {
				//根据用户名和密码查询用户信息 判断密码是否正确
				User u = usermapper.selectUse(user);
				if (u == null) {
					psdWrongTime++;
						User use=new User();
						use.setUser_Id(nameId);
						use.setPsdWrongTime(psdWrongTime);
						//修改用户密码错误次数
						usermapper.updateUse(use);
						if(psdWrongTime>3) {
							SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
							String time = s.format(new Date());
							use.setLockTime(time);
							use.setIsLockout(1);
							//锁定用户
							usermapper.lockUse(nameId);
							return Result.toClient(false, "该用户已被锁定，请联系管理员解锁！");
						}
					return Result.toClient(false, "密码不正确");
				} else {
						//判断该用户是否锁定
						Integer lockoutID = usermapper.selectByNameLockout(user.getLoginName());
						if (lockoutID != null) {
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
								response.addCookie(lname);
								} else {//删除存在cookie中的loginName
									Cookie newCookie=new Cookie("loginName",null); // 要删除名称为loginName的Cookie
									newCookie.setMaxAge(0); //立即删除型
									newCookie.setPath("/"); //项目所有目录均有效，这句很关键，否则不敢保证删除
									newCookie.setPath(req.getContextPath()); //默认只对当前路径下的资源有效
									response.addCookie(newCookie); //重新写入，将覆盖之前的
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
 		User user=usermapper.selectUserByTel(protectMTel);
 		//System.out.println("用户：：：："+user);
 		//System.out.println("用户Id:::"+user.getUser_Id());
		if(user==null){
			return 0;
		}else {
			return user.getUser_Id();
		}
	}
	/**
	 * 获取（发送）手机验证码
	 */
	@Override
	public Integer sendToPhoneCode(User user, HttpServletRequest request) {
		// TODO Auto-generated method stub
		int p= (int)((Math.random()*9+1)*100000);//获取6位随机验证码
 		IndustrySMS.setTo(user.getProtectMTel());//发送到这个手机号
 		String smsContent = "【CRM管理平台】您的验证码为"+p+"，请于30分钟内正确输入，如非本人操作，请忽略此短信。";//发送的内容
 		IndustrySMS.setSmsContent(smsContent);//把发送的信息内容存到这个对象类中
 		IndustrySMS.execute();//执行发送验证码方法
 		request.getSession().setAttribute("phoneCode", p);//把验证码存入到键值并存在session中
		return p;
	}
	/*不知道谁写的，俺也不敢删*/
	@Override
		public Integer selectLoginR_id(int userId) {
			// TODO Auto-generated method stub
			return usermapper.selectLoginR_id(userId);
		}
}
