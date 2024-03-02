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
	
	@GetMapping("/loginGet")
	public ModelAndView loginGet(HttpServletRequest request, HttpServletResponse response, ModelAndView mav
			, @AuthenticationPrincipal OAuth2UserExt oAuth2User) {
		mav.setViewName("/loginPage");
		mav.addObject("viewPath", "Root");
		return mav;
	}
	
	@GetMapping("/user/infoGet")
	public ModelAndView infoGet(HttpServletRequest request, HttpServletResponse response, ModelAndView mav
			, @AuthenticationPrincipal OAuth2UserExt oAuth2User) {
		mav.setViewName("/user/infoPage");
		
		mav.addObject("userName", oAuth2User.getUser().getUsername());
		mav.addObject("email", oAuth2User.getUser().getEmail());
		mav.addObject("picture", oAuth2User.getUser().getPicture());
		return mav;
	}
	
	@GetMapping("/admin/manageGet")
	public ModelAndView manageGet(HttpServletRequest request, HttpServletResponse response, ModelAndView mav
			, @AuthenticationPrincipal OAuth2UserExt oAuth2User) {
		mav.setViewName("/admin/managePage");
		return mav;
	}
}
