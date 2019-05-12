package com.dyz.entity;

import org.springframework.stereotype.Component;

@Component
public class Module {
	private Integer modules_Id;//模块Id 
	private Integer parentId;//父模块编号
	private Integer modules_weight;//模块权重
	private String modules_Name;//模块名称
	private String modules_path;//模块路径
	private Integer mexit1int;
	private String mexit2String;
	public Integer getModules_Id() {
		return modules_Id;
	}
	public void setModules_Id(Integer modules_Id) {
		this.modules_Id = modules_Id;
	}
	public Integer getParentId() {
		return parentId;
	}
	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}
	public Integer getModules_weight() {
		return modules_weight;
	}
	public void setModules_weight(Integer modules_weight) {
		this.modules_weight = modules_weight;
	}
	public String getModules_Name() {
		return modules_Name;
	}
	public void setModules_Name(String modules_Name) {
		this.modules_Name = modules_Name;
	}
	public String getModules_path() {
		return modules_path;
	}
	public void setModules_path(String modules_path) {
		this.modules_path = modules_path;
	}
	public Integer getMexit1int() {
		return mexit1int;
	}
	public void setMexit1int(Integer mexit1int) {
		this.mexit1int = mexit1int;
	}
	public String getMexit2String() {
		return mexit2String;
	}
	public void setMexit2String(String mexit2String) {
		this.mexit2String = mexit2String;
	}
	
	
	
}
