package com.dyz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dyz.dao.AskersMapper;
import com.dyz.entity.Askers;
import com.dyz.entity.Fenye;
import com.dyz.entity.Student;
@Service
public class AskersServiceImpl implements AskersService {
	@Autowired
	private AskersMapper askersMapper;
	@Override
	public Integer updateAskers(Askers askers) {
		// TODO Auto-generated method stub
		return askersMapper.updateAskers(askers);
	}
	@Override
	public Integer updateQuanasker() {
		// TODO Auto-generated method stub
		return askersMapper.updateQuanasker();
	}
	@Override
	public Integer insertAskerUsers(Askers askers) {
		// TODO Auto-generated method stub
		return askersMapper.insertAskerUsers(askers);
	}
	@Override
	public Integer selectByUsers(int userChecksId) {
		// TODO Auto-generated method stub
		return askersMapper.selectByUsers(userChecksId);
	}
	@Override
	public Fenye selectAllAskers(Fenye fenye) {
		Integer total=askersMapper.selectCountAskers(fenye);
		List<Askers> rows=askersMapper.selectAllAskers(fenye);
		fenye.setTotal(total);
		fenye.setRows(rows);
		return fenye;
	}
	@Override
	public Integer updateWeight(Askers askers) {
		// TODO Auto-generated method stub
		return askersMapper.updateWeight(askers);
	}
	@Override
	public List<Askers> selectqiandao() {
		// TODO Auto-generated method stub
		return askersMapper.selectqiandao();
	}

}
