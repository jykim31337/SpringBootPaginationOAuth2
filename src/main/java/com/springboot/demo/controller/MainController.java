package com.springboot.demo.controller;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.springboot.demo.dto.OAuth2UserExt;

@Controller
public class MainController {

	@GetMapping("/main/main")
	public String main(Model model
			, @AuthenticationPrincipal OAuth2UserExt oAuth2User) {
		model.addAttribute("auth", oAuth2User);
		return "/main/main";
	}
}
