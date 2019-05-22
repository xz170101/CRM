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

	// 自己签退
	@RequestMapping(value = "/shoueditCheck", method = RequestMethod.POST)
	@ResponseBody
	public String renQiantui(UserChecks userchecks, HttpSession session) {

		Date now = new Date();
		SimpleDateFormat s = new SimpleDateFormat("HH:mm:ss");
		String time = s.format(now);
		Date date1 = null;
		try {
			date1 = s.parse(time);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		String aa = "21:00:00";
		Date date = null;
		try {
			date = s.parse(aa);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		if (date1.getTime() < date.getTime()) {
			return Result.toClient(false, "不到下班时间，不能提前签退");
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

	@RequestMapping(value = "/qiandao", method = RequestMethod.POST)
	@ResponseBody
	public String qiandao(UserChecks userchecks, HttpSession session) {
		User user = (User) session.getAttribute("user");
		userchecks.setUser_Id(user.getUser_Id());
		Integer userid = askersService.selectByUsers(user.getUser_Id());
		Integer r_id = userService.selectLoginR_id(user.getUser_Id());
		String r_name = roleService.selectbyRolesRid(r_id);
		if (userid == null) {
			// 添加操作
			
			Askers askers = new Askers();
			askers.setCheckState(true);
			askers.setRoleName(r_name);
			askers.setUsercheckid(user.getUser_Id());
			askers.setAskers_Name(user.getLoginName());
			askers.setCheckInTime("1");
			askersService.insertAskerUsers(askers);
		} else {
			// 修改操作
			Askers askers = new Askers();
			askers.setCheckState(true);
			askers.setUsercheckid(user.getUser_Id());
			askers.setAskers_Name("r_name");
			askers.setCheckInTime("1");
			askersService.updateAskers(askers);
		}
		session.setAttribute("state", 1);
		Integer i = userchecksService.updateUserchecks(userchecks);
		if (i > 0) {
			return Result.toClient(true, "签到成功");
		} else {return Result.toClient(false, "签到失败");
		}
	}
}
