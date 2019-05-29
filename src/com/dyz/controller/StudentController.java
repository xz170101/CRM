package com.dyz.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

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
import com.dyz.entity.User;
import com.dyz.service.FenLiangService;
import com.dyz.service.StudentService;

@Controller
public class StudentController {
	@Autowired
	private StudentService studentService;
	@Autowired
	private FenLiangService fenLiangService;
	
	/**
	 * 分页多条件查询客户信息
	 * @param fenye
	 * @param page
	 * @param rows
	 * @return
	 */
	@RequestMapping(value="/selectStudent",method=RequestMethod.POST)
	@ResponseBody
	public Fenye select(Fenye fenye,Integer page,Integer rows) {
		fenye.setPage((page-1)*rows);
		fenye.setPageSize(rows);
		return studentService.selectStudent(fenye);
	}
	/**
	 * 删除客户信息
	 * @param stu_id
	 * @return
	 */
	@RequestMapping(value="/delectstu",method=RequestMethod.POST)
	@ResponseBody
	public Integer delect(@RequestParam(value="stu_id")Integer stu_id) {
		return studentService.delectStudent(stu_id);
	}
	/**
	 * 添加客户信息
	 * @param student
	 * @return
	 */
	@RequestMapping(value="/insertstu",method=RequestMethod.POST)
	@ResponseBody
	public Integer insert(Student student, HttpSession session,Boolean fenliang) {
		Integer i=null;
		session.setAttribute("fenliang", fenliang);
		if(fenliang==true) {
			User user=(User)session.getAttribute("user");
			String crestuser=user.getLoginName();
			student.setStu_CreateUser(crestuser);	
			i=studentService.insertStudent(student);
			fenLiangService.fenliang(session);
		}else {
			User user=(User)session.getAttribute("user");
			String crestuser=user.getLoginName();
			student.setStu_CreateUser(crestuser);	
			i=studentService.insertStudent(student);
		}		
		return i;
	}
	/**
	 * 手动分量
	 * @param student
	 * @return
	 */
	@RequestMapping(value="/updatezixunname",method=RequestMethod.POST)
	@ResponseBody
	public Integer updatezixunname(Student student) {
		return studentService.updatezixunname(student);
	}
	/**
	 * 修改客户信息
	 * @param student
	 * @return
	 */
	@RequestMapping(value="/updateStudent",method=RequestMethod.POST)
	@ResponseBody
	public Integer update(Student student) {
		System.out.println("sjsdjgsdj"+student+"      heng");
		return studentService.updateStudent(student);
	}
	/**
	 * 查询咨询师姓名
	 * @return
	 */
	@RequestMapping(value="/selectzixunname",method=RequestMethod.POST)
	@ResponseBody
	public List<Askers> selectzixunname() {
		
		return studentService.selectzixunname();
	}
	/**
	 * 查询跟踪日志
	 * @param fenye
	 * @param page
	 * @param rows
	 * @param student
	 * @return
	 */
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
