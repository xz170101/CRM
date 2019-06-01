package com.dyz.dao;

import java.util.List;

import com.dyz.entity.Fenye;
import com.dyz.entity.Message;

public interface MessageMapper {
	/**
	 * 添加一条离线消息
	 * @param message
	 * @return
	 */
	Integer insertMessage(Message message);
	/**
	 * 查询离线信息
	 * @param fenye
	 * @return
	 */
	List<Message> selectMessage(Fenye fenye);
	/**
	 * 修改离线消息状态
	 * @param message
	 * @return
	 */
	Integer updateMess(Message message);
}
