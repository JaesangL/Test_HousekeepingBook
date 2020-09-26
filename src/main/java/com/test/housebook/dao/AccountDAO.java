package com.test.housebook.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.housebook.vo.AccountVO;

@Repository
public class AccountDAO {
	
	@Autowired
	private SqlSession session;

	public int accountInsert(AccountVO account) {
		AccountMapper mapper = session.getMapper(AccountMapper.class);
		int result = 0;
		
		try {
			result = mapper.accountInsert(account);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public ArrayList<AccountVO> accountAll(){
		AccountMapper mapper = session.getMapper(AccountMapper.class);
		ArrayList<AccountVO> list = null;
		
		try {
			list = mapper.accountAll();
		} catch(Exception e) {
			e.printStackTrace();
		}
	
		return list;
	}

	public AccountVO accountOne(String acc_id) {
		AccountMapper mapper = session.getMapper(AccountMapper.class);
		AccountVO account = null;
		
		try {
			account = mapper.accountOne(acc_id);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return account;
	}

	
}
