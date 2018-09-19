package com.tedu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tedu.common.vo.JsonResult;
import com.tedu.service.GoodsDescService;

@Controller
@RequestMapping("/goods/")
public class GoodsDescController {
	@Autowired
	GoodsDescService goodsDescService;
	
	@RequestMapping("doGoodsDescUI")
	public String doGoodsDescUI(){
		return "product";
	}
	
	@RequestMapping("doGetGoodsDescById")
	@ResponseBody
	public JsonResult doGetGoodsDescById(Integer gid){
		return new JsonResult(
				goodsDescService.getGoodsDescById(gid));
	}
}
