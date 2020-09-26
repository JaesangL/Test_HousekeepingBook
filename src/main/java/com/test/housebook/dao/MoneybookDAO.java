package com.test.housebook.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.housebook.vo.MoneybookVO;

@Repository
public class MoneybookDAO {
	@Autowired
	private SqlSession session;
	
	public int moneybookInsert(MoneybookVO money) {
		MoneybookMapper mapper = session.getMapper(MoneybookMapper.class);
		int result = 0;
		
		try {
			result = mapper.moneybookInsert(money);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public ArrayList<MoneybookVO> moneybookAll(HashMap<String, Object> hashmap){
		MoneybookMapper mapper = session.getMapper(MoneybookMapper.class);
		ArrayList<MoneybookVO> list = null;
		
		try {
			list = mapper.moneybookAll(hashmap);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	public MoneybookVO moneybookOne(int moneybook_no) {
		MoneybookMapper mapper = session.getMapper(MoneybookMapper.class);
		MoneybookVO moneybook = null;
		
		try {
			moneybook = mapper.moneybookOne(moneybook_no);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return moneybook;
	}
	
	public int moneybookUpdate(MoneybookVO money) {
		MoneybookMapper mapper = session.getMapper(MoneybookMapper.class);
		int result = 0;
		
		try {
			result = mapper.moneybookUpdate(money);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	
	public int moneybookDelete(int moneybook_no) {
		MoneybookMapper mapper = session.getMapper(MoneybookMapper.class);
		int result = 0;
		
		try {
			result = mapper.moneybookDelete(moneybook_no);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public int moneybookResult1(HashMap<String, Object> hashmap) {
		MoneybookMapper mapper = session.getMapper(MoneybookMapper.class);
		int result1 = 0;
	
		try {
			result1 = mapper.moneybookResult1(hashmap);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result1;
	}
	
	public int moneybookMin(String acc_id) {
		MoneybookMapper mapper = session.getMapper(MoneybookMapper.class);
		int result = 0;
	
		try {
			result = mapper.moneybookMin(acc_id);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int moneybookMax(String acc_id) {
		MoneybookMapper mapper = session.getMapper(MoneybookMapper.class);
		int result = 0;
	
		try {
			result = mapper.moneybookMax(acc_id);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
}