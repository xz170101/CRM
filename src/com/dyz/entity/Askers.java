package com.dyz.entity;

import org.springframework.stereotype.Component;

@Component
public class Askers {
	private Integer askers_Id;
	private String askers_Name;
	private Boolean checkState;
	private String checkInTime;
	private String changeState;
	private Integer weight;
	private String roleName;
	private String bakContent;
	private Integer aexitInt;//咨询师的学生数量
	private String aexitString;
	private Integer usercheckid;
	
	
	public Integer getUsercheckid() {
		return usercheckid;
	}
	public void setUsercheckid(Integer usercheckid) {
		this.usercheckid = usercheckid;
	}
	public Integer getAskers_Id() {
		return askers_Id;
	}
	public void setAskers_Id(Integer askers_Id) {
		this.askers_Id = askers_Id;
	}
	
	public String getAskers_Name() {
		return askers_Name;
	}
	public void setAskers_Name(String askers_Name) {
		this.askers_Name = askers_Name;
	}
	
	public Boolean getCheckState() {
		return checkState;
	}
	public void setCheckState(Boolean checkState) {
		this.checkState = checkState;
	}
	public String getCheckInTime() {
		return checkInTime;
	}
	public void setCheckInTime(String checkInTime) {
		this.checkInTime = checkInTime;
	}
	public String getChangeState() {
		return changeState;
	}
	public void setChangeState(String changeState) {
		this.changeState = changeState;
	}
	public Integer getWeight() {
		return weight;
	}
	public void setWeight(Integer weight) {
		this.weight = weight;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public String getBakContent() {
		return bakContent;
	}
	public void setBakContent(String bakContent) {
		this.bakContent = bakContent;
	}
	public Integer getAexitInt() {
		return aexitInt;
	}
	public void setAexitInt(Integer aexitInt) {
		this.aexitInt = aexitInt;
	}
	public String getAexitString() {
		return aexitString;
	}
	public void setAexitString(String aexitString) {
		this.aexitString = aexitString;
	}
	@Override
	public String toString() {
		return "Askers [askers_Id=" + askers_Id + ", askers_Name=" + askers_Name + ", checkState=" + checkState
				+ ", checkInTime=" + checkInTime + ", changeState=" + changeState + ", weight=" + weight + ", roleName="
				+ roleName + ", bakContent=" + bakContent + ", aexitInt=" + aexitInt + ", aexitString=" + aexitString
				+ ", usercheckid=" + usercheckid + "]";
	}
	
	
}
