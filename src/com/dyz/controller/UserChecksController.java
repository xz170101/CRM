package com.dyz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dyz.entity.Fenye;
import com.dyz.service.UserChecksService;

@Controller
public class UserChecksController {
	@Autowired
	private UserChecksService userchecksService;
	
	@RequestMapping(value="/selectuserchecks",method=RequestMethod.POST)
	@ResponseBody
	public Fenye select(Fenye fenye,Integer page,Integer rows) {
		fenye.setPage((page-1)*rows);
		fenye.setPageSize(rows);
		return userchecksService.selectUserChecks(fenye);
	}
}
