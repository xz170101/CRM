package com.dyz.entity;

import org.springframework.stereotype.Component;

@Component
public class Message {
	private Integer me_id;
	private String me_startdate;
	private String me_content;
	private String me_seedate;
	private Integer me_isstate;
	private Integer me_exitInt;
	private String me_exitString;
	private String me_sender;
	private String me_receiver;

	public String getMe_receiver() {
		return me_receiver;
	}

	public void setMe_receiver(String me_receiver) {
		this.me_receiver = me_receiver;
	}

	public String getMe_sender() {
		return me_sender;
	}

	public void setMe_sender(String me_sender) {
		this.me_sender = me_sender;
	}

	public Integer getMe_id() {
		return me_id;
	}

	public void setMe_id(Integer me_id) {
		this.me_id = me_id;
	}

	public String getMe_startdate() {
		return me_startdate;
	}

	public void setMe_startdate(String me_startdate) {
		this.me_startdate = me_startdate;
	}

	public String getMe_content() {
		return me_content;
	}

	public void setMe_content(String me_content) {
		this.me_content = me_content;
	}

	public String getMe_seedate() {
		return me_seedate;
	}

	public void setMe_seedate(String me_seedate) {
		this.me_seedate = me_seedate;
	}

	public Integer getMe_isstate() {
		return me_isstate;
	}

	public void setMe_isstate(Integer me_isstate) {
		this.me_isstate = me_isstate;
	}

	public Integer getMe_exitInt() {
		return me_exitInt;
	}

	public void setMe_exitInt(Integer me_exitInt) {
		this.me_exitInt = me_exitInt;
	}

	public String getMe_exitString() {
		return me_exitString;
	}

	public void setMe_exitString(String me_exitString) {
		this.me_exitString = me_exitString;
	}

	@Override
	public String toString() {
		return "Message [me_id=" + me_id + ", me_startdate=" + me_startdate + ", me_content=" + me_content
				+ ", me_seedate=" + me_seedate + ", me_isstate=" + me_isstate + ", me_exitInt=" + me_exitInt
				+ ", me_exitString=" + me_exitString + ", me_sender=" + me_sender + ", me_receiver=" + me_receiver
				+ "]";
	}
}
