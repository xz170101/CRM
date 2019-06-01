package com.dyz.dao;

import java.util.List;

import com.dyz.entity.Askers;
import com.dyz.entity.Fenye;
import com.dyz.entity.Student;

public interface StudentMapper {
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
	/**
	 * 删除学生
	 * @param stu_id
	 * @return
	 */
	
	Integer delectStudent(Integer stu_id);
	
	/**
	 * 添加客户
	 * @param student
	 * @return
	 */
	Integer insertStudent(Student student);
	/**
	 * 修改咨询师姓名
	 * @param student
	 * @return
	 */
	Integer updatezixunname(Student student);
	/**
	 * 修改客户信息
	 * @param student
	 * @return
	 */
	Integer updateStudent(Student student);
	/**
	 * 查询咨询师
	 * @return
	 */
	List<Askers> selectzixunname();
	/**
	 * 查询跟踪日志
	 * @param stu_id
	 * @return
	 */
	List<Student> selectLog(Fenye fenye);
	/**
	 * poi导出表格查询所有学生
	 * @return
	 */
	List<Student>  selectpoi();
	/**
	 * 判断手机号不重复
	 * @param phone
	 * @return
	 */
	Integer selectPhone(String stu_Phone);
}
