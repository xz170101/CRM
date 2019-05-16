package com.dyz.util;

import java.lang.reflect.Method;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;


public class ExportUtils {
	/**
	 * �����ͷ
	 * @param headersInfo
	 * @param sheet
	 */
	public static void outputHeaders(String[] headersInfo,HSSFSheet sheet) {
		HSSFRow row=sheet.createRow(0);//��������һ���У������ͷ
		for (int i = 0; i < headersInfo.length; i++) {
			sheet.setColumnWidth(i, 4000);//����excel���п�
			row.createCell(i).setCellValue(headersInfo[i]);//����ȡ�����е���������д��
		}
	}
	/**
	 * ѭ�����ÿ��ÿ��
	 * @param headersInfo
	 * @param columnsInfo
	 * @param sheet
	 */
	public static void outputColumns(String[] headersInfo,List columnsInfo,HSSFSheet sheet) {
		System.out.println("columnsInfo="+columnsInfo);
		HSSFRow row;
		int headerSize=headersInfo.length;//��ȡ��ͷ�ĳ���
		int columnSize=columnsInfo.size();//��ȡÿһ�еĳ���
		System.out.println(headerSize);
		//ѭ�����������
		for (int i = 0; i < columnsInfo.size(); i++) {//ѭ�������еĳ���
			row=sheet.createRow(i+1);//������һ�У���ȴ��ͷ�ĵ�һ��
			Object obj=columnsInfo.get(i);//ѭ����ȡ�е��±�ֵ������
			//ѭ��ÿ�ж�����
			for (int j = 0; j < headersInfo.length; j++) {
				Object value=getFieldValueByName(headersInfo[j],obj);
				row.createCell(j).setCellValue(value.toString());
			}
			
		}
		
	}
	/**
	 * ���ݶ�������Ի�ȡֵ
	 * @param string
	 * @param obj
	 * @return
	 */
	private static Object getFieldValueByName(String fields, Object obj) {
		// TODO Auto-generated method stub
		String firstLetter=fields.substring(0,1).toUpperCase();//��һ���ַ�ת���ɴ�д
		String getter="get"+firstLetter+fields.substring(1);//��ȡ�ַ���getter�ķ���
		try {
			Method method = obj.getClass().getMethod(getter, new Class[] {});//�����еõ�getter����
			Object value=method.invoke(obj, new Object[] {});//�õ���ȡ��ֵ
			return value;//���س�ֵ 
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("���Բ����ڣ�");
			return null;
		}
		
	}
}
