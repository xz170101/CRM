package com.dyz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dyz.dao.AskersMapper;
import com.dyz.entity.Fenye;
import com.dyz.entity.Student;
@Service
public class AskersServiceImpl implements AskersService {
	@Autowired
	private AskersMapper askersMapper;
	
	@Override
	public Fenye selectStudent(Fenye fenye) {
		Integer total=askersMapper.selectCount(fenye);
		List<Student> rows=askersMapper.selectStudent(fenye);
		fenye.setTotal(total);
		fenye.setRows(rows);
		return fenye;
	}

}
