package com.dyz.entity;

import org.springframework.stereotype.Component;

@Component
public class UserChecks {
	private Integer checks_Id;
	private Integer user_Id;
	private String userName;
	private String checkInTime;
	private String checkState;
	private Integer isCancel;
	private String checkOutTime;
	private Integer ucexit1int;
	private String ucexit2String;
	public Integer getChecks_Id() {
		return checks_Id;
	}
	public void setChecks_Id(Integer checks_Id) {
		this.checks_Id = checks_Id;
	}
	public Integer getUser_Id() {
		return user_Id;
	}
	public void setUser_Id(Integer user_Id) {
		this.user_Id = user_Id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getCheckInTime() {
		return checkInTime;
	}
	public void setCheckInTime(String checkInTime) {
		this.checkInTime = checkInTime;
	}
	public String getCheckState() {
		return checkState;
	}
	public void setCheckState(String checkState) {
		this.checkState = checkState;
	}
	public Integer getIsCancel() {
		return isCancel;
	}
	public void setIsCancel(Integer isCancel) {
		this.isCancel = isCancel;
	}
	public String getCheckOutTime() {
		return checkOutTime;
	}
	public void setCheckOutTime(String checkOutTime) {
		this.checkOutTime = checkOutTime;
	}
	public Integer getUcexit1int() {
		return ucexit1int;
	}
	public void setUcexit1int(Integer ucexit1int) {
		this.ucexit1int = ucexit1int;
	}
	public String getUcexit2String() {
		return ucexit2String;
	}
	public void setUcexit2String(String ucexit2String) {
		this.ucexit2String = ucexit2String;
	}
	@Override
	public String toString() {
		return "UserChecks [checks_Id=" + checks_Id + ", user_Id=" + user_Id + ", userName=" + userName
				+ ", checkInTime=" + checkInTime + ", checkState=" + checkState + ", isCancel=" + isCancel
				+ ", checkOutTime=" + checkOutTime + ", ucexit1int=" + ucexit1int + ", ucexit2String=" + ucexit2String
				+ "]";
	}
	
}
