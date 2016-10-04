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
	public boolean insertConcert(ConcertBean dto) {
		int r = sqlSession.insert("concert.concert_add", dto);
		if (r > 0)
			return true;
		else
			return false;
	}


	@Override
	@Transactional // 메소드 수행 중에 예외가 발생하면 rollback 그렇지 않으면 commit
	public List<ConcertBean> getConcertList(Map<String, Object> map) {
		List<ConcertBean> list = sqlSession.selectList("concert.concert_list", map);
		if (list == null || list.size() == 0)
			return null;
		else
			return list;
	}

	// @Override
	// @Transactional
	// public List<ConcertBean> getConcertList() {
	// return sqlSession.selectList("concert.concert_list");
	// }

	

	@Override
	public int getConcertListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ConcertBean getConcertDetail(int detail_num) {
		// TODO Auto-generated method stub

		// // 조회수를 1증가시키는 sql 실행
		// int r = sqlSession.update("concert.updateReadcount", num);
		// // 업데이트에 실패하면 null 리턴
		// if (r < 1)
		// return null;
		// // 업데이트에 성공하면 하나의 데이터를 가져오는
		// // sql을 실행
		// else {
		List<ConcertBean> list = sqlSession.selectList("concert.concert_detail", detail_num);
		if (list == null || list.size() < 1)
			return null;
		else
			return list.get(0);
		// }

	}

}
