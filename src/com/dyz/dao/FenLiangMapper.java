package com.dyz.dao;

import java.util.List;

import com.dyz.entity.Askers;
import com.dyz.entity.Student;

public interface FenLiangMapper {
	/**
	 * 查询所有没有咨询师跟踪的学生
	 * 查询所有未被分配的学生
	 * @return
	 */
	List<Student> selectStuByZiXunName();
	/**
	 * 
	 * @return 查询学生最少，并且咨询师权重最高
	 */
	List<Askers> selectMaxZiXunShi();
	/**
	 * 查询手里的学生数
	 * @param userChecksId
	 * @return
	 */
	Integer selectAskerStu_count(int userChecksId);
	
	/**
	 * 修改咨询师的学生数量
	 * @return
	 */
	Integer updateAskersCount(Askers askers);
	/**
	 * 为学生分配咨询师
	 * @param student
	 * @return
	 */
	Integer updateFenliang(Student student);
	
	
	/**
	 * 查询咨询师
	 * @return
	 */
	List<Askers> selectzixunname();

	
	
	
}
