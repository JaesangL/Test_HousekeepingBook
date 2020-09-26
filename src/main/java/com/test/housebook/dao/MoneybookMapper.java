package com.test.housebook.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.test.housebook.vo.MoneybookVO;

public interface MoneybookMapper {
	public int moneybookInsert(MoneybookVO money);
	public ArrayList<MoneybookVO> moneybookAll(HashMap<String, Object> hashmap);
	public MoneybookVO moneybookOne(int moneybook_no);
	public int moneybookUpdate(MoneybookVO money);
	public int moneybookDelete(int moneybook_no);
	public int moneybookResult1(HashMap<String, Object> hashmap);
	public int moneybookMin(String acc_id);
	public int moneybookMax(String acc_id);
}
