package com.dyz.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.dyz.dao.UserMapper;
import com.dyz.entity.User;
import com.dyz.util.Result;
import com.dyz.util.SessionSave;

public class Interceptor implements HandlerInterceptor {
			@Autowired
			private UserMapper usermapper;
		//controller执行后且视图返回后调用此方法
		 public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
				throws Exception {
			System.out.println("返回视图前  后处理");
		}
		//controller执行后但未返回视图前调用此方法
		@Override
		public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
				throws Exception {
			System.out.println("未返回视图前 后处理....");
		}

		// controller执行前调用此方法
		public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object obj) throws Exception {
			// TODO Auto-generated method stub
			System.out.println("预处理....");
			//如果是登录页面则放行
			if(request.getRequestURI().indexOf("login")>=0){
				return true;
			}
			HttpSession session = request.getSession();
			User user= (User) session.getAttribute("user");
			System.out.println("session中取到的"+user);
			//如果用户已登录也放行
			if(user!=null){
				//request.getRequestDispatcher("/WEB-INF/demo/index.jsp").forward(request, response);
				String sessionId = SessionSave.getSessionIdSave().get(user.getLoginName());//获取全局类SessionSave保存账户的静态sessionId
				String currentSessionId = session.getId();//获取当前的sessionId
				System.out.println("保存账户的静态sessionId::::"+sessionId);
				System.out.println("当前的sessionId::::"+currentSessionId);
			/*	if (!currentSessionId.equals(sessionId)) {//如果两个sessionId不等，则当前账户强制下线，需要重新登录
					System.out.println("我是被挤下线的！！！！！！！！！！");
 					response.sendRedirect(request.getContextPath() + "/crm");
				}*/
				return true;
			}
			//如果cookie中存的有值也放行
			/*Cookie[] cookies = request.getCookies();
			if(cookies!=null) {
			    for(Cookie cookie : cookies){
			        if("loginName".equals(cookie.getName())){
			        	String loginName=(String)cookie.getValue();	
			        	User luser=usermapper.selectUser(loginName);
			        	System.out.println("s:"+luser);
			        	if(luser!=null) {
				        	session.setAttribute("user", luser);
				        	return true;
			        	}else {
			        		return false;
			        	}
			        
			        }else {
			        	request.getRequestDispatcher("/WEB-INF/demo/login.jsp").forward(request, response);
			        	return false;
			        }
			     } 
			} */
			//用户没有登录跳转到登录页面
			request.getRequestDispatcher("/WEB-INF/demo/login.jsp").forward(request, response);
			
			return false;
		} 
}
