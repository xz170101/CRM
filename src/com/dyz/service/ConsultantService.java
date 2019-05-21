package com.dyz.service;

import com.dyz.entity.Fenye;
import com.dyz.entity.Student;

public interface ConsultantService {
	/**
	 *查询所有学生
	 * @param fenye
	 * @return
	 */
	Fenye selectStuAll(Fenye fenye);
	/**
	 * 修改客户信息
	 * @param student
	 * @return
	 */
	Integer updateStu(Student student);
}
