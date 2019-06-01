package com.dyz.service;

import com.dyz.entity.Fenye;
import com.dyz.entity.Message;
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
	/**
	 * 即时通讯
	 * @param rowc	发给谁
	 * @param name	谁发的 			
	 * @param mess	发的是什么
	 * @return
	 */
	String jishitongxun(String rowc, String name, String mess);
}
