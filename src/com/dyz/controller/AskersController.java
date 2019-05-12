package com.dyz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.dyz.entity.Fenye;
import com.dyz.service.AskersService;

@Controller
public class AskersController {
	@Autowired
	private AskersService askersService;
	
	public Fenye select(Fenye fenye) {
		
		return askersService.selectStudent(fenye);
	}
}
