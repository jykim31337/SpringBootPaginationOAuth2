package com.springboot.demo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springboot.demo.dao.BbsDao;
import com.springboot.demo.dto.BbsDto;
import com.springboot.demo.dto.BbsPageDto;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class BbsServiceImpl implements BbsService {

	@Autowired
	private BbsDao bbsDao;
	
	@Override
	public BbsPageDto selectBbsListPaging(BbsPageDto param) throws Exception {
		
		log.info("selectBbsListPaging start");
		
		Integer itemTotCnt = 0;
		int itemPerPage = 10;
		
		int naviIdx = 1;
		int naviLstIdx = Integer.MAX_VALUE;
		
		int naviSize = 5;
		
		int naviStIdx = 1; 
		int naviEdIdx = 5;
		
		List<BbsDto> bbsList;
		
		if(param == null) {
			param = new BbsPageDto();
		}
		
		try {
			
			/* ex) totalCnt: 102, stIdx: 93, edIdx: 102 */
			itemTotCnt = bbsDao.selectBbsListCount(param);
			
			if (itemTotCnt == 0) {
				param.setNaviStIdx(1);
				param.setNaviEdIdx(1);
				param.setNaviIdx(1);
				param.setNaviLstIdx(1);
				return param;
			}
			
			itemPerPage = param.getItemPerPage();
			
			naviIdx = param.getNaviIdx();
			naviLstIdx = param.getNaviLstIdx();
			
			naviSize = param.getNaviSize();
			naviStIdx = param.getNaviStIdx();
			naviEdIdx = param.getNaviEdIdx();
			
			int itemStIdx = 0; 
			int itemEdIdx = 0;
					
			if(itemTotCnt <= itemPerPage) {
				naviIdx = 1;
				naviStIdx = 1;
				naviEdIdx = 1;
				naviLstIdx = 1;
				
				itemStIdx = 1;
				itemEdIdx = itemTotCnt;
			} else {
				if(itemTotCnt % itemPerPage == 0) {
					naviLstIdx = (int)(itemTotCnt / itemPerPage);
				} else {
					naviLstIdx = (int)(itemTotCnt / itemPerPage) + 1;
				}
				
				itemStIdx = itemTotCnt - (naviIdx * itemPerPage) + 1;
				itemEdIdx = itemTotCnt - ((naviIdx - 1) * itemPerPage);
				
				if(naviIdx < naviStIdx) {
					System.out.println("naviIdx too small");
					
					while(naviIdx < naviStIdx) {
						naviStIdx = naviStIdx - naviSize;
					}
					
					naviEdIdx = naviStIdx + naviSize - 1;
					
				} else if (naviIdx > naviEdIdx) {
					System.out.println("naviIdx too big");
					
					while(naviIdx > naviEdIdx) {
						naviEdIdx = naviEdIdx + naviSize;
					}
					
					naviStIdx = naviEdIdx - naviSize + 1;
					
				}
				
				if(naviEdIdx > naviLstIdx) {
					naviEdIdx = naviLstIdx;
				}
			}
			
			param.setNaviIdx(naviIdx);
			param.setNaviLstIdx(naviLstIdx);
			param.setNaviStIdx(naviStIdx);
			param.setNaviEdIdx(naviEdIdx);
			
			param.setItemTotCnt(itemTotCnt);
			param.setItemStIdx(itemStIdx);
			param.setItemEdIdx(itemEdIdx);
			
			bbsList = bbsDao.selectBbsListPaging(param);
			param.setList(bbsList);
			
		} catch(Exception exptn) {
			exptn.printStackTrace();
		}
		
		log.info("selectBbsListPaging end");
		
		return param;
	}

	@Override
	public BbsDto selectBbs(BbsPageDto param) throws Exception {
		return bbsDao.selectBbs(param);
	}

	@Override
	public List<Map<String, Object>> selectBbsList(Map<String, Object> param)  throws Exception {
		return bbsDao.selectBbsList(param);
	}
	
	@Override
	public int insertBbs(HashMap<String, Object> param) throws Exception {
		return bbsDao.insertBbs(param);
	}
	
	@Override
	public int updateBbs(HashMap<String, Object> param) throws Exception {
		return bbsDao.updateBbs(param);
	}
}
