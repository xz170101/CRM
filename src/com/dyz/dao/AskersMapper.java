package com.dyz.dao;

import java.util.List;

import com.dyz.entity.Fenye;
import com.dyz.entity.Student;

public interface AskersMapper {
	/**
	 * 查询所有学生
	 * @param fenye
	 * @return
	 */
	List<Student> selectStudent(Fenye fenye);
	/**
	 * 查询总条数
	 * @param fenye
	 * @return
	 */
	Integer selectCount(Fenye fenye);
}
