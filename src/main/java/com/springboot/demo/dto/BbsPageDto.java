package com.springboot.demo.dto;

import java.util.List;

public class BbsPageDto {
	
	/*
	public enum SearchType {
		
		TITLE("TITLE")
		, CONTENT("CONTENT")
		, ID("ID")
		, NAME("NAME");

		private String searchType;
		
		SearchType(String searchType) {
			this.searchType = searchType;
		}

		public String getSearchType() {
			return searchType;
		}

		public void setSearchType(String searchType) {
			this.searchType = searchType;
		}
	}*/
	
	private String searchType;
	private String searchText;
	
	private String seq;
	private String bbsCd = "NONE";
	
	private int itemTotCnt;
	private int itemPerPage = 10;
	
	private int itemStIdx;
	private int itemEdIdx;
	
	private int naviIdx = 1;
	
	private int naviSize = 5;
	private int naviStIdx = 1;
	private int naviEdIdx = 5;
	private int naviLstIdx = Integer.MAX_VALUE;
	
	private List<BbsDto> list;

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getSearchText() {
		return searchText;
	}

	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}

	public String getSeq() {
		return seq;
	}

	public void setSeq(String seq) {
		this.seq = seq;
	}

	public String getBbsCd() {
		return bbsCd;
	}

	public void setBbsCd(String bbsCd) {
		this.bbsCd = bbsCd;
	}

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

	public List<BbsDto> getList() {
		return list;
	}

	public void setList(List<BbsDto> list) {
		this.list = list;
	}
	
}
