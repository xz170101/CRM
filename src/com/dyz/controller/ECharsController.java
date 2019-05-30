package com.dyz.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dyz.entity.Fenye;
import com.dyz.entity.Role;
import com.dyz.service.ECharsService;

@Controller
public class ECharsController {
	@Autowired
	private ECharsService eCharsService;
	
	/**
	 * 
	 * @return
	 */
	@RequestMapping(value="/selectUserCount",method=RequestMethod.POST)
	@ResponseBody
	public Integer selectUserCount() {
	 
		return eCharsService.selectUserCount();
	}
	@RequestMapping(value="/selectStudentCount",method=RequestMethod.POST)
	@ResponseBody
	public Integer selectStudentCount() {
		
		return eCharsService.selectStudentCount();
	}
	@RequestMapping(value="/selectTransactionCount",method=RequestMethod.POST)
	@ResponseBody
	public Integer selectTransactionCount() {
		
		return eCharsService.selectTransactionCount();
	}
	@RequestMapping(value="/selectUserCheckCount",method=RequestMethod.POST)
	@ResponseBody
	public Integer selectUserCheckCount() {
		
		return eCharsService.selectUserCheckCount();
	}
	/**
	 * 查看各角色的人数
	 * @return
	 */
	@RequestMapping(value="/selectRoseCount",method=RequestMethod.POST)
	@ResponseBody
	public List<Map<Integer, String>> selectRoseCount() {
		return eCharsService.selectRoseCount();
	}
	 /**
	  * 饼图查看客户来源
	  * @return
	  */
	@RequestMapping(value="/selectStuSourceUrl",method=RequestMethod.POST)
	@ResponseBody
	public List<Map<Integer, String>> selectStuSourceUrl() {
		return eCharsService.selectStuSourceUrl();
	}
	

}
