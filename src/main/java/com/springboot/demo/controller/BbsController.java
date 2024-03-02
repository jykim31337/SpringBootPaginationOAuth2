package com.springboot.demo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.springboot.demo.dto.BbsDto;
import com.springboot.demo.dto.BbsPageDto;
import com.springboot.demo.dto.OAuth2UserExt;
import com.springboot.demo.service.BbsService;
import com.springboot.demo.util.cmUtil;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class BbsController {
	
	ObjectMapper mapper = new ObjectMapper();
	
	@Autowired
	private BbsService bbsService;
	
	@GetMapping("/bbs/bbsList")
	public ModelAndView bbsList(
			HttpServletRequest request, HttpServletResponse response
			, @ModelAttribute BbsPageDto bbsPageDto
			, ModelAndView mav
			, @AuthenticationPrincipal OAuth2UserExt oAuth2User
			) throws Exception {
		
		log.info("bbsList start");
		
		mav.setViewName("/bbs/bbsList");
		mav.addObject("auth", oAuth2User);
		
		try {
			
			BbsPageDto result = bbsService.selectBbsListPaging(bbsPageDto);
			
			mav.addObject("dto", result);
		} catch(Exception exptn) {
			log.error("bbsList", exptn);
			throw exptn;
		}
		
		log.info("bbsList end");
		
		return mav;
	}
	
	@GetMapping("/bbs/bbsWrite")
	public ModelAndView bbsWrite(HttpServletRequest request, HttpServletResponse response
			, ModelAndView mav
			, @AuthenticationPrincipal OAuth2UserExt oAuth2User) {
		
		log.info("bbsWrite start");
		
		mav.setViewName("/bbs/bbsDetail");
		mav.addObject("auth", oAuth2User);
		
		try {

			BbsDto bbsDto = new BbsDto();
			
			if(oAuth2User != null) {
				bbsDto.setUsrId(oAuth2User.getUser().getEmail());
			} else {
				bbsDto.setTitle(UUID.randomUUID().toString());
				bbsDto.setContent(UUID.randomUUID().toString());
			}
			
			mav.addObject("dto", bbsDto);
			
		} catch(Exception exptn) {
			log.error("bbsWrite", exptn);
			throw exptn;
		}
		
		log.info("bbsWrite end");
		
		return mav;
	}
	
	@GetMapping("/bbs/bbsDetail")
	public ModelAndView bbsDetail(HttpServletRequest request, HttpServletResponse response
			, ModelAndView mav
			, @AuthenticationPrincipal OAuth2UserExt oAuth2User) throws Exception {
		
		log.info("bbsDetail start");
		
		mav.setViewName("/bbs/bbsDetail");
		mav.addObject("auth", oAuth2User);
		
		try {
			
			String seq = request.getParameter("seq");
			String bbsCd = request.getParameter("bbsCd");
			
			if(seq == null) {
				String errMsg = "seq is null";
				log.error(errMsg);
				mav.addObject("errMsg",  errMsg);
				mav.setViewName("/error");
				return mav;
			}
			
			BbsPageDto param = new BbsPageDto();
			param.setSeq(seq);
			param.setBbsCd(bbsCd);
			
			BbsDto bbsDto = bbsService.selectBbs(param);
			mav.addObject("dto", bbsDto);
			
		} catch(Exception exptn) {
			log.error("bbsDetail", exptn);
			throw exptn;
		}
		
		log.info("bbsDetail end");
		
		return mav;
	}
	
	@ResponseBody
	@PostMapping(value = "/bbs/bbsSubmit")
	public Map<String, Object> bbsSubmit(HttpServletRequest request, HttpServletResponse response
			, @RequestBody List<Map<String, Object>> formData
			, @AuthenticationPrincipal OAuth2UserExt oAuth2User) throws Exception {
		
		log.info("bbsSubmit start");
		
		int qryResult = 0;

		Map<String, Object> result = new HashMap<String, Object>();
		
		try {
			
			HashMap<String, Object> param = cmUtil.cvtFormData(formData);
			
			if(oAuth2User != null) {
				param.put("usrId", oAuth2User.getUser().getEmail());
			}
			
			String seq = cmUtil.getParam(param, "seq");
			
			if(StringUtils.isBlank(seq)) {
				qryResult = bbsService.insertBbs(param);
			} else {
				qryResult = bbsService.updateBbs(param);
			}
			
			result.put("data", qryResult);
			
			if(qryResult == 1) {
				result.put("result", "ok");
			} else {
				result.put("result", "fail");
				result.put("message", "result is not 1");
			}
			
		} catch(Exception exptn) {
			log.error("bbsSubmit", exptn);
			throw exptn;
		}
		
		log.info("bbsSubmit end");
		
		return result;
	}
}
