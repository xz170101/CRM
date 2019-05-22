package com.dyz.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dyz.entity.Askers;
import com.dyz.entity.Fenye;
import com.dyz.entity.Student;
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
	@RequestMapping(value="/insertstu",method=RequestMethod.POST)
	@ResponseBody
	public Integer insert(Student student) {
		return studentService.insertStudent(student);
	}
	
	@RequestMapping(value="/updatezixunname",method=RequestMethod.POST)
	@ResponseBody
	public Integer updatezixunname(Student student) {
		return studentService.updatezixunname(student);
	}
	
	@RequestMapping(value="/updateStudent",method=RequestMethod.POST)
	@ResponseBody
	public Integer update(Student student) {
		System.out.println("ssfdgfhfgjghkhjk");
		return studentService.updateStudent(student);
	}
	
	@RequestMapping(value="/selectzixunname",method=RequestMethod.POST)
	@ResponseBody
	public List<Askers> selectzixunname() {
		System.out.println(studentService.selectzixunname()+"jinjin=========================");
		return studentService.selectzixunname();
	}
	
	@RequestMapping(value="/selectlog",method=RequestMethod.POST)
	@ResponseBody
	public Fenye selectlog(Fenye fenye,Integer page,Integer rows,Student student) {
		fenye.setStudent(student);
		fenye.setPage((page-1)*rows);
		fenye.setPageSize(rows);
		System.out.println(fenye);
		return studentService.selectLog(fenye);
	}
}
