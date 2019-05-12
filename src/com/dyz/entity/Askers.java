package com.dyz.entity;

public class Askers {
	private Integer askers_id;
	private String askers_name;
	private String checkState;
	private String checkInTime;
	private String changeState;
	private Integer weight;
	private String roleName;
	private String bakContent;
	private Integer aexitInt;
	private String aexitString;
	public Integer getAskers_id() {
		return askers_id;
	}
	public void setAskers_id(Integer askers_id) {
		this.askers_id = askers_id;
	}
	public String getAskers_name() {
		return askers_name;
	}
	public void setAskers_name(String askers_name) {
		this.askers_name = askers_name;
	}
	public String getCheckState() {
		return checkState;
	}
	public void setCheckState(String checkState) {
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
		return "Askers [askers_id=" + askers_id + ", askers_name=" + askers_name + ", checkState=" + checkState
				+ ", checkInTime=" + checkInTime + ", changeState=" + changeState + ", weight=" + weight + ", roleName="
				+ roleName + ", bakContent=" + bakContent + ", aexitInt=" + aexitInt + ", aexitString=" + aexitString
				+ "]";
	}
	
}
