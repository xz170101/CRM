package com.dyz.service;

import java.util.List;

import com.dyz.entity.Askers;
import com.dyz.entity.Fenye;
import com.dyz.entity.Student;

public interface StudentService {
	/**
	 *查询所有学生
	 * @param fenye
	 * @return
	 */
	Fenye selectStudent(Fenye fenye);
	/**
	 * 删除学生
	 * @param stu_id
	 * @return
	 */
	Integer delectStudent(Integer stu_id);
	/**
	 * 添加学生
	 * @param student
	 * @return
	 */
	Integer insertStudent(Student student);
	/**
	 * 修改咨询师姓名
	 * @param student
	 * @return
	 */
	Integer updatezixunname(Student student);
	
	/**
	 * 修改客户信息
	 * @param student
	 * @return
	 */
	Integer updateStudent(Student student);
	
	/**
	 * 查询咨询师
	 * @return
	 */
	List<Askers> selectzixunname();
	/**
	 * 查询所有没有咨询师跟踪的学生
	 * @return
	 *//*
	List<Student> selectStuByZiXunName();*/
	/**
	 * 查询跟踪日志
	 * @param student
	 * @return
	 */
	Fenye selectLog(Fenye fenye);
	/**
	 * poi查询所有学生
	 * @return
	 */
	List<Student>  selectpoi();
	/**
	 * 判断手机号不重复
	 * @param phone
	 * @return
	 */
	Integer selectPhone(String stu_Phone);
}
