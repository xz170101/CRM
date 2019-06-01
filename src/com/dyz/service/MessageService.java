package com.dyz.service;

import java.util.List;

import com.dyz.entity.Fenye;
import com.dyz.entity.Message;

public interface MessageService {
	/**
	 * 添加离线信息
	 * @param message
	 * @return
	 */
	Integer insertMessage(Message message);
	/**
	 * 查询离线信息
	 * @param fenye
	 * @return
	 */
	Fenye selectMessage(Fenye fenye);
	/**
	 * 修改离线消息状态
	 * @param message
	 * @return
	 */
	Integer updateMess(Message message);
}