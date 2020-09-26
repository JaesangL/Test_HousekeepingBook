package com.test.housebook.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.housebook.dao.AccountDAO;
import com.test.housebook.vo.AccountVO;

@Service
public class AccountService {

	@Autowired
	private AccountDAO dao;
	
	@Autowired
	private HttpSession session;
	
	public String accountInsert(AccountVO account) {
		int result = dao.accountInsert(account);
		
		if(result == 0) return "redirect:/account/accountJoin";
				
		return "redirect:/account/accountLogin";
	}
	
	public String accountLogin(AccountVO account) {
		AccountVO loginAccount = dao.accountOne(account.getAcc_id());
		String page = "";
		
		if( (loginAccount != null) && (loginAccount.getAcc_pw().equals(account.getAcc_pw())) ) {
			session.setAttribute("loginID", account.getAcc_id());
			page = "redirect:/";
		} else {
			page = "redirect:/account/accountLogin";
		}

		return page;
	}
	
	public void accountLogout() {
		session.removeAttribute("loginID");
	}
	
}
