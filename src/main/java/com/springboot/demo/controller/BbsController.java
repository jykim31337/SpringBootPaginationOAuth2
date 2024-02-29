package com.springboot.demo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	public ModelAndView bbsListGet(
			HttpServletRequest request, HttpServletResponse response
			, @ModelAttribute BbsPageDto bbsPageDto
			, ModelAndView mav
			, @AuthenticationPrincipal OAuth2UserExt oAuth2User
			) {
		
		log.info("bbsListGet start");
	
		mav.setViewName("/bbs/bbsList");
		
		try {
			
			if(oAuth2User != null) {
				log.debug(oAuth2User.toString());
				log.debug(oAuth2User.getUser().toString());
			}
			
			BbsPageDto result = bbsService.selectBbsListPaging(bbsPageDto);
			
			ObjectMapper mapper = new ObjectMapper();
			String jsonString = mapper.writeValueAsString(result);
			System.out.println(jsonString);
			
			mav.addObject("dto", result);
		} catch(Exception exptn) {
			log.error("bbsListGet", exptn);
			exptn.printStackTrace();
		}
		
		log.info("bbsListGet end");
		
		return mav;
	}
	
	@GetMapping("/bbs/bbsDetail")
	public ModelAndView bbsDetailGet(HttpServletRequest request, HttpServletResponse response, ModelAndView mav
			, @AuthenticationPrincipal OAuth2UserExt oAuth2User) {
		
		log.info("bbsDetailGet start");
		
		mav.setViewName("/bbs/bbsDetail");
		
		try {
			
		} catch(Exception exptn) {
			log.error("bbsDetailGet", exptn);
			exptn.printStackTrace();
		}
		
		log.info("bbsDetailGet end");
		
		return mav;
	}
	
	@ResponseBody
	@PostMapping(value = "/bbs/bbsSubmit")
	public Map<String, Object> bbsSubmitPost(HttpServletRequest request, HttpServletResponse response, @RequestBody List<Map<String, Object>> formData
			, @AuthenticationPrincipal OAuth2UserExt oAuth2User) {
		
		log.info("bbsSubmitPost start");
		
		int qryResult = 0;

		Map<String, Object> result = new HashMap<String, Object>();
		
		try {
			
			HashMap<String, Object> param = cmUtil.cvtFormData(formData);
			
			Integer seq = cmUtil.getIntParam(param, "seq");
			
			if(seq == null || seq < 0) {
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
			log.error("bbsSubmitPost", exptn);
			exptn.printStackTrace();
		}
		
		log.info("bbsSubmitPost end");
		
		return result;
	}
}
