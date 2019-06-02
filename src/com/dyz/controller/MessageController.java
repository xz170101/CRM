package com.dyz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dyz.entity.Fenye;
import com.dyz.entity.Message;
import com.dyz.service.MessageService;

@Controller
public class MessageController {
	@Autowired
	private MessageService messageService;
	//添加
	@RequestMapping(value="/insertMessage",method=RequestMethod.POST)
	@ResponseBody
	public Integer insertMessage(Message message) {
		return messageService.insertMessage(message);
	}
	//查询
	@RequestMapping(value="/selectMessage",method=RequestMethod.POST)
	@ResponseBody
	public Fenye selectMessage(Fenye fenye) {
		return messageService.selectMessage(fenye);
	}
	@RequestMapping(value="/updateMess",method=RequestMethod.POST)
	@ResponseBody
	public Integer updateMess(Message message) {
		return messageService.updateMess(message);
	}
	@RequestMapping(value="/selectWeiduCount",method=RequestMethod.POST)
	@ResponseBody
	public Fenye selectWeiduCount(Fenye fenye) {
		return messageService.selectWeiduCount(fenye);
	}
}
