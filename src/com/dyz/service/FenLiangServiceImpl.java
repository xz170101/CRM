package com.dyz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dyz.dao.FenLiangMapper;
import com.dyz.entity.Askers;
import com.dyz.entity.Student;
@Service
public class FenLiangServiceImpl implements FenLiangService {
	@Autowired
	private FenLiangMapper fenliangMapper;
	@Override
	public List<Askers> selectzixunname() {
		// TODO Auto-generated method stub
		return fenliangMapper.selectzixunname();
	}

	@Override
	public List<Student> selectStuByZiXunName() {
		// TODO Auto-generated method stub
		return fenliangMapper.selectStuByZiXunName();
	}

}
