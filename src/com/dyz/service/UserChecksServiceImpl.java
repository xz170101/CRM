package com.dyz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dyz.dao.UserChecksMapper;
import com.dyz.entity.Fenye;
import com.dyz.entity.UserChecks;
@Service
public class UserChecksServiceImpl implements UserChecksService {
	@Autowired
	private UserChecksMapper userchecksMapper;
	@Override
	public Fenye selectUserChecks(Fenye fenye) {
		// TODO Auto-generated method stub
		Integer total=userchecksMapper.selectCount(fenye);
		List<UserChecks> rows=userchecksMapper.selectUserChecks(fenye);
		fenye.setTotal(total);
		fenye.setRows(rows);
		return fenye;
	}

}
