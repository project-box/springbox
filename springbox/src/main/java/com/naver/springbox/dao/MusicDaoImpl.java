package com.naver.springbox.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.naver.springbox.dto.MusicBean;

@Repository
public class MusicDaoImpl implements MusicDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	/*-------------------음악 추가------------------*/
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
	
	/*-------------------음악 개수------------------*/
	@Transactional
	@Override
	public int getMusicListCount() {
			int count = 0;
			count = ((Integer) sqlSession.selectOne("music.music_count")).intValue();	
			 
			 System.out.println("DaoImpl카운트");
			 System.out.println("count="+count);
			 
			return count;
	}
	
	/*-------------------최신곡 목록------------------*/
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
	
	/*------------------- 디테일 ------------------*/
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
	
	/*-------------------곡내용 불러오기 수정폼------------------*/
	@Override
	public MusicBean musicmodify(int num) {
		
		System.out.println("DAO musicmodify 들어옴");
		System.out.println("num="+num);
		
		MusicBean mb = sqlSession.selectOne("music.music_modify", num);
		
		System.out.println("mb 제목="+ mb.getMusic_title());
		
		return mb;
		
	}
	/*-------------------곡내용 수정------------------*/
	public boolean music_update(MusicBean dto) {
		
		System.out.println("music_update dao");
		System.out.println("dto 제목="+ dto.getMusic_title());
		System.out.println("dto 장르="+ dto.getMusic_genre());
		System.out.println("dto 아티스트="+ dto.getMusic_artist());
		System.out.println("dto 앨범="+ dto.getMusic_album());
		System.out.println("dto 발매일="+ dto.getMusic_publishdate());
		System.out.println("dto 사진="+ dto.getAlbumcoverfilepath());
		System.out.println("dto 가사="+ dto.getMusic_lyrics());
		System.out.println("dto num ="+ dto.getMusic_num());


		//		boolean ok;
		int r = sqlSession.update("music.music_update", dto);
		System.out.println("music_update 맵퍼실행후");
		if(r > 0) 
			return true;
		else
			return false;
		
		/*return ok;*/
		
	}
	
	
	/*------------------- 음악 삭제 ------------------*/
	@Override
	public boolean deleteMusic(int num) {
	 System.out.println("음악삭제DaoImpl");
	 
	 int r = sqlSession.delete("music.music_delete", num);
	 
	 if (r >0 )
		return true;
	 else
		 return false;
	}
	
	/*------------------- 팝업창 ------------------*/
	@Transactional
	@Override
	public MusicBean getMusicPop(int num) {
	
		List<MusicBean>list = sqlSession.selectList("music.music_detail", num);
	
		System.out.println("DaoImpl팝업창");
		System.out.println("list="+list);
	
	if (list == null || list.size() <1	)
		return null;
	else
		return list.get(0);
	}

	/*-------------------추천곡 목록------------------*/
	
	public List<MusicBean> getPreferenceMusicList(Map<String, Object> map) {

		List<MusicBean>  list = sqlSession.selectList("preference.preference_music_list",map);
		
		System.out.println("DaoImpl추천곡리스트");
		System.out.println("list="+list);
		
		if (list == null || list.size() == 0)
			return null;
		else
			return list;
	}
}
