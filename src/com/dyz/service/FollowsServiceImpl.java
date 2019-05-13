package com.dyz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dyz.dao.NetFollowsMapper;
import com.dyz.entity.Fenye;
import com.dyz.entity.NetFollows;

@Service
public class FollowsServiceImpl implements FollowsService {
	@Autowired
	private NetFollowsMapper followsMapper;
	@Override
	public Fenye selectFollows(Fenye fenye) {
		Integer total=followsMapper.selectCount(fenye);
		List<NetFollows> rows=followsMapper.selectNetFollows(fenye);
		fenye.setTotal(total);
		fenye.setRows(rows);
		return fenye;
	}

}
