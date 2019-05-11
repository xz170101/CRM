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
