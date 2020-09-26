package com.test.housebook.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.housebook.service.AccountService;
import com.test.housebook.vo.AccountVO;

@Controller
@RequestMapping(value="/account")
public class AccountController {

	@Autowired
	private AccountService as;
	
	@RequestMapping(value="/accountJoin", method=RequestMethod.GET)
	public String accountJoin() {
		
		return "account/accountJoin";
	}
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String join(AccountVO account) {
		//System.out.println(account);
		
		return as.accountInsert(account);		
	}
	
	@RequestMapping(value="/accountLogin", method=RequestMethod.GET)
	public String accountLogin() {
		
		return "account/accountLogin";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(AccountVO account) {
	
		return as.accountLogin(account);
	}
	
	@RequestMapping(value="/accountLogout", method=RequestMethod.GET)
	public String accountLogout() {
		as.accountLogout();
		
		return "home";
	}
	
}
