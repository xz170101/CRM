package com.dyz.controller;


import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.dyz.entity.Student;
import com.dyz.util.ExportUtils;

@Controller
public class ExportExcel {
	@RequestMapping(value="/exportForm",method=RequestMethod.POST)
	public void exportForm(HttpServletResponse res,@RequestParam("stulist") String stu ,String fields){
		Gson gson=new Gson();
		List<Student> list=gson.fromJson(stu,new TypeToken<List<Student>>(){}.getType());
		System.out.println("stu="+stu);
		String fileName = new SimpleDateFormat("yyyyMMdd_HHmmss").format(new Date()) +".xls";
		res.setContentType("application/octet-stream; charset=utf-8");
		res.setHeader("Content-Disposition", "attachment;fileName="+fileName);
		HSSFWorkbook wb=new HSSFWorkbook();
		HSSFSheet sheet=wb.createSheet("sheet0");
		ExportUtils.outputHeaders(fields.split(","), sheet);
		ExportUtils.outputColumns(fields.split(","), list, sheet);
		//获取输出流
		try {
			ServletOutputStream stream = res.getOutputStream();
			wb.write(stream);
			stream.flush();
			stream.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
