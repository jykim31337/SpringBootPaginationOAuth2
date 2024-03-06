package com.springboot.demo.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import com.springboot.demo.dto.OAuth2UserExt;
import com.springboot.demo.dto.UserExt;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class OAuth2MemberService extends DefaultOAuth2UserService {
	
	@Value("${google.admin.email}")
	private String googleAdminEmail;
	
	@Override
	public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
		
		OAuth2User oAuth2User = super.loadUser(userRequest);
		
		log.debug("oAuth2User.getAttributes(): " + oAuth2User.getAttributes());
		log.debug("oAuth2User.getAuthorities(): " + oAuth2User.getAuthorities());
		log.debug("userRequest.getAccessToken(): " + userRequest.getAccessToken());
		log.debug("userRequest.getAdditionalParameters(): " + userRequest.getAdditionalParameters());
		log.debug("userRequest.getClientRegistration(): " + userRequest.getClientRegistration());
		
		return oAuth2UserLogin(userRequest, oAuth2User);
	}

	private OAuth2User oAuth2UserLogin(OAuth2UserRequest userRequest, OAuth2User oAuth2User) {
		
		String provider = userRequest.getClientRegistration().getRegistrationId(); 
		
		UserExt user = null;
		
		OAuth2UserExt result = null;
		
		List<GrantedAuthority> grantList = new ArrayList<GrantedAuthority>();
		grantList.addAll(oAuth2User.getAuthorities());
		
		if(provider.equals("google")) {
			
			String email = oAuth2User.getAttribute("email");

			if(email.contentEquals(googleAdminEmail) ||
					email.toUpperCase().contains("ADMIN")) {
				GrantedAuthority roleAdmin = new SimpleGrantedAuthority("ROLE_ADMIN");
				grantList.add(roleAdmin);
			}

			user = new UserExt(oAuth2User.getAttribute("name")
					, ""
					, email
					, oAuth2User.getAttribute("picture")
					, grantList
					);
			
			result = OAuth2UserExt.create(user, oAuth2User.getAttributes());
			
			
		} else {
			// if you want process another provider
		}
		
		return result;
	}
}
