package com.dyz.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dyz.entity.Student;
import com.dyz.service.AskersService;
import com.dyz.service.FenLiangService;

@Controller
public class FenLiangController {
	@Autowired
	private FenLiangService fenLiangService;
	
	@Autowired
	private AskersService askersService;
	
	@RequestMapping(value = "/fenliang", method = RequestMethod.POST)
	@ResponseBody
	public String editWEight(Boolean checked, HttpSession session) {
		session.setAttribute("fenliang", checked);
		if (checked == true) {
			fenLiangService.fenliang(session);
		}
		return null;
	}
	
	/**
	 * 查询所有未被跟踪的咨询师
	 */
	@RequestMapping(value = "/selectstunull", method = RequestMethod.POST)
	@ResponseBody
	public List<Student> selectstunul() {
		
		return fenLiangService.selectStuByZiXunName();
	}
	
	
	/*@RequestMapping(value="/fenliang",method=RequestMethod.POST)
	public void fenliang() {
		// TODO Auto-generated method stub
		 List<Student> stuByZiXunName = fenLiangService.selectStuByZiXunName();//所有没有分配的学生
		 List<Askers> askers = fenLiangService.selectzixunname();//按权重查询所有的咨询师
		 int total=stuByZiXunName.size();//总任务的长度
		 int totalWeight=0;//总权重
		 for (int i = 0; i < askers.size(); i++) {
			 Askers askers2 = askers.get(i);//获取所有咨询师的下标
			 Integer weight = askers2.getWeight();//取出权重
			 totalWeight+=weight;//将取出的权重添加到总权重上
		 }
		 Integer maxInt = getMaxInt(totalWeight, total);//获得能整除的最大数
		 Integer rest=total-maxInt;//没有分配的学生的总数减去能整除的最大数
		 List<Student> stulist=new ArrayList<Student>();//要保存的结果集
		 for (int i = 0; i <askers.size(); i++) {
			Integer assignNum=maxInt/totalWeight*(askers.get(i).getWeight());//获取每个人分配的数量
			Integer count=0;
			if(count<assignNum) {
				if(stuByZiXunName.size()>0) {
					Random random=new Random();
					//根据对话记录总数产生随机数
					int index =random.nextInt((int)stuByZiXunName.size());
					Student student = stuByZiXunName.get(index);
					if(student!=null) {
						stulist.add(student);
						count++;
						//stuByZiXunName.remove(index);//已分配的就从待分配的任务数中拿掉
					}
				}else {
					break;
				}
			}
			askers.get(i).setAexit1Int(askers.get(i).getAexit1Int() + count);;//更新每个任务执行者的任务数
		 }
		 System.out.println("stuByZiXunName大小：" + stuByZiXunName.size() + ", 余数为：" + rest);
		 if(stuByZiXunName.size()>0) {
			//按权重从小到大分余数~
				Collections.sort(askers, new Comparator<Askers>() {
					@Override
					public int compare(Askers o1,Askers o2) {
						return o1.getWeight() - o2.getWeight();
						}
					});
					List<Student> restResultList = assignRest(askers, stuByZiXunName);
					stulist.addAll(restResultList);
					System.out.println("stulist==="+stulist);
		 }
	}

	private Integer getMaxInt(int totalWeight, int total) {
		// TODO Auto-generated method stub
		Integer j=0;
		List list=new ArrayList();
		for(int i=1; i<=totalWeight; i++) {
			if(totalWeight%i==0) {
				j++;
				list.add(totalWeight/i);
				System.out.println("list==="+list);
				
			}else if(j==0) {
				System.out.println(totalWeight + "没有可以被整除的数。");
			}
		}
		Integer max=(Integer) Collections.max(list);
		return max;
	}

	private List<Student> assignRest(List<Askers> askers, List<Student> stuByZiXunName) {
		// TODO Auto-generated method stub
		List<Student> resultList = new ArrayList<Student>();
		Map<String, Integer> map = new HashMap<String, Integer>();
		outter:
			for(int i=0; i<askers.size(); i++) {
				Askers dto = askers.get(i);//获取咨询师的下标
				
				int weight = dto.getWeight();//获取咨询师的权重
				Random random = new Random();
				
				
				for(int j=0; j<weight; j++) {
					int index =random.nextInt((int)stuByZiXunName.size());//获取未被分配的学生的长度
					Student chatDTO = stuByZiXunName.get(index);//获取客户的下标
					if(null != chatDTO){//如果客户不为空
						chatDTO.setAskers_Id(dto.getAskers_Id());//分配人的id
						chatDTO.setStu_ZiXunName(dto.getAskers_Name());;//分配人的名字
						System.out.println("将咨询师的id输入到客户表中："+chatDTO);
						dto.setAexit1Int0000(dto.getAexit1Int() + 1);;//更新任务执行者所包含的任务数
						resultList.add(chatDTO);
						stuByZiXunName.remove(index);
						if(stuByZiXunName.size() == 0) 
							break outter;
					}
				}
			}
			return resultList;
	}*/
}
