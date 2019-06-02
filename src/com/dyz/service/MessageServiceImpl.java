package com.dyz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dyz.dao.MessageMapper;
import com.dyz.entity.Fenye;
import com.dyz.entity.Message;

@Service
public class MessageServiceImpl implements MessageService {
	@Autowired
	private MessageMapper messageMapper;
	
	@Override
	public Integer insertMessage(Message message) {
		// TODO Auto-generated method stub
		return messageMapper.insertMessage(message);
	}

	@Override
	public Fenye selectMessage(Fenye fenye) {
		// TODO Auto-generated method stub
		List<Message> selectMessage = messageMapper.selectMessage(fenye);
		fenye.setRows(selectMessage);
		return fenye;
	}

	@Override
	public Integer updateMess(Message message) {
		// TODO Auto-generated method stub
		return messageMapper.updateMess(message);
	}

	@Override
	public Fenye selectWeiduCount(Fenye fenye) {
		// TODO Auto-generated method stub
		Integer count = messageMapper.selectWeiduCount(fenye);
		fenye.setTotal(count);
		return fenye;
	}
}
