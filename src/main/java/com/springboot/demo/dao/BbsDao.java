package com.springboot.demo.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springboot.demo.dto.BbsDto;
import com.springboot.demo.dto.BbsPageDto;

@Repository
public class BbsDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public Integer selectBbsListCount(BbsPageDto param) throws Exception {
		return sqlSession.selectOne("bbsMapper.selectBbsListCount", param);
	}
	
	public List<BbsDto> selectBbsListPaging(BbsPageDto param) throws Exception {
		return sqlSession.selectList("bbsMapper.selectBbsListPaging", param);
	}
	
	public BbsDto selectBbs(BbsPageDto param) throws Exception {
		return sqlSession.selectOne("bbsMapper.selectBbs", param);
	}
	
	public List<Map<String, Object>> selectBbsList(Map<String, Object> param) throws Exception {
		return sqlSession.selectList("bbsMapper.selectBbsList", param);
	}
	
	public int insertBbs(HashMap<String, Object> param) throws Exception {
		return sqlSession.insert("bbsMapper.insertBbs", param);
	}
	
	public int updateBbs(HashMap<String, Object> param) throws Exception {
		return sqlSession.update("bbsMapper.updateBbs", param);
	}
	
}
