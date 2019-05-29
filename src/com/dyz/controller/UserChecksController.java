package com.dyz.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dyz.entity.Askers;
import com.dyz.entity.Fenye;
import com.dyz.entity.User;
import com.dyz.entity.UserChecks;
import com.dyz.service.AskersService;
import com.dyz.service.RoleService;
import com.dyz.service.UserChecksService;
import com.dyz.service.UserService;
import com.dyz.util.Result;

@Controller
public class UserChecksController {
	@Autowired
	private UserChecksService userchecksService;
	@Autowired
	private AskersService askersService;
	@Autowired
	private UserService userService;
	@Autowired 
	private RoleService roleService;
	@RequestMapping(value="/selectuserchecks",method=RequestMethod.POST)
	@ResponseBody
	public Fenye select(Fenye fenye,Integer page,Integer rows) {		
		
		fenye.setPage((page-1)*rows);
		fenye.setPageSize(rows);
	
		return userchecksService.selectUserChecks(fenye);
	}
	
	
	@RequestMapping(value = "/qiantui", method = RequestMethod.POST)
	@ResponseBody
	public String qiantui(String userids, UserChecks userchecks,HttpSession session) {
		String[] userid = userids.split(",");
		Integer j = null;
		for (int i = 0; i < userid.length; i++) {
			userchecks.setUser_Id(Integer.parseInt(userid[i]));
			userchecks.setCheckOutTime("1");
			j = userchecksService.updateUserchecks(userchecks);
			Askers askers = new Askers();
			askers.setCheckState(false);
			askers.setUsercheckid(Integer.parseInt(userid[i]));
			askersService.updateAskers(askers);
		}
		if (j > 0) {
			return Result.toClient(true, "签退成功");
		} else {
			return Result.toClient(false, "签退失败");
		}
	}
	
	@RequestMapping(value = "/quanCheck", method = RequestMethod.POST)
	@ResponseBody
	public String quantui() {
		Integer i = userchecksService.updateQuanTui();
		Integer j = askersService.updateQuanasker();
		if(i>0) {
			return Result.toClient(true, "全部签退成功");
		}else {
			return Result.toClient(false, "全部签退失败");
		}
	}

	
	
	@RequestMapping(value = "/editCheck", method = RequestMethod.POST)
	@ResponseBody
	public String editCheck(UserChecks userchecks) {
		userchecks.setCheckOutTime("1");
		int j = userchecksService.updateUserchecks(userchecks);
		Askers askers = new Askers();
		askers.setCheckState(false);
		askers.setUsercheckid(userchecks.getUser_Id());
		askersService.updateAskers(askers);
	
		if (j > 0) {
			return Result.toClient(true, "签退成功");
		} else {
			return Result.toClient(false, "签退失败");
		}
	}

	// 员工自己签退
	@RequestMapping(value = "/yuaneditCheck", method = RequestMethod.POST)
	@ResponseBody
	public String userqiantui(UserChecks userchecks, HttpSession session) {
		Date now = new Date();
		SimpleDateFormat s = new SimpleDateFormat("HH:mm:ss");
		String time = s.format(now);
		Date date1 = null;
		try {
			date1 = s.parse(time);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		String aa = "15:00:00";
		Date date = null;
		try {
			date = s.parse(aa);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		if (date1.getTime() < date.getTime()) {
			return Result.toClient(false, "下班时间未到，暂时不能签退！");
		} else {
			userchecks.setCheckOutTime("1");
			int j = userchecksService.updateUserchecks(userchecks);
			Askers askers = new Askers();
			askers.setCheckState(false);
			askers.setUsercheckid(userchecks.getUser_Id());
			askersService.updateAskers(askers);
			session.setAttribute("state", 0);
			if (j > 0) {
				return Result.toClient(true, "签退成功");
			} else {
				return Result.toClient(false, "签退失败");
			}
		}
	}
	//员工签到
	@RequestMapping(value = "/qiandao", method = RequestMethod.POST)
	@ResponseBody
	public String qiandao(UserChecks userchecks, HttpSession session) {
		User user = (User) session.getAttribute("user");
		userchecks.setUser_Id(user.getUser_Id());
		Integer userid = askersService.selectByUsers(user.getUser_Id());//先查询是否有该员工
		Integer r_id = userService.selectLoginR_id(user.getUser_Id());//查询员工的id
		String r_name = roleService.selectbyRolesRid(r_id);//查询角色id
		if (userid == null) {//如果查询的员工不存在
			// 就执行添加操作			
			Askers askers = new Askers();
			askers.setCheckState(true);//把签到状态改成已签到存在asers表中
			askers.setRoleName(r_name);//把角色名称存进去
			askers.setUsercheckid(user.getUser_Id());
			askers.setAskers_Name(user.getLoginName());
			askers.setCheckInTime("1");
			askersService.insertAskerUsers(askers);//执行添加员工的签到信息的方法
		} else {//如果这个员工存在
			//就执行修改操作
			Askers askers = new Askers();
			askers.setCheckState(true);
			askers.setUsercheckid(user.getUser_Id());
			askers.setAskers_Name("r_name");
			askers.setCheckInTime("1");
			askersService.updateAskers(askers);//执行修改员工的签到信息的方法
		}
		session.setAttribute("state", 1);//把签到的状态存在session中
		Integer i = userchecksService.updateUserchecks(userchecks);//执行修改签到的信息
		if (i > 0) {//如果大于0
			return Result.toClient(true, "签到成功");//返回签到成功
		} else {
			return Result.toClient(false, "签到失败");//否则签到失败
		}
	}
}
