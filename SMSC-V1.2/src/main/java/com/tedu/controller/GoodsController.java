package com.tedu.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tedu.service.GoodsService;

@Controller
@RequestMapping("/mao/")
public class GoodsController {
	@Autowired
	private GoodsService goodsService;
	
	@RequestMapping(value="dotestUI",method = RequestMethod.POST)
	@ResponseBody
	public String dotestUI(Integer gid,Integer count){
		return gid+":"+count;
	}
	
	@RequestMapping("dotest1UI")
	@ResponseBody
	public String dotest1UI(){
		return "ook11111";
	}
}
