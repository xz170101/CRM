package com.dyz.service;

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
}
