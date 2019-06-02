package com.dyz.controller;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;


@ServerEndpoint("/NetworkConsultant/{name}")


public class MyWebsocket{
	private static Map<String, MyWebsocket> map=new ConcurrentHashMap<>();
	private Session session=null;
	private String name;
	private static int count=0;
	@OnOpen
	public void onopen(@PathParam("name")String name,Session session) {
		System.out.println(session);
		this.session=session;
		this.name=name;
		map.put(name, this);
		count++;
		System.out.println("连接建立了"+name);
	}
	@OnMessage
	public void onmessage(String message) {
		System.out.println(message);
		String[] split = message.split(",");
		String formName=split[0];
		String tomName=split[1];
		String content=split[2];
		if(map.containsKey(tomName)) {
			//咨询师
			map.get(tomName).session.getAsyncRemote().sendText(content);
		}else {
			//咨询师离线消息
		}
		
		
	}
	@OnClose
	public void onclose() {
		System.out.println("连接退出了");
		map.remove(name);
		count--;
	}
	@OnError
	public void onerror(Session session,Throwable throwable) {}
	

}
