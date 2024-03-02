package com.springboot.demo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.springboot.demo.dto.BbsDto;
import com.springboot.demo.dto.BbsPageDto;

public interface BbsService {
	public BbsPageDto selectBbsListPaging(BbsPageDto bbsPageDto) throws Exception;
	public BbsDto selectBbs(BbsPageDto param)  throws Exception;
	public List<Map<String, Object>> selectBbsList(Map<String, Object> param) throws Exception;
	public int insertBbs(HashMap<String, Object> param) throws Exception;
	public int updateBbs(HashMap<String, Object> param) throws Exception;
}
