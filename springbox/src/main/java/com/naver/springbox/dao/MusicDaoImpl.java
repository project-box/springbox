package com.naver.springbox.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.naver.springbox.dto.MusicBean;

@Repository
public class MusicDaoImpl implements MusicDao {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	@Transactional
	public List<MusicBean> getMusicList() {
		return sqlSession.selectList("music.musicList");
	}

}
