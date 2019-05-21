package com.dyz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dyz.entity.Fenye;
import com.dyz.service.ConsultantService;

@Controller
public class ConsultantController {
	@Autowired
	private ConsultantService consultantService;
	@RequestMapping(value="/selectCon",method=RequestMethod.POST)
	@ResponseBody
	public Fenye select(Fenye fenye,Integer page,Integer rows) {
		fenye.setPage((page-1)*rows);
		fenye.setPageSize(rows);
		return consultantService.selectStuAll(fenye);
	}
	
	@RequestMapping(value="/updateStu",method=RequestMethod.POST)
	@ResponseBody
	public Integer updateStu(Student student) {

		return consultantService.updateStu(student);
	}

}
