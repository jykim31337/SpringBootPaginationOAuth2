package com.springboot.demo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.springboot.demo.dto.OAuth2UserExt;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class AuthController {

	/*
	@GetMapping("/login")
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response, ModelAndView mav
			, @AuthenticationPrincipal OAuth2UserExt oAuth2User) {
		mav.setViewName("/loginPage");
		//mav.addObject("viewPath", "Root");
		return mav;
	}
	*/
	
	@GetMapping("/user/info")
	public ModelAndView info(HttpServletRequest request, HttpServletResponse response, ModelAndView mav
			, @AuthenticationPrincipal OAuth2UserExt oAuth2User) {
		
		mav.setViewName("/user/infoPage");
		mav.addObject("auth", oAuth2User);
		
		return mav;
	}
	
	@GetMapping("/admin/manage")
	public ModelAndView manage(HttpServletRequest request, HttpServletResponse response, ModelAndView mav
			, @AuthenticationPrincipal OAuth2UserExt oAuth2User) {
		
		mav.setViewName("/admin/managePage");
		mav.addObject("auth", oAuth2User);
		
		return mav;
	}
}
