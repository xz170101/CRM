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
	/**
	 * 分页查询签到的信息
	 * @param fenye
	 * @param page
	 * @param rows
	 * @return
	 */
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
	/**
	 * 全部签退
	 * @return
	 */
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

	@RequestMapping(value = "/dangtian", method = RequestMethod.POST)
	@ResponseBody
	public Integer dangtian(Integer user_Id) {
		return userchecksService.selectdangtian(user_Id);
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
		String aa = "18:00:00";
		Date date = null;
		try {
			date = s.parse(aa);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		if(userchecks.getCheckState()==false) {
			Result.toClient(false, "还没有签到不能签退！");
		}if(date1.getTime() < date.getTime()) {//如果他们签退的时间还没到下班时间的时候
			return Result.toClient(false, "下班时间未到，暂时不能签退！");//就返回false，提示下班时间未到
		} else {//否则签退状态就为1，1代表以前退
			userchecks.setCheckOutTime("1");//
			int j = userchecksService.updateUserchecks(userchecks);//修改签退表中的签退信息
			Askers askers = new Askers();
			askers.setCheckState(false);//把签到改为false，未签到
			askers.setUsercheckid(userchecks.getUser_Id());//askers表获取签到表中的用户id
			askersService.updateAskers(askers);//修改askers表中的签退信息
			session.setAttribute("state", 0);
			if (j > 0) {//如果修改过后返回的值大于1
				return Result.toClient(true, "签退成功");//签退成功
			} else {//否则签退失败
				return Result.toClient(false, "签退失败");
			}
		}
	}
	//员工签到
	@RequestMapping(value = "/qiandao", method = RequestMethod.POST)
	@ResponseBody
	public String qiandao(UserChecks userchecks, HttpSession session) {
		User user = (User) session.getAttribute("user");
		userchecks.setUser_Id(user.getUser_Id());//获取user表中的用户id
		Integer userid = askersService.selectByUsers(user.getUser_Id());//先查询是否有该员工
		Integer r_id = userService.selectLoginR_id(user.getUser_Id());//查询员工的id
		String r_name = roleService.selectbyRolesRid(r_id);//查询角色id
		if (userid == null) {//如果查询的员工不存在
			// 就执行添加操作			
			Askers askers = new Askers();
			askers.setCheckState(true);//把签到状态改成已签到存在asers表中
			askers.setRoleName(r_name);//把角色名称存进去
			askers.setUsercheckid(user.getUser_Id());//获取用户表中的用户id
			askers.setAskers_Name(user.getLoginName());//获取用户的名字
			askers.setCheckInTime("1");//
			askersService.insertAskerUsers(askers);//执行添加员工的签到信息的方法
		} else {//如果这个员工存在
			//就执行修改操作
			Askers askers = new Askers();
			askers.setCheckState(true);//签到状态改为true
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

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
/*	
	*//**	 * 今天签到     * 	 *//*	
	@RequestMapping(value="/signToday")	
	@ResponseBody	
	public Object updateSignToday(Page page) throws Exception {		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");		
		PageData pd = new PageData();		
		pd = this.getPageData();		
		Subject currentUser = SecurityUtils.getSubject();		
		Session session = currentUser.getSession();		
		WxUser tempUser = (WxUser) session.getAttribute(Constant.WX_LOGIN_SESSION);		
		//pd.put("WxOpenId", "oQWlJ1PGwqbWx0IMxGJeZMlnWSjs");		
		pd.put("WxOpenId", tempUser.getWxOpenId());		
		try {			//查询当前用户最后签到时间和连续签到多少天		
			List<PageData> list = guessFacade.findSignRecord(pd);		
			if(list.size()>0){			
			Date today = new Date();				
			String todays = dateFormat.format(today);			    
			String lastTime = list.get(0).get("lastSignTime").toString();			    
			Date lastSignTime = dateFormat.parse(lastTime);			    
			Date todayTime = dateFormat.parse(todays);				
			if(UtilsDate.differentDays(lastSignTime,todayTime)>1){				
				pd.put("signNum", 1);				
				}else if(UtilsDate.differentDays(lastSignTime,todayTime)==0){	
					pd.put("flag", false);					
					pd.put("msg", "今天已经签到过！请勿重复签到！");				
					return pd;			
					}						
			}		
			guessFacade.updateSignToday(pd);		
			pd.put("flag", true);		
			pd.put("msg", "签到成功！");		
			} catch (Exception e) {		
				pd.put("flag", false);	
				pd.put("msg", "签到失败！");		
				e.printStackTrace();	
				}		
		return pd;
		}	
		}
*/
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
