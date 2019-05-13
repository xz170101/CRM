package com.dyz.entity;

import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class RoleModules {
	private Integer rm_Id; 
	private Integer roles_Id; 
	private Integer modules_Id; //代表的是父模块id
	private Integer rmexit1int; 
	private String rmexit2String;
	private Role role;
	private List<Module> module;
	
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}
	public List<Module> getModule() {
		return module;
	}
	public void setModule(List<Module> module) {
		this.module = module;
	}
	public Integer getRm_Id() {
		return rm_Id;
	}
	public void setRm_Id(Integer rm_Id) {
		this.rm_Id = rm_Id;
	}
	public Integer getRoles_Id() {
		return roles_Id;
	}
	public void setRoles_Id(Integer roles_Id) {
		this.roles_Id = roles_Id;
	}
	public Integer getModules_Id() {
		return modules_Id;
	}
	public void setModules_Id(Integer modules_Id) {
		this.modules_Id = modules_Id;
	}
	public Integer getRmexit1int() {
		return rmexit1int;
	}
	public void setRmexit1int(Integer rmexit1int) {
		this.rmexit1int = rmexit1int;
	}
	public String getRmexit2String() {
		return rmexit2String;
	}
	public void setRmexit2String(String rmexit2String) {
		this.rmexit2String = rmexit2String;
	}
	
}
