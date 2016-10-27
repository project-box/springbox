package com.naver.springbox.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.naver.springbox.dto.ConcertBean;
import com.naver.springbox.dto.ConcertBoardBean;
import com.naver.springbox.dto.PaymentBean;
import com.naver.springbox.dto.SeatBean;

@Repository
public class ConcertDaoImpl implements ConcertDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	@Transactional // 메소드 수행 중에 예외가 발생하면 rollback 그렇지 않으면 commit
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
	@Transactional
	public int getConcertListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	@Transactional
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

	@Override
	@Transactional
	public boolean deleteConcert(int num) {
		// TODO Auto-generated method stub

		System.out.println("들어옴3");
		int r = sqlSession.delete("concert.concert_delete", num);
		if (r > 0)
			return true;
		else
			return false;
	}


	@Override
	@Transactional
	public boolean insertConcertboard(ConcertBoardBean dto) {
		// TODO Auto-generated method stub

				// 데이터 추가
				int r = sqlSession.insert("concert.concertboard_add", dto);
				if (r > 0)
					return true;
				else
					return false;
		
	}


	@Override
	@Transactional
	public List<ConcertBoardBean> getConcertBoardList(int num) {
		// TODO Auto-generated method stub
		
		List<ConcertBoardBean> list = sqlSession.selectList(
				"concert.concertboard_list", num);		
		
		return list;
	}


	@Override
	@Transactional
	public int getConcertBoardListCount(int num) {
		// TODO Auto-generated method stub
				
		int count = 0;
		count = ((Integer) sqlSession.selectOne("concert.concertboard_count",num)).intValue();	
		
		return count;

	}

	@Override
	@Transactional// 메소드 수행 중에 예외가 발생하면 rollback 그렇지 않으면 commit
	public boolean getConcertBoardDelete(int num) {
		int r = sqlSession.insert("concert.concertboard_delete", num);
		
		if (r > 0)
			return true;
		else
			return false;
	}

	@Override
	@Transactional
	public void book_add(PaymentBean pb) {
		
		sqlSession.insert("concert.book_add", pb);
		
	}
	
	
	@Override
	@Transactional
	public List<PaymentBean> book_list(String user_id) {
		// TODO Auto-generated method stub
		
		List<PaymentBean> list = sqlSession.selectList("concert.book_list", user_id);					
		
		return list;
	}
	
	public PaymentBean book_detail(int payment_num){
		
		List<PaymentBean> list = sqlSession.selectList("concert.book_detail", payment_num);
		
		if (list == null || list.size() < 1)
			return null;
		else
			return list.get(0);
	}


	@Override
	public void seat_add(SeatBean sb) {
		// TODO Auto-generated method stub
		
		sqlSession.insert("concert.seat_add", sb);
		
	}


	@Override
	@Transactional
	public List<SeatBean> seat_list(int concert_num) {
		// TODO Auto-generated method stub
		
      List<SeatBean> list = sqlSession.selectList("concert.seat_list", concert_num);					
		
		return list;
	}
	
}

