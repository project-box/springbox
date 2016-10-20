package com.naver.springbox.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.naver.springbox.dto.SboardDto;



@Repository
public class SboardDaoImpl implements SboardDao {
	

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	@Transactional// 메소드 수행 중에 예외가 발생하면 rollback 그렇지 않으면 commit
	public int getListCount() {
		List<Integer> list = sqlSession.selectList("gogaek.countSboardList");
		if (list == null || list.size() == 0)
			return 0;
		else
			return list.get(0);
	}

	@Override
	@Transactional// 메소드 수행 중에 예외가 발생하면 rollback 그렇지 않으면 commit
	public List<SboardDto> getSboardList(Map<String, Object> map) {
		List<SboardDto> list = sqlSession.selectList("gogaek.selectSboardList",map);
		if (list == null || list.size() == 0)
			return null;
		else
			return list;
	}
	
	@Override
	@Transactional// 메소드 수행 중에 예외가 발생하면 rollback 그렇지 않으면 commit
	public SboardDto getSboard(int num) {
		// 조회수를 1증가시키는 sql 실행
		int r = sqlSession.update("gogaek.updateReadcount", num);
		// 업데이트에 실패하면 null 리턴
		if (r < 1)
			return null;
		// 업데이트에 성공하면 하나의 데이터를 가져오는
		// sql을 실행
		else {
			List<SboardDto> list = sqlSession.selectList("gogaek.getSboard", num);
			if (list == null || list.size() < 1)
				return null;
			else
				return list.get(0);
		}
	}
	
	@Override
	@Transactional// 메소드 수행 중에 예외가 발생하면 rollback 그렇지 않으면 commit
	public boolean insertSboard(SboardDto dto) {
		int r = sqlSession.insert("gogaek.insertSboard", dto);
		if (r > 0)
			return true;
		else
			return false;
	}

	@Override
	@Transactional// 메소드 수행 중에 예외가 발생하면 rollback 그렇지 않으면 commit
	public boolean updateSboard(Map<String, Object> map) {
		int r = sqlSession.update("gogaek.updateSboard", map);
		if (r > 0)
			return true;
		else
			return false;
	}
	
	@Override
	@Transactional// 메소드 수행 중에 예외가 발생하면 rollback 그렇지 않으면 commit
	public int maxSboardNum() {
		List<Integer> list = sqlSession.selectList("gogaek.maxSboardNum");
		if (list == null || list.size() < 0)
			return 0;
		else
			return list.get(0);
	}

	@Override
	public boolean deleteSboard(int num) {
		int r = sqlSession.insert("gogaek.deleteSboard", num);
		if (r > 0)
			return true;
		else
			return false;
	}


}
