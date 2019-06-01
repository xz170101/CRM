package com.dyz.controller;


import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
	public Integer resetPassword(User user) {
		return userService.updatePassword(user);
	} 
	/**
	 * 添加用户
	 * @return
	 */
	/*@RequestMapping(value="/addUser",method=RequestMethod.POST)
	@ResponseBody
	public Integer addUser(User user) {
		 user.setPassWord(MD5Util.MD5(user.getPassWord()));
		return  userService.inertUser(user);
	}*/
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
			HttpSession session,HttpServletRequest req,HttpServletResponse response,Model model) {
		return userService.getLogin(user,yes, yzm, session, req, response, model);
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
	/**
	 * 添加用户
	 * @param user
	 * @return
	 */
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
	 * 根据用户名查询用户对象
	 * @param user
	 * @return
	 */
	@RequestMapping(value ="/selectUByName", method = RequestMethod.POST)
	@ResponseBody
	public User selectUByName(HttpSession session,String loginName) {
		return userService.selectUserByName(session,loginName);
	}
	/**
	 * 根据手机号查询用户 
	 * @param loginName
	 * @return
	 */
	@RequestMapping(value ="/selectUserByTel", method = RequestMethod.POST)
	@ResponseBody
	public Integer selectUserByTel(String protectMTel) {
 		return userService.selectUserByTel(protectMTel);
	}
   //注销方法
    @RequestMapping(value="/outLogin", method = RequestMethod.POST)
    @ResponseBody
    public Integer outLogin(HttpSession session){
        //通过session.invalidata()方法来注销当前的session
    	System.out.println("浏览器关闭！！！！！！！！！！！");
    	ServletContext context = session.getServletContext();
    	Map<String, Object> map = (Map<String, Object>)context.getAttribute("ids");
    	User user = (User)session.getAttribute("user");
    	map.remove(user.getUser_Id().toString());
    	context.setAttribute("ids", map);
    	session.removeAttribute("user");
        session.invalidate();
        
        return  1;
    } 
    /**
     * 验证手机号
     * @param user
     * @param request
     * @return
     */
    @RequestMapping(value="/sendToPhoneCode", method = RequestMethod.POST)
    @ResponseBody
    public Integer sendToPhoneCode(User user, HttpServletRequest request){
        return  userService.sendToPhoneCode(user,request);
    } 
    /***
     * 保存文件
     *
     * @param file
     * @return
     */
    private boolean saveFile(HttpServletRequest request, MultipartFile file) {
        // 判断文件是否为空
        if (!file.isEmpty()) {
            try {
                // 保存的文件路径(如果用的是Tomcat服务器，/   \文件会上传到\\%TOMCAT_HOME%\\webapps\\YourWebProject\\upload\\文件夹中  )
            	String filePath = request.getSession().getServletContext()
                    .getRealPath("/") + "img"+File.separator + file.getOriginalFilename();
                 System.err.println("filePath:"+filePath);
                 File saveDir = new File(filePath);
                 if (!saveDir.getParentFile().exists())
                    saveDir.getParentFile().mkdirs();
                 System.err.println("filePath:"+filePath);
                // 转存文件
                file.transferTo(saveDir);
                return true;
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return false;
    }
    /**
     * 上传图片
     * @param files
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/filesUpload",method=RequestMethod.POST )
    public String filesUpload(@RequestParam("myfiles") MultipartFile[] files, HttpServletRequest request,HttpSession session,User user) {
    //	String result =OperatorEnum.OperatorFailure.getName();
         if (files != null && files.length > 0) {
            for (int i = 0; i < files.length; i++) {
                MultipartFile file = files[i];
                // 保存文件
                System.out.println("文件名：：：：：：："+file.getOriginalFilename());
                boolean a = saveFile(request, file);
                if(a){
              //  	result = OperatorEnum.OperatorSuccess.getName();
                	User users = (User) session.getAttribute("user");
                	user.setUser_Id(users.getUser_Id());
                	user.setUexit2String(file.getOriginalFilename());
                	session.setAttribute("userImg",file.getOriginalFilename());
                	userService.updateUser(user);
                }
            }
        }
        // 重定向
        return "1";
    } 
}
