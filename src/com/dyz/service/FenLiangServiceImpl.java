package com.dyz.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dyz.dao.FenLiangMapper;
import com.dyz.entity.Askers;
import com.dyz.entity.Student;
@Service
public class FenLiangServiceImpl implements FenLiangService {
	@Autowired
	private FenLiangMapper fenliangMapper;
	@Override
	public List<Askers> selectzixunname() {
		// TODO Auto-generated method stub
		return fenliangMapper.selectzixunname();
	}

	@Override
	public List<Student> selectStuByZiXunName() {
		// TODO Auto-generated method stub
		return fenliangMapper.selectStuByZiXunName();
	}

	
	public void fenliang(HttpSession session) {
		// 未分配的学生并按学生的价值排序
		List<Student> students = fenliangMapper.selectStuByZiXunName();
		// 所有签到的咨询师，并按咨询师的价值排序
		List<Askers> askers = fenliangMapper.selectMaxZiXunShi();
		Boolean state = (Boolean) session.getAttribute("fenliang");
		
		if (state) {
			if (students.size() > 0 && askers.size() > 1) {
				Integer count = 0;
				Integer a = null;
				for (int i = 0; i <= askers.size() - 1; i++) {
					
					if (i < askers.size() - 1) {
						a = askers.get(i + 1).getAexit1Int() - askers.get(i).getAexit1Int();
						//判断咨询师现有学生数量进行判断
						if (a == 0) {//当咨询师之间的学生数量正好相等
							a=1;
						}
					}
					if (i ==askers.size() - 1) {
							i=-1;
							askers = fenliangMapper.selectMaxZiXunShi();
							continue;
					}
					for (int k = 0; k < a; k++) {//小于咨询师之间的学生数量相等的长度
						// 为学生分配咨询师
						Student stu = new Student();
						stu.setAskers_Id(askers.get(i).getAskers_Id());
						stu.setStu_id(students.get(count).getStu_id());
						stu.setStu_ZiXunName(askers.get(i).getAskers_Name());						
						fenliangMapper.updateFenliang(stu);
						// 咨询师手中学生数递加
						Askers asker2 = new Askers();
						asker2.setAskers_Id(askers.get(i).getAskers_Id());
						fenliangMapper.updateAskersCount(asker2);
						count++;
						if (count == students.size()) {
							System.out.println(count == students.size());
							break;
						}
					}
					if (count == students.size()) {
						/*System.out.println(count == students.size());*/
						break;
					}
				}
			}
		}
	}
	@Override
	public Integer selectAskerStu_count(int userChecksId) {
		// TODO Auto-generated method stub
		return fenliangMapper.selectAskerStu_count(userChecksId);
	}

	@Override
	public List<Askers> selectMaxZiXunShi() {
		// TODO Auto-generated method stub
		return fenliangMapper.selectMaxZiXunShi();
	}

}
