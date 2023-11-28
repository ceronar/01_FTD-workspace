package com.kh.ftd.promotion.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;


@Controller
public class PromotionController {

	@ResponseBody
	@RequestMapping(value = "rlist.bo", produces = "application/json; charset=UTF-8")
	public String ajaxSelectReplyList() {
		
		ArrayList<Reply> list = boardService.selectReplyList(bno);
		
		Gson gson = new Gson();
		return gson.toJson(list);
		
		return new Gson().toJson(list);
	}
	
	
}
