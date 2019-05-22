package com.dyz.dao;

import java.util.List;

import com.dyz.entity.Askers;
import com.dyz.entity.Student;

public interface FenLiangMapper {
	/**
	 * 查询所有没有咨询师跟踪的学生
	 * @return
	 */
	List<Student> selectStuByZiXunName();
	/**
	 * 查询咨询师
	 * @return
	 */
	List<Askers> selectzixunname();

	/**
	 * 
	 * @param student
	 * @return为学生分配咨询师
	 */
	Integer updateFenliang(Student student);
	
	/**
	 * 
	 * @return修改咨询师的学生数量
	 */
	Integer updateAskersCount(Askers askers);
}
