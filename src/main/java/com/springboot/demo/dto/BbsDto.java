package com.springboot.demo.dto;

import java.util.Date;

import lombok.AccessLevel;
import lombok.Data;
import lombok.Setter;

@Data
@Setter(AccessLevel.NONE)
public class BbsDto {
	private Integer idx;
	private Integer seq;
	private String bbsCd;
	@Setter
	private String title;
	@Setter
	private String content;
	private Integer uprSeq;
	private Integer rdCnt;
	private Integer dth;
	private String delYn;
	private String usrId;
	private Date creDt;
	private String creDtFormatDt;
	private String creDtFormatTm;
	private Date modDt;
	private String modDtFormatDt;
	private String modDtFormatTm;
	private Date lstDt;
	private String lstDtFormatDt;
	private String lstDtFormatTm;
}
