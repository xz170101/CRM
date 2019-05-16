package com.dyz.util;

import java.lang.reflect.Method;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;


public class ExportUtils {
	/**
	 * 输出表头
	 * @param headersInfo
	 * @param sheet
	 */
	public static void outputHeaders(String[] headersInfo,HSSFSheet sheet) {
		HSSFRow row=sheet.createRow(0);//创建表格的一个行，输入表头
		for (int i = 0; i < headersInfo.length; i++) {
			sheet.setColumnWidth(i, 4000);//设置excel的列宽
			row.createCell(i).setCellValue(headersInfo[i]);//将获取到的列的名称依次写入
		}
	}
	/**
	 * 循环输出每行每列
	 * @param headersInfo
	 * @param columnsInfo
	 * @param sheet
	 */
	public static void outputColumns(String[] headersInfo,List columnsInfo,HSSFSheet sheet) {
		System.out.println("columnsInfo="+columnsInfo);
		HSSFRow row;
		int headerSize=headersInfo.length;//获取表头的长度
		int columnSize=columnsInfo.size();//获取每一行的长度
		//循环插入多少行
		for (int i = 0; i < columnsInfo.size(); i++) {//循环集合行的长度
			row=sheet.createRow(i+1);//创建第一行，除却表头的第一行
			Object obj=columnsInfo.get(i);//循环获取行的下表赋值给对象
			//循环每行多少列
			for (int j = 0; j < headersInfo.length; j++) {
				Object value=getFieldValueByName(headersInfo[j],obj);
				row.createCell(j).setCellValue(value.toString());
			}
			
		}
		
	}
	/**
	 * 根据对象的属性获取值
	 * @param string
	 * @param obj
	 * @return
	 */
	private static Object getFieldValueByName(String fields, Object obj) {
		// TODO Auto-generated method stub
		String firstLetter=fields.substring(0,1).toUpperCase();//第一个字符转换成大写
		String getter="get"+firstLetter+fields.substring(1);//获取字符的getter的方法
		try {
			Method method = obj.getClass().getMethod(getter, new Class[] {});//在类中得到getter方法
			Object value=method.invoke(obj, new Object[] {});//得到获取的值ֵ
			return value;//返回出值 
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("属性不存在！");
			return null;
		}
		
	}
}
