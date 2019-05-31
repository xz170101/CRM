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
		System.out.println(total);
		List<UserChecks> rows=userchecksMapper.selectUserChecks(fenye);
		System.out.println(rows);
		fenye.setTotal(total);
		fenye.setRows(rows);
		System.out.println(fenye);
		return fenye;
	}
	@Override
	public Integer updateQuanTui() {
		// TODO Auto-generated method stub
		return userchecksMapper.updateQuanTui();
	}
	@Override
	public Integer updateUserchecks(UserChecks userchecks) {
		// TODO Auto-generated method stub
		return userchecksMapper.updateUserchecks(userchecks);
	}
	@Override
	public Integer selectcheckstate(int user_Id) {
		// TODO Auto-generated method stub
		return userchecksMapper.selectcheckstate(user_Id);
	}
	@Override
	public Integer selectdangtian(Integer user_Id) {
		// TODO Auto-generated method stub
		return userchecksMapper.selectdangtian(user_Id);
	}
	@Override
	public Integer selectByUserCheck(Integer user_Id) {
		// TODO Auto-generated method stub
		return userchecksMapper.selectByUserCheck(user_Id);
	}
	@Override
	public Integer insertUserChecks(UserChecks usercheck) {
		// TODO Auto-generated method stub
		return userchecksMapper.insertUserChecks(usercheck);
	}

}
