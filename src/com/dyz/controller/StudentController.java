package com.dyz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dyz.entity.Fenye;
import com.dyz.service.StudentService;

@Controller
public class StudentController {
	@Autowired
	private StudentService studentService;
	@RequestMapping(value="/selectStudent",method=RequestMethod.POST)
	@ResponseBody
	public Fenye select(Fenye fenye,Integer page,Integer rows) {
		fenye.setPage((page-1)*rows);
		fenye.setPageSize(rows);
		return studentService.selectStudent(fenye);
	}
	@RequestMapping(value="/delectstu",method=RequestMethod.POST)
	@ResponseBody
	public Integer delect(@RequestParam(value="stu_id")Integer stu_id) {
		return studentService.delectStudent(stu_id);
	}
}
