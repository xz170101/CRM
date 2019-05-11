package com.dyz.entity;

import org.springframework.stereotype.Component;

@Component
public class User {
	private Integer user_Id;
	private String loginName;//登录名
	private String passWord;//密码
	private Integer psdWrongTime;//密码错误次数
	private String lockTime;//被锁定时间
	private String protectEMail;//密保邮箱
	private String protectMTel;//密保手机号
	private String loginTime;//登录时间
	private String createTime;//账户创立时间
	private Integer isLockout;//是否锁定
	private String uexit2String;
	private Integer uexit1int;
	public Integer getUser_Id() {
		return user_Id;
	}
	public void setUser_Id(Integer user_Id) {
		this.user_Id = user_Id;
	}
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	public Integer getPsdWrongTime() {
		return psdWrongTime;
	}
	public void setPsdWrongTime(Integer psdWrongTime) {
		this.psdWrongTime = psdWrongTime;
	}
	public String getLockTime() {
		return lockTime;
	}
	public void setLockTime(String lockTime) {
		this.lockTime = lockTime;
	}
	public String getProtectEMail() {
		return protectEMail;
	}
	public void setProtectEMail(String protectEMail) {
		this.protectEMail = protectEMail;
	}
	public String getProtectMTel() {
		return protectMTel;
	}
	public void setProtectMTel(String protectMTel) {
		this.protectMTel = protectMTel;
	}
	public String getLoginTime() {
		return loginTime;
	}
	public void setLoginTime(String loginTime) {
		this.loginTime = loginTime;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public Integer getIsLockout() {
		return isLockout;
	}
	public void setIsLockout(Integer isLockout) {
		this.isLockout = isLockout;
	}
	public String getUexit2String() {
		return uexit2String;
	}
	public void setUexit2String(String uexit2String) {
		this.uexit2String = uexit2String;
	}
	public Integer getUexit1int() {
		return uexit1int;
	}
	public void setUexit1int(Integer uexit1int) {
		this.uexit1int = uexit1int;
	}
	@Override
	public String toString() {
		return "User [user_Id=" + user_Id + ", loginName=" + loginName + ", passWord=" + passWord + ", psdWrongTime="
				+ psdWrongTime + ", lockTime=" + lockTime + ", protectEMail=" + protectEMail + ", protectMTel="
				+ protectMTel + ", loginTime=" + loginTime + ", createTime=" + createTime + ", isLockout=" + isLockout
				+ ", uexit2String=" + uexit2String + ", uexit1int=" + uexit1int + "]";
	}
	
	
	
	
	
	

}
