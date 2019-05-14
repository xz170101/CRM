package com.dyz.entity;

import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class NetFollows {
	private Integer follows_Id;
	private Integer stu_Id;
	private String studentName;
	private String followTime;
	private String nextFollowTime;
	private String conTent;
	private Integer user_Id;
	private String followType;
	
	private String createTime;
	private String followState;
	private Integer nexit1int;
	private String nexit2String;

	private Student student;
	
	
	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public Integer getNexit1int() {
		return nexit1int;
	}

	public void setNexit1int(Integer nexit1int) {
		this.nexit1int = nexit1int;
	}

	public String getNexit2String() {
		return nexit2String;
	}

	public void setNexit2String(String nexit2String) {
		this.nexit2String = nexit2String;
	}

	public Integer getUser_Id() {
		return user_Id;
	}

	public void setUser_Id(Integer user_Id) {
		this.user_Id = user_Id;
	}

	public Integer getFollows_Id() {
		return follows_Id;
	}

	public void setFollows_Id(Integer follows_Id) {
		this.follows_Id = follows_Id;
	}

	public Integer getStu_Id() {
		return stu_Id;
	}

	public void setStu_Id(Integer stu_Id) {
		this.stu_Id = stu_Id;
	}

	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	public String getFollowTime() {
		return followTime;
	}

	public void setFollowTime(String followTime) {
		this.followTime = followTime;
	}

	public String getNextFollowTime() {
		return nextFollowTime;
	}

	public void setNextFollowTime(String nextFollowTime) {
		this.nextFollowTime = nextFollowTime;
	}

	public String getConTent() {
		return conTent;
	}

	public void setConTent(String conTent) {
		this.conTent = conTent;
	}

	public String getFollowType() {
		return followType;
	}

	public void setFollowType(String followType) {
		this.followType = followType;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getFollowState() {
		return followState;
	}

	public void setFollowState(String followState) {
		this.followState = followState;
	}

	
	

	@Override
	public String toString() {
		return "NetFollows [follows_Id=" + follows_Id + ", stu_Id=" + stu_Id + ", studentName=" + studentName
				+ ", followTime=" + followTime + ", nextFollowTime=" + nextFollowTime + ", conTent=" + conTent
				+ ", user_Id=" + user_Id + ", followType=" + followType + ", createTime=" + createTime
				+ ", followState=" + followState + ", nexit1int=" + nexit1int + ", nexit2String=" + nexit2String
				+  "]";
	}

		

	
	
}
