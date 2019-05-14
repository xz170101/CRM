package com.dyz.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dyz.util.RandomValidateCode;
@Controller
public class LoginUI {
	

/**
	 * 获取生成验证码显示到 UI 界面
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value="/checkCode")
	public void checkCode(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		//设置相应类型,告诉浏览器输出的内容为图片
        response.setContentType("image/jpeg");
        
        //设置响应头信息，告诉浏览器不要缓存此内容
        response.setHeader("pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expire", 0);
        
        RandomValidateCode randomValidateCode = new RandomValidateCode();
      /*  ArrayList<String> yzm=new ArrayList<>(); 
        for(int i=1;i<=4;i++) {
        	yzm.add(randomValidateCode.getRandomString(i));
        	System.out.println(randomValidateCode.getRandomString(i));
        }*/
        try {
            randomValidateCode.getRandcode(request, response);//输出图片方法
        } catch (Exception e) {
            e.printStackTrace();
        }


}}
