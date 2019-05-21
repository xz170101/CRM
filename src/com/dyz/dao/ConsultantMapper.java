package com.dyz.dao;

import java.util.List;

import com.dyz.entity.Fenye;
import com.dyz.entity.Student;

public interface ConsultantMapper {
	/**
	 * 查询所有学生
	 * @param fenye
	 * @return
	 */
	List<Student> selectStuAll(Fenye fenye);
	/**
	 * 查询总条数
	 * @param fenye
	 * @return
	 */
	Integer selectCountStu(Fenye fenye);
	/**
	 * 修改客户信息
	 * @param student
	 * @return
	 */
	Integer updateStu(Student student);
}
