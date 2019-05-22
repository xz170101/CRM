package com.dyz.entity;

import java.util.List;

import org.springframework.stereotype.Component;
/**
 *分页实体类
 * @author DELL
 *
 */
@Component
public class Fenye {
	private Integer page;
	private Integer pageSize;
	private Integer total;
	private List<?> rows;
 //用来做多条件查询的 通用
	private String text1;
	private String text2;
	private String text3;
	private String text4;
	private String text5;
	private String text6;
	private String text7;
	private String text8;
	private String text9;
	
	
	private Integer num1;
	private Integer num2;
	private Integer num3;
	private Integer num4;
	private Integer num5;
	private Integer num6;
 
	private Student student;
	
	private String UserName;
	
	
	
 
	public String getUserName() {
		return UserName;
	}
	public void setUserName(String userName) {
		UserName = userName;
	}
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	public String getText1() {
		return text1;
	}
	public void setText1(String text1) {
		this.text1 = text1;
	}
	public String getText2() {
		return text2;
	}
	public void setText2(String text2) {
		this.text2 = text2;
	}
	public String getText3() {
		return text3;
	}
	public void setText3(String text3) {
		this.text3 = text3;
	}
	public String getText4() {
		return text4;
	}
	public void setText4(String text4) {
		this.text4 = text4;
	}
	public String getText5() {
		return text5;
	}
	public void setText5(String text5) {
		this.text5 = text5;
	}
	public String getText6() {
		return text6;
	}
	public void setText6(String text6) {
		this.text6 = text6;
	}
	
	public String getText7() {
		return text7;
	}
	public void setText7(String text7) {
		this.text7 = text7;
	}
	public String getText8() {
		return text8;
	}
	public void setText8(String text8) {
		this.text8 = text8;
	}
	public String getText9() {
		return text9;
	}
	public void setText9(String text9) {
		this.text9 = text9;
	}
	public Integer getNum1() {
		return num1;
	}
	public void setNum1(Integer num1) {
		this.num1 = num1;
	}
	public Integer getNum2() {
		return num2;
	}
	public void setNum2(Integer num2) {
		this.num2 = num2;
	}
	public Integer getNum3() {
		return num3;
	}
	public void setNum3(Integer num3) {
		this.num3 = num3;
	}
	public Integer getNum4() {
		return num4;
	}
	public void setNum4(Integer num4) {
		this.num4 = num4;
	}
	public Integer getNum5() {
		return num5;
	}
	public void setNum5(Integer num5) {
		this.num5 = num5;
	}
	public Integer getNum6() {
		return num6;
	}
	public void setNum6(Integer num6) {
		this.num6 = num6;
	}
	
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public Integer getTotal() {
		return total;
	}
	public void setTotal(Integer total) {
		this.total = total;
	}
	public List<?> getRows() {
		return rows;
	}
	public void setRows(List<?> rows) {
		this.rows = rows;
	}
	@Override
	public String toString() {
		return "Fenye [page=" + page + ", pageSize=" + pageSize + ", total=" + total + ", rows=" + rows + ", text1="
				+ text1 + ", text2=" + text2 + ", text3=" + text3 + ", text4=" + text4 + ", text5=" + text5 + ", text6="
				+ text6 + ", text7=" + text7 + ", text8=" + text8 + ", text9=" + text9 + ", num1=" + num1 + ", num2="
				+ num2 + ", num3=" + num3 + ", num4=" + num4 + ", num5=" + num5 + ", num6=" + num6 + ", student="
				+ student + "]";
	}
	
}
