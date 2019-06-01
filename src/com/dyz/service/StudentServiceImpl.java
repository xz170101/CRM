package com.dyz.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dyz.dao.StudentMapper;
import com.dyz.entity.Askers;
import com.dyz.entity.Fenye;
import com.dyz.entity.Student;
@Service
public class StudentServiceImpl implements StudentService {
	@Autowired
	private StudentMapper studentMapper;
	
	@Override
	public Fenye selectStudent(Fenye fenye) {
		Integer total=studentMapper.selectCount(fenye);
		List<Student> rows=studentMapper.selectStudent(fenye);
		fenye.setTotal(total);
		fenye.setRows(rows);
		return fenye;
	}

	@Override
	public Integer delectStudent(Integer stu_id) {
		// TODO Auto-generated method stub
		return studentMapper.delectStudent(stu_id);
	}

	@Override
	public Integer insertStudent(Student student) {
		// TODO Auto-generated method stub
		return studentMapper.insertStudent(student);
	}

	@Override
	public Integer updatezixunname(Student student) {
		// TODO Auto-generated method stub
						
		return studentMapper.updatezixunname(student);
	}

	@Override
	public Integer updateStudent(Student student) {
		// TODO Auto-generated method stub
		
		Date date = new Date(); 
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		
		if(student.getStu_isHome()==1) {//判断是否上门
			//如果上门时间不为空
			if(student.getStu_HomeTime()!=null && !("".equals(student.getStu_HomeTime()))) {
			   student.setStu_HomeTime(student.getStu_HomeTime());//将初次上门时间获取到并传入学生对象中
			}else {
			   student.setStu_HomeTime(sdf.format(date));//如果上门了但是上门时间为空就给它设置一个默认时间

			}
		}else {
			student.setStu_HomeTime(null);
		}
		
				
		if(student.getStu_isPay()==1) {//判断是否缴费
			if(student.getStu_PayTime()!=null && !("".equals(student.getStu_PayTime()))) {
				student.setStu_PayTime(student.getStu_PayTime());
			}else{
				student.setStu_PayTime(sdf.format(date));
			}
			if(student.getStu_isReturnMoney()==1) {//判断是否退费
				if(student.getStu_ReturnMoneyReason()!=null && !("".equals(student.getStu_ReturnMoneyReason()))) {
					student.setStu_ReturnMoneyReason(student.getStu_ReturnMoneyReason());
				}else{
					student.setStu_ReturnMoneyReason(sdf.format(date));
				}
			}else{
				student.setStu_ReturnMoneyReason(null);
			}
		}else{
			student.setStu_PayTime(null);
			if(student.getStu_isReturnMoney()==1) {//判断是否退费
				student.setStu_isReturnMoney(0);
			}
		}
		

		if(student.getStu_isInClass()==1) {
			if(student.getStu_inClassTime()!=null && !("".equals(student.getStu_inClassTime()))) {
			   student.setStu_inClassTime(student.getStu_inClassTime());
			}else {
			   student.setStu_inClassTime(sdf.format(date));
			}
		}else {
			student.setStu_inClassTime(null);
		}
				
		if(student.getStu_preMoney()!=null) {
			if(student.getStu_preMoneyTime()!=null && !("".equals(student.getStu_preMoneyTime()))) {
			   student.setStu_preMoneyTime(student.getStu_preMoneyTime());
			   }else {
			   student.setStu_preMoneyTime(sdf.format(date));
			}
		}else {
			student.setStu_preMoneyTime(null);
		}
		return studentMapper.updateStudent(student);
	}

	@Override
	public List<Askers> selectzixunname() {
		// TODO Auto-generated method stub
		return studentMapper.selectzixunname();
	}

	@Override
	public Fenye selectLog(Fenye fenye) {
		Integer total=studentMapper.selectCount(fenye);
		List<Student> rows=studentMapper.selectLog(fenye);
		fenye.setTotal(total);
		fenye.setRows(rows);
		return fenye;
	}

	@Override
	public List<Student> selectpoi() {
		// TODO Auto-generated method stub
		return studentMapper.selectpoi();
	}

	@Override
	public Integer selectPhone(String stu_Phone) {
		// TODO Auto-generated method stub
		return studentMapper.selectPhone(stu_Phone);
	}

}
