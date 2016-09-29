package com.naver.springbox.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.naver.springbox.dto.ConcertBean;

@Repository
public class ConcertDaoImpl implements ConcertDao {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	@Transactional// 메소드 수행 중에 예외가 발생하면 rollback 그렇지 않으면 commit
	public List<ConcertBean> getConcertList(Map<String, Object> map) {
		List<ConcertBean> list = sqlSession.selectList("board.selectBoardList",
				map);
		if (list == null || list.size() == 0)
			return null;
		else
			return list;
	}

	@Override
	public int getConcertListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

}
