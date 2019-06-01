package com.dyz.dao;

import java.util.List;

import com.dyz.entity.Fenye;
import com.dyz.entity.Message;
import com.dyz.entity.Student;

public interface NetworkConsultantMapper {
	/**
	 * 查询所有学生
	 * @param fenye
	 * @return
	 */
	List<Student> selectStu(Fenye fenye);
	/**
	 * 查询总条数
	 * @param fenye
	 * @return
	 */
	Integer selectCountStu(Fenye fenye);
	/**
	 * 添加客户
	 * @param student
	 * @return
	 */
	Integer insertStu(Student student);
}
