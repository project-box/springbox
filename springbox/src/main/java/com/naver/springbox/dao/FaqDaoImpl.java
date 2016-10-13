package com.naver.springbox.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


import com.naver.springbox.dto.FaqBean;


@Repository
public class FaqDaoImpl implements FaqDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	@Transactional
	public List<FaqBean> faqList() {
		
			List<FaqBean> list = sqlSession.selectList("gogaek.selectFaqList");
			if (list == null || list.size() < 1)
				return null;
			else
				return list;
		}
		
	@Override
	@Transactional// 메소드 수행 중에 예외가 발생하면 rollback 그렇지 않으면 commit
	public boolean readCountUpdate(int num) {
		int r = sqlSession.update("gogaek.updateFaq", num);
		if (r > 0)
			return true;
		else
			return false;
	}

	@Override
	@Transactional	// 메소드 수행 중에 예외가 발생하면 rollback 그렇지 않으면 commit
	public FaqBean getFaq(int num) {
		List<FaqBean> list = sqlSession.selectList("gogaek.getFaq", num);
		if (list == null || list.size() < 1)
			return null;
		else
			return list.get(0);
	}	
	
	
	@Override
	@Transactional	// 메소드 수행 중에 예외가 발생하면 rollback 그렇지 않으면 commit
	public boolean faqWrite(FaqBean dto) {
		int r = sqlSession.insert("gogaek.insertFaq", dto);
		if (r > 0)
			return true;
		return false;
	}

	@Override
	@Transactional	// 메소드 수행 중에 예외가 발생하면 rollback 그렇지 않으면 commit
	public int getMaxFaqNum() {
		List<Integer> list = sqlSession.selectList("gogaek.maxFaqNum");
		if (list == null || list.size() < 1)
			return 0;
		else
			return list.get(0);
	}

	
	

	}
	
	

	
	
	

