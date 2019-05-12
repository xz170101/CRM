package com.dyz.entity;

import org.springframework.stereotype.Component;

@Component
public class Role {
	
	private Integer roles_Id;
	private String roles_Name;
	private Integer roles_Int;
	private String roles_String;
	public Integer getRoles_Id() {
		return roles_Id;
	}
	public void setRoles_Id(Integer roles_Id) {
		this.roles_Id = roles_Id;
	}
	public String getRoles_Name() {
		return roles_Name;
	}
	public void setRoles_Name(String roles_Name) {
		this.roles_Name = roles_Name;
	}
	public Integer getRoles_Int() {
		return roles_Int;
	}
	public void setRoles_Int(Integer roles_Int) {
		this.roles_Int = roles_Int;
	}
	public String getRoles_String() {
		return roles_String;
	}
	public void setRoles_String(String roles_String) {
		this.roles_String = roles_String;
	}
	
	 
}
