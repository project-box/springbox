package com.naver.springbox.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.naver.springbox.dto.ConcertBean;
import com.naver.springbox.dto.MusicBean;

@Repository
public class MusicDaoImpl implements MusicDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Transactional
	@Override
	public boolean insertMusic(MusicBean dto){
		System.out.println("DaoImpl추가");
		
		int r = sqlSession.insert("music.music_add", dto);
		
		if (r>0)
			return true;
		else
			return false;
	}
	
	@Transactional
	@Override
	public int getMusicListCount() {
			int count = 0;
			count = ((Integer) sqlSession.selectOne("music.music_count")).intValue();	
			 
			 System.out.println("DaoImpl카운트");
			 System.out.println("count="+count);
			 
			return count;
	}
	
	@Transactional
	@Override
	public List<MusicBean> getMusicList(Map<String, Object> map) {

		List<MusicBean>  list = sqlSession.selectList("music.music_list",map);
		
		System.out.println("DaoImpl리스트");
		System.out.println("list="+list);
		
		if (list == null || list.size() == 0)
			return null;
		else
			return list;
	}
	
	@Transactional
	@Override
	public MusicBean getMusicDetail(int num) {
	List<MusicBean>list = sqlSession.selectList("music.music_detail", num);
	
		System.out.println("DaoImpl디테일");
		System.out.println("list="+list);
	
	if (list == null || list.size() <1	)
		return null;
	else
		return list.get(0);
	}
	
	@Override
	public boolean deleteMusic(int num) {
	 System.out.println("3333");
	 
	 int r = sqlSession.delete("music.music_delete", num);
	 if (r >0 )
		return true;
	 else
		 return false;
	 
	}

}
