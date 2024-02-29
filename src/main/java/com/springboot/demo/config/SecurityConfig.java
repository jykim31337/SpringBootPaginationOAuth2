package com.springboot.demo.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;

import com.springboot.demo.service.OAuth2MemberService;

import lombok.RequiredArgsConstructor;

@Configuration
@RequiredArgsConstructor
@EnableWebSecurity
public class SecurityConfig {
	private final OAuth2MemberService oAuth2MemberService;

	@Bean
	SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception{
		
		http
		.httpBasic(basic ->basic.disable())
		.csrf(csrf -> csrf.disable())
		.cors(cors -> cors.disable())
		.authorizeRequests(
			requests -> requests
			.antMatchers("/user/**", "/admin/**", "/main/**").authenticated()
			
			.antMatchers("/admin/**").hasAnyRole("ADMIN") // ROLE_ADMIN
			//.antMatchers("/admin/**").hasAuthority("ROLE_ADMIN")
			
			//.antMatchers("/user/**").hasAnyRole("USER") // ROLE_USER
			.antMatchers("/user/**").hasAuthority("ROLE_USER")
			
			.anyRequest().permitAll()
		).oauth2Login(
			login -> login
			.loginPage("/loginGet")
			.defaultSuccessUrl("/user/infoGet")
			.userInfoEndpoint()
			.userService(oAuth2MemberService).and()
		);
		
		return http.build();
		
	}
}