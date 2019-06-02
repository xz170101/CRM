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
	/**
	 * 查询出未读消息的条数
	 * @param fenye
	 * @return
	 */
	Integer selectWeiduCount(Fenye fenye);
	/**
	 * 根据状态删除已读消息
	 * @param me_id
	 * @return
	 */
	Integer deleteMessage(String UserName);
}
