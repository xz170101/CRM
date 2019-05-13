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
	
	
	private Integer num1;
	private Integer num2;
	private Integer num3;
	private Integer num4;
	private Integer num5;
	private Integer num6;
 
	
	
	
	
	
 
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
	
	

}
