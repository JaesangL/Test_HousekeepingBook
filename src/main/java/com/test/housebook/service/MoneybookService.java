package com.test.housebook.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.housebook.dao.MoneybookDAO;
import com.test.housebook.vo.MoneybookVO;

@Service
public class MoneybookService {
	@Autowired
	private MoneybookDAO dao;
	
	@Autowired
	private HttpSession session;
	
	public String moneybookInsert(MoneybookVO money) {
		String acc_id = (String)session.getAttribute("loginID");
		money.setAcc_id(acc_id);
		
		int result = dao.moneybookInsert(money);
		String page = "redirect:/moneybook/myMoneybook";
		
		if(result == 0) page = "redirect:/moneybook/moneybookWriteForm";
		
		return page;
	}		
	
	public ArrayList<MoneybookVO> moneybookAll(String acc_id, String moneybook_type, String moneybook_memo){
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		hashmap.put("acc_id", acc_id);
		hashmap.put("moneybook_type", moneybook_type);
		hashmap.put("moneybook_memo", moneybook_memo);
		
		return dao.moneybookAll(hashmap);
	}
	
	public MoneybookVO moneybookOne(int moneybook_no) {
		return dao.moneybookOne(moneybook_no);
	}
	
	public String moneybookUpdate(MoneybookVO money) {
		if(dao.moneybookUpdate(money) == 0)	System.out.println("업데이트 실패...");
		else System.out.println("업데이트 성공!");
		
		return "redirect:/moneybook/myMoneybook";
	}
	
	public String moneybookDelete(int moneybook_no) {
		if(dao.moneybookDelete(moneybook_no) == 0) System.out.println("삭제 실패...");
		else System.out.println("삭제 성공!");
		
		return "redirect:/moneybook/myMoneybook";
	}
	
	public int moneybookResult1(String moneybook_type, String acc_id) {
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		hashmap.put("moneybook_type", moneybook_type);
		hashmap.put("acc_id", acc_id);
		
		return dao.moneybookResult1(hashmap);
	}	
	
	public int moneybookMin(String acc_id) {
		return dao.moneybookMin(acc_id);
	}	

	public int moneybookMax(String acc_id) {
		return dao.moneybookMax(acc_id);
	}	

}
