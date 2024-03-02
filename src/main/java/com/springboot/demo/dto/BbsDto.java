package com.springboot.demo.dto;

import java.util.Date;

import lombok.AccessLevel;
import lombok.Data;
import lombok.Setter;

@Data
@Setter(AccessLevel.NONE)
public class BbsDto {
	private String idx;
	private String seq;
	private String bbsCd;
	@Setter
	private String title;
	@Setter
	private String content;
	private String uprSeq;
	private Integer rdCnt;
	private Integer dth;
	private String delYn;
	@Setter
	private String usrId;
	private Date creDt;
	private String creDtFormat;
	private String creDtFormatDt;
	private String creDtFormatTm;
	private Date modDt;
	private String modDtFormat;
	private String modDtFormatDt;
	private String modDtFormatTm;
	private Date lstDt;
	private String lstDtFormat;
	private String lstDtFormatDt;
	private String lstDtFormatTm;
}
