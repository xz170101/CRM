package com.dyz.service;

import com.dyz.entity.Fenye;

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
}
