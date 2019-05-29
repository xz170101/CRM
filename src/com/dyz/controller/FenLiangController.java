package com.dyz.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dyz.entity.Askers;
import com.dyz.entity.Student;
import com.dyz.service.AskersService;
import com.dyz.service.FenLiangService;

@Controller
public class FenLiangController {
	@Autowired
	private FenLiangService fenLiangService;
	
	@Autowired
	private AskersService askersService;
	
	@RequestMapping(value = "/fenliang", method = RequestMethod.POST)
	@ResponseBody
	public String editWEight(Boolean checked, HttpSession session) {
		session.setAttribute("fenliang", checked);
		if (checked == true) {
			fenLiangService.fenliang(session);
		}
		return null;
	}
	
	/**
	 * 查询所有未被跟踪的学生
	 */
	@RequestMapping(value = "/selectstunull", method = RequestMethod.POST)
	@ResponseBody
	public List<Student> selectstunul() {
		
		return fenLiangService.selectStuByZiXunName();
	}
	
	/**
	 * 查询所有未被跟踪的咨询师数量
	 */
	@RequestMapping(value = "/selectzixuncount", method = RequestMethod.POST)
	@ResponseBody
	public List<Askers> selectzixuncount(HttpSession session) {	
		List<Askers> list=fenLiangService.selectMaxZiXunShi();
		 session.setAttribute("list", list);
		return fenLiangService.selectMaxZiXunShi();
	}
	
	
}
