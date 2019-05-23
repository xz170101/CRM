package com.dyz.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dyz.entity.Askers;
import com.dyz.entity.Fenye;
import com.dyz.service.AskersService;
import com.dyz.util.Result;

@Controller
public class AskersController {
	@Autowired
	private AskersService askersService;
	
	
	@RequestMapping(value="/selectAllAskers",method=RequestMethod.POST)
	@ResponseBody
	public Fenye select(Fenye fenye,Integer page,Integer rows) {				
		fenye.setPage((page-1)*rows);
		fenye.setPageSize(rows);
		return askersService.selectAllAskers(fenye);
	}
	
	@RequestMapping(value="/selectqiandao",method=RequestMethod.POST)
	@ResponseBody
	public List<Askers> selectqiandao() {				
		
		return askersService.selectqiandao();
	}
	
	
	
	@RequestMapping(value = "/editweight", method = RequestMethod.POST)
	@ResponseBody
	public String editWEight(Askers askers){
		System.out.println(askers);
		Integer i = askersService.updateWeight(askers);
		return Result.toClient((i > 0) == true, i > 0 ? "修改权重成功" : "修改权重失败");	}
}
