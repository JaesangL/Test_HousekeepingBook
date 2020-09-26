package com.test.housebook.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.housebook.service.MoneybookService;
import com.test.housebook.vo.MoneybookVO;

@Controller
@RequestMapping(value="/moneybook")
public class MoneybookController {

	@Autowired
	private MoneybookService ms;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping(value="/myMoneybook", method=RequestMethod.GET)
	public String myMoneybook(
			Model model,
			@RequestParam(value="moneybook_type", defaultValue="")String moneybook_type,
			@RequestParam(value="moneybook_memo", defaultValue="")String moneybook_memo) {
		
		String acc_id = (String)session.getAttribute("loginID");
		
		ArrayList<MoneybookVO> list = ms.moneybookAll(acc_id, moneybook_type, moneybook_memo);
		
		model.addAttribute("list", list);
		
		return "moneybook/myMoneybook";
	}
	
	@RequestMapping(value="/moneybookWriteForm", method=RequestMethod.GET)
	public String moneybookWriteForm() {
		
		return "moneybook/moneybookWriteForm";
	}
	
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String write(MoneybookVO money) {
		
		return ms.moneybookInsert(money);
	}
	
	@RequestMapping(value="/moneybookUpdateForm", method=RequestMethod.GET)
	public String moneybookUpdateForm(int moneybook_no, Model model) {
		model.addAttribute("moneybook", ms.moneybookOne(moneybook_no));
		
		return "moneybook/moneybookUpdateForm";
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String update(MoneybookVO money) {
		
		return ms.moneybookUpdate(money);
	}
	
	@RequestMapping(value="/moneybookDelete", method=RequestMethod.GET)
	public String moneybookDelete(int moneybook_no) {
		
		return ms.moneybookDelete(moneybook_no);
	}

	@ResponseBody
	@RequestMapping(value="/allIncome", method=RequestMethod.POST)
	public String allIncome(String moneybook_type) {
		String acc_id = (String)session.getAttribute("loginID");
		String data = ms.moneybookResult1(moneybook_type, acc_id) + "";
		
		return data;
	}
	
	@ResponseBody
	@RequestMapping(value="/allPay", method=RequestMethod.POST)
	public String allPay(String moneybook_type) {
		String acc_id = (String)session.getAttribute("loginID");
		String data = ms.moneybookResult1(moneybook_type, acc_id) + "";
		
		return data;
	}
	
	@ResponseBody
	@RequestMapping(value="/minMoney", method=RequestMethod.POST)
	public String minMoney() {
		String acc_id = (String)session.getAttribute("loginID");
		String data = ms.moneybookMin(acc_id) + "";
		
		return data;
	}
	
	@ResponseBody
	@RequestMapping(value="/maxMoney", method=RequestMethod.POST)
	public String maxMoney() {
		String acc_id = (String)session.getAttribute("loginID");
		String data = ms.moneybookMax(acc_id) + "";
		
		return data;
	}
}
