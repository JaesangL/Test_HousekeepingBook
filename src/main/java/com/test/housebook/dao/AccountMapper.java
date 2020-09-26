package com.test.housebook.dao;

import java.util.ArrayList;

import com.test.housebook.vo.AccountVO;

public interface AccountMapper {
	public int accountInsert(AccountVO account);
	public ArrayList<AccountVO> accountAll();
	public AccountVO accountOne(String acc_id);
}
