package com.springboot.demo.dto;

import java.util.List;

public class BbsPageDto {
	
	public enum SearchType {
		TITLE
		, CONTENT
		, ID
		, NAME
	}
	
	private int itemTotCnt;
	private int itemPerPage = 10;
	
	private int itemStIdx;
	private int itemEdIdx;
	
	private int naviIdx = 1;
	
	private int naviSize = 5;
	private int naviStIdx = 1;
	private int naviEdIdx = 5;
	private int naviLstIdx = Integer.MAX_VALUE;
	
	private SearchType searchType = SearchType.TITLE;
	private String searchText;
	
	private List<BbsDto> list;

	public int getItemTotCnt() {
		return itemTotCnt;
	}

	public void setItemTotCnt(int itemTotCnt) {
		this.itemTotCnt = itemTotCnt;
	}

	public int getItemPerPage() {
		return itemPerPage;
	}

	public void setItemPerPage(int itemPerPage) {
		this.itemPerPage = itemPerPage;
	}

	public int getItemStIdx() {
		return itemStIdx;
	}

	public void setItemStIdx(int itemStIdx) {
		this.itemStIdx = itemStIdx;
	}

	public int getItemEdIdx() {
		return itemEdIdx;
	}

	public void setItemEdIdx(int itemEdIdx) {
		this.itemEdIdx = itemEdIdx;
	}

	public int getNaviIdx() {
		return naviIdx;
	}

	public void setNaviIdx(int naviIdx) {
		this.naviIdx = naviIdx;
	}

	public int getNaviLstIdx() {
		return naviLstIdx;
	}

	public void setNaviLstIdx(int naviLstIdx) {
		this.naviLstIdx = naviLstIdx;
	}

	public int getNaviSize() {
		return naviSize;
	}

	public void setNaviSize(int naviSize) {
		this.naviSize = naviSize;
	}

	public int getNaviStIdx() {
		return naviStIdx;
	}

	public void setNaviStIdx(int naviStIdx) {
		this.naviStIdx = naviStIdx;
	}

	public int getNaviEdIdx() {
		return naviEdIdx;
	}

	public void setNaviEdIdx(int naviEdIdx) {
		this.naviEdIdx = naviEdIdx;
	}

	public SearchType getSearchType() {
		return searchType;
	}

	public void setSearchType(SearchType searchType) {
		this.searchType = searchType;
	}

	public String getSearchText() {
		return searchText;
	}

	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}

	public List<BbsDto> getList() {
		return list;
	}

	public void setList(List<BbsDto> list) {
		this.list = list;
	}
	
}
