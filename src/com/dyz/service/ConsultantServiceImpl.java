package com.dyz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dyz.dao.ConsultantMapper;
import com.dyz.entity.Fenye;
import com.dyz.entity.Student;
@Service
public class ConsultantServiceImpl implements ConsultantService {
	@Autowired
	private ConsultantMapper consultantMapper;
	
	@Override
	public Fenye selectStuAll(Fenye fenye) {
		Integer total=consultantMapper.selectCountStu(fenye);
		List<Student> rows=consultantMapper.selectStuAll(fenye);
		fenye.setTotal(total);
		fenye.setRows(rows);
		return fenye;
	}
	@Override
	public Integer updateStu(Student student) {
		// TODO Auto-generated method stub
		return consultantMapper.updateStu(student);
	}
}
