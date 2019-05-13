package com.dyz.entity;

import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class UserRole {
	 
	private Integer ur_Id;
	private Integer roleId;
	private Integer userId;
	private Integer urexitInt;
	private String urexit2String;
	private User user;
	private List<Role> role;
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public List<Role> getRole() {
		return role;
	}
	public void setRole(List<Role> role) {
		this.role = role;
	}
	public Integer getUr_Id() {
		return ur_Id;
	}
	public void setUr_Id(Integer ur_Id) {
		this.ur_Id = ur_Id;
	}
	public Integer getRoleId() {
		return roleId;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getUrexitInt() {
		return urexitInt;
	}
	public void setUrexitInt(Integer urexitInt) {
		this.urexitInt = urexitInt;
	}
	public String getUrexit2String() {
		return urexit2String;
	}
	public void setUrexit2String(String urexit2String) {
		this.urexit2String = urexit2String;
	}
	
	

}
