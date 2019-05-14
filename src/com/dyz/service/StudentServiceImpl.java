package com.dyz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dyz.dao.StudentMapper;
import com.dyz.entity.Fenye;
import com.dyz.entity.Student;
@Service
public class StudentServiceImpl implements StudentService {
	@Autowired
	private StudentMapper studentMapper;
	
	@Override
	public Fenye selectStudent(Fenye fenye) {
		Integer total=studentMapper.selectCount(fenye);
		List<Student> rows=studentMapper.selectStudent(fenye);
		fenye.setTotal(total);
		fenye.setRows(rows);
		return fenye;
	}

	@Override
	public Integer delectStudent(Integer stu_id) {
		// TODO Auto-generated method stub
		return studentMapper.delectStudent(stu_id);
	}

	@Override
	public Integer insertStudent(Student student) {
		// TODO Auto-generated method stub
		return studentMapper.insertStudent(student);
	}

	@Override
	public Integer updatezixunname(Student student) {
		// TODO Auto-generated method stub
		return studentMapper.updatezixunname(student);
	}

}
