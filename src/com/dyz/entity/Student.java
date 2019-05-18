package com.dyz.entity;

import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class Student {
	private Integer stu_id;
	private Integer user_Id;
	private Integer roles_Id;
	private String stu_Name;
	private Integer stu_Age;
	private Integer stu_Sex;
	private String stu_Phone;
	private String stu_Status;//学历
	private String stu_PerState;//状态
	private String stu_MsgSource;
	private String stu_SourceUrl;
	private String stu_SourceKeyWord;
	private String stu_Address;
	private String stu_NetPusherld;
	private Integer askers_Id;
	private String stu_qq;
	private String stu_WeiXin;
	private String stu_Content;
	private String stu_CreateTime;
	private String stu_LearnForward;
	private Integer stu_isValid;
	private String stu_Record;
	private Integer stu_isReturnVist;
	private Integer stu_isHome;
	private String stu_firstVisitTime;
	private String stu_HomeTime;
	private String stu_LostValid;
	private Integer stu_isPay;
	private String stu_PayTime;
	private Double stu_Money;
	private Integer stu_isReturnMoney;
	private Integer stu_isInClass;
	private String stu_inClassTime;
	private String stu_inClassContent;
	private String stu_AskerContent;
	private Integer stu_isDel;
	private String stu_FromPart;
	private String stu_stuConcern;
	private Integer stu_isBaoBei;
	private String stu_ZiXunName;
	private String stu_CreateUser;
	private String stu_ReturnMoneyReason;
	private Double stu_preMoney;
	private String stu_preMoneyTime;
	private Integer sexitInte;//打分
	private String sexitString;
	private NetFollows netFollows;
	

	public NetFollows getNetFollows() {
		return netFollows;
	}
	public void setNetFollows(NetFollows netFollows) {
		this.netFollows = netFollows;
	}
	public Integer getStu_id() {
		return stu_id;
	}
	public void setStu_id(Integer stu_id) {
		this.stu_id = stu_id;
	}
	public Integer getUser_Id() {
		return user_Id;
	}
	public void setUser_Id(Integer user_Id) {
		this.user_Id = user_Id;
	}
	public Integer getRoles_Id() {
		return roles_Id;
	}
	public void setRoles_Id(Integer roles_Id) {
		this.roles_Id = roles_Id;
	}
	public String getStu_Name() {
		return stu_Name;
	}
	public void setStu_Name(String stu_Name) {
		this.stu_Name = stu_Name;
	}
	public Integer getStu_Age() {
		return stu_Age;
	}
	public void setStu_Age(Integer stu_Age) {
		this.stu_Age = stu_Age;
	}
	public Integer getStu_Sex() {
		return stu_Sex;
	}
	public void setStu_Sex(Integer stu_Sex) {
		this.stu_Sex = stu_Sex;
	}
	public String getStu_Phone() {
		return stu_Phone;
	}
	public void setStu_Phone(String stu_Phone) {
		this.stu_Phone = stu_Phone;
	}
	public String getStu_Status() {
		return stu_Status;
	}
	public void setStu_Status(String stu_Status) {
		this.stu_Status = stu_Status;
	}
	public String getStu_PerState() {
		return stu_PerState;
	}
	public void setStu_PerState(String stu_PerState) {
		this.stu_PerState = stu_PerState;
	}
	public String getStu_MsgSource() {
		return stu_MsgSource;
	}
	public void setStu_MsgSource(String stu_MsgSource) {
		this.stu_MsgSource = stu_MsgSource;
	}
	public String getStu_SourceUrl() {
		return stu_SourceUrl;
	}
	public void setStu_SourceUrl(String stu_SourceUrl) {
		this.stu_SourceUrl = stu_SourceUrl;
	}
	public String getStu_SourceKeyWord() {
		return stu_SourceKeyWord;
	}
	public void setStu_SourceKeyWord(String stu_SourceKeyWord) {
		this.stu_SourceKeyWord = stu_SourceKeyWord;
	}
	public String getStu_Address() {
		return stu_Address;
	}
	public void setStu_Address(String stu_Address) {
		this.stu_Address = stu_Address;
	}
	public String getStu_NetPusherld() {
		return stu_NetPusherld;
	}
	public void setStu_NetPusherld(String stu_NetPusherld) {
		this.stu_NetPusherld = stu_NetPusherld;
	}
	public Integer getAskers_Id() {
		return askers_Id;
	}
	public void setAskers_Id(Integer askers_Id) {
		this.askers_Id = askers_Id;
	}
	public String getStu_qq() {
		return stu_qq;
	}
	public void setStu_qq(String stu_qq) {
		this.stu_qq = stu_qq;
	}
	public String getStu_WeiXin() {
		return stu_WeiXin;
	}
	public void setStu_WeiXin(String stu_WeiXin) {
		this.stu_WeiXin = stu_WeiXin;
	}
	public String getStu_Content() {
		return stu_Content;
	}
	public void setStu_Content(String stu_Content) {
		this.stu_Content = stu_Content;
	}
	public String getStu_CreateTime() {
		return stu_CreateTime;
	}
	public void setStu_CreateTime(String stu_CreateTime) {
		this.stu_CreateTime = stu_CreateTime;
	}
	public String getStu_LearnForward() {
		return stu_LearnForward;
	}
	public void setStu_LearnForward(String stu_LearnForward) {
		this.stu_LearnForward = stu_LearnForward;
	}
	public Integer getStu_isValid() {
		return stu_isValid;
	}
	public void setStu_isValid(Integer stu_isValid) {
		this.stu_isValid = stu_isValid;
	}
	public String getStu_Record() {
		return stu_Record;
	}
	public void setStu_Record(String stu_Record) {
		this.stu_Record = stu_Record;
	}
	public Integer getStu_isReturnVist() {
		return stu_isReturnVist;
	}
	public void setStu_isReturnVist(Integer stu_isReturnVist) {
		this.stu_isReturnVist = stu_isReturnVist;
	}
	public Integer getStu_isHome() {
		return stu_isHome;
	}
	public void setStu_isHome(Integer stu_isHome) {
		this.stu_isHome = stu_isHome;
	}
	public String getStu_firstVisitTime() {
		return stu_firstVisitTime;
	}
	public void setStu_firstVisitTime(String stu_firstVisitTime) {
		this.stu_firstVisitTime = stu_firstVisitTime;
	}
	public String getStu_HomeTime() {
		return stu_HomeTime;
	}
	public void setStu_HomeTime(String stu_HomeTime) {
		this.stu_HomeTime = stu_HomeTime;
	}
	public String getStu_LostValid() {
		return stu_LostValid;
	}
	public void setStu_LostValid(String stu_LostValid) {
		this.stu_LostValid = stu_LostValid;
	}
	public Integer getStu_isPay() {
		return stu_isPay;
	}
	public void setStu_isPay(Integer stu_isPay) {
		this.stu_isPay = stu_isPay;
	}
	public String getStu_PayTime() {
		return stu_PayTime;
	}
	public void setStu_PayTime(String stu_PayTime) {
		this.stu_PayTime = stu_PayTime;
	}
	public Double getStu_Money() {
		return stu_Money;
	}
	public void setStu_Money(Double stu_Money) {
		this.stu_Money = stu_Money;
	}
	public Integer getStu_isReturnMoney() {
		return stu_isReturnMoney;
	}
	public void setStu_isReturnMoney(Integer stu_isReturnMoney) {
		this.stu_isReturnMoney = stu_isReturnMoney;
	}
	public Integer getStu_isInClass() {
		return stu_isInClass;
	}
	public void setStu_isInClass(Integer stu_isInClass) {
		this.stu_isInClass = stu_isInClass;
	}
	public String getStu_inClassTime() {
		return stu_inClassTime;
	}
	public void setStu_inClassTime(String stu_inClassTime) {
		this.stu_inClassTime = stu_inClassTime;
	}
	public String getStu_inClassContent() {
		return stu_inClassContent;
	}
	public void setStu_inClassContent(String stu_inClassContent) {
		this.stu_inClassContent = stu_inClassContent;
	}
	public String getStu_AskerContent() {
		return stu_AskerContent;
	}
	public void setStu_AskerContent(String stu_AskerContent) {
		this.stu_AskerContent = stu_AskerContent;
	}
	public Integer getStu_isDel() {
		return stu_isDel;
	}
	public void setStu_isDel(Integer stu_isDel) {
		this.stu_isDel = stu_isDel;
	}
	public String getStu_FromPart() {
		return stu_FromPart;
	}
	public void setStu_FromPart(String stu_FromPart) {
		this.stu_FromPart = stu_FromPart;
	}
	public String getStu_stuConcern() {
		return stu_stuConcern;
	}
	public void setStu_stuConcern(String stu_stuConcern) {
		this.stu_stuConcern = stu_stuConcern;
	}
	public Integer getStu_isBaoBei() {
		return stu_isBaoBei;
	}
	public void setStu_isBaoBei(Integer stu_isBaoBei) {
		this.stu_isBaoBei = stu_isBaoBei;
	}
	public String getStu_ZiXunName() {
		return stu_ZiXunName;
	}
	public void setStu_ZiXunName(String stu_ZiXunName) {
		this.stu_ZiXunName = stu_ZiXunName;
	}
	public String getStu_CreateUser() {
		return stu_CreateUser;
	}
	public void setStu_CreateUser(String stu_CreateUser) {
		this.stu_CreateUser = stu_CreateUser;
	}
	public String getStu_ReturnMoneyReason() {
		return stu_ReturnMoneyReason;
	}
	public void setStu_ReturnMoneyReason(String stu_ReturnMoneyReason) {
		this.stu_ReturnMoneyReason = stu_ReturnMoneyReason;
	}
	public Double getStu_preMoney() {
		return stu_preMoney;
	}
	public void setStu_preMoney(Double stu_preMoney) {
		this.stu_preMoney = stu_preMoney;
	}
	public String getStu_preMoneyTime() {
		return stu_preMoneyTime;
	}
	public void setStu_preMoneyTime(String stu_preMoneyTime) {
		this.stu_preMoneyTime = stu_preMoneyTime;
	}
	public Integer getSexitInte() {
		return sexitInte;
	}
	public void setSexitInte(Integer sexitInte) {
		this.sexitInte = sexitInte;
	}
	public String getSexitString() {
		return sexitString;
	}
	public void setSexitString(String sexitString) {
		this.sexitString = sexitString;
	}
	@Override
	public String toString() {
		return "Student [stu_id=" + stu_id + ", user_Id=" + user_Id + ", roles_Id=" + roles_Id + ", stu_Name="
				+ stu_Name + ", stu_Age=" + stu_Age + ", stu_Sex=" + stu_Sex + ", stu_Phone=" + stu_Phone
				+ ", stu_Status=" + stu_Status + ", stu_PerState=" + stu_PerState + ", stu_MsgSource=" + stu_MsgSource
				+ ", stu_SourceUrl=" + stu_SourceUrl + ", stu_SourceKeyWord=" + stu_SourceKeyWord + ", stu_Address="
				+ stu_Address + ", stu_NetPusherld=" + stu_NetPusherld + ", askers_Id=" + askers_Id + ", stu_qq="
				+ stu_qq + ", stu_WeiXin=" + stu_WeiXin + ", stu_Content=" + stu_Content + ", stu_CreateTime="
				+ stu_CreateTime + ", stu_LearnForward=" + stu_LearnForward + ", stu_isValid=" + stu_isValid
				+ ", stu_Record=" + stu_Record + ", stu_isReturnVist=" + stu_isReturnVist + ", stu_isHome=" + stu_isHome
				+ ", stu_firstVisitTime=" + stu_firstVisitTime + ", stu_HomeTime=" + stu_HomeTime + ", stu_LostValid="
				+ stu_LostValid + ", stu_isPay=" + stu_isPay + ", stu_PayTime=" + stu_PayTime + ", stu_Money="
				+ stu_Money + ", stu_isReturnMoney=" + stu_isReturnMoney + ", stu_isInClass=" + stu_isInClass
				+ ", stu_inClassTime=" + stu_inClassTime + ", stu_inClassContent=" + stu_inClassContent
				+ ", stu_AskerContent=" + stu_AskerContent + ", stu_isDel=" + stu_isDel + ", stu_FromPart="
				+ stu_FromPart + ", stu_stuConcern=" + stu_stuConcern + ", stu_isBaoBei=" + stu_isBaoBei
				+ ", stu_ZiXunName=" + stu_ZiXunName + ", stu_CreateUser=" + stu_CreateUser + ", stu_ReturnMoneyReason="
				+ stu_ReturnMoneyReason + ", stu_preMoney=" + stu_preMoney + ", stu_preMoneyTime=" + stu_preMoneyTime
				+ ", sexitInte=" + sexitInte + ", sexitString=" + sexitString + "]";
	}
	
	
}
