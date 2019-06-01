package com.dyz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dyz.controller.MyWebsocket;
import com.dyz.dao.NetworkConsultantMapper;
import com.dyz.entity.Fenye;
import com.dyz.entity.Message;
import com.dyz.entity.Student;

@Service
public class NetworkConsultantServiceImpl implements NetworkConsultantService {
	@Autowired
	private NetworkConsultantMapper networkConsultantMapper;

	@Override
	public Fenye selectStu(Fenye fenye) {
		Integer total=networkConsultantMapper.selectCountStu(fenye);
		List<Student> rows=networkConsultantMapper.selectStu(fenye);
		fenye.setTotal(total);
		fenye.setRows(rows);
		return fenye;
	}

	@Override
	public Integer insertStu(Student student) {
		// TODO Auto-generated method stub
		return networkConsultantMapper.insertStu(student);
	}
	@Override
	public String jishitongxun(String rowc,String name,String mess) {
		String p=name+","+rowc+","+mess;
		MyWebsocket websocket=new MyWebsocket();
		websocket.onmessage(p);
		return p;
	}
}
