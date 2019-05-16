package com.dyz.service;

import com.dyz.entity.Fenye;
import com.dyz.entity.Student;

public interface NetworkConsultantService {
	/**
	 *查询所有学生
	 * @param fenye
	 * @return
	 */
	Fenye selectStu(Fenye fenye);
	/**
	 * 添加学生
	 * @param student
	 * @return
	 */
	Integer insertStu(Student student);
}
