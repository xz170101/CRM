package com.dyz.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.dyz.entity.Askers;
import com.dyz.entity.Student;

public interface FenLiangService {
	/**
	 * 查询咨询师
	 * @return
	 */
	List<Askers> selectzixunname();
	
	/**
	 * 查询所有没有咨询师跟踪的学生
	 * @return
	 */
	List<Student> selectStuByZiXunName();
	
	/**
	 * 查询已签到的咨询师
	 * @return 查询学生最少，并且咨询师权重最高
	 */
	List<Askers> selectMaxZiXunShi();
	
	void fenliang(HttpSession session) ;
	/**
	 * 
	 * @param userChecksId
	 * @return查询手里的学生数
	 */
	Integer selectAskerStu_count(int userChecksId);
	
}
