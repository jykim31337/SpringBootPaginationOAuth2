package com.springboot.demo.dto;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.lang.Nullable;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.user.OAuth2User;

public class OAuth2UserExt implements OAuth2User, UserDetails {

	private static final long serialVersionUID = 1L;
	
	private UserExt user;
	//private List<GrantedAuthority> authorities;
	private Collection<? extends GrantedAuthority> authorities;
	private Map<String, Object> oauthUserAttributes;
	
	/*
	private OAuth2UserExt(UserExt user, List<GrantedAuthority> authorities, Map<String, Object> oauthUserAttributes) {
		this.user = user;
		this.authorities = authorities;
		this.oauthUserAttributes = oauthUserAttributes;
	}
	*/
	
	private OAuth2UserExt(UserExt user, Collection<? extends GrantedAuthority> authorities, Map<String, Object> oauthUserAttributes) {
		this.user = user;
		this.authorities = authorities;
		this.oauthUserAttributes = oauthUserAttributes;
	}
	
	public static OAuth2UserExt createSimpleUser(UserExt user) {
		return new OAuth2UserExt(user, Arrays.asList(() -> "ROLE_USER"), new HashMap<>());
	}

	public static OAuth2UserExt createSimpleUser(UserExt user, Map<String, Object> oauthUserAttributes) {
		return new OAuth2UserExt(user, Arrays.asList(() -> "ROLE_USER"), oauthUserAttributes);
	}
	
	public static OAuth2UserExt create(UserExt user) {
		return new OAuth2UserExt(user, user.getAuthorities(), new HashMap<>());
	}

	public static OAuth2UserExt create(UserExt user, Map<String, Object> oauthUserAttributes) {
		return new OAuth2UserExt(user, user.getAuthorities(), oauthUserAttributes);
	}

	public static OAuth2UserExt create(UserExt user, String role, Map<String, Object> oauthUserAttributes) {
		return new OAuth2UserExt(user, Arrays.asList(() -> role), oauthUserAttributes);
	}
	
	public static OAuth2UserExt create(UserExt user, String [] roles, Map<String, Object> oauthUserAttributes) {
		
		List<GrantedAuthority> grantList = new ArrayList<GrantedAuthority>();
		
		for(int i = 0; i < roles.length; i++) {
			GrantedAuthority authority = new SimpleGrantedAuthority(roles[i]);
			grantList.add(authority);
		}
		
		return new OAuth2UserExt(user, grantList, oauthUserAttributes);
	}
	
	public static OAuth2UserExt create(UserExt user, List<GrantedAuthority> authorities, Map<String, Object> oauthUserAttributes) {
		
		return new OAuth2UserExt(user, authorities, oauthUserAttributes);
	}
	
	@Override
	public String getPassword() {
		return user.getPassword();
	}

	@Override
	public String getUsername() {
		return String.valueOf(user.getUsername());
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}

	@Override
	public Map<String, Object> getAttributes() {
		return Collections.unmodifiableMap(oauthUserAttributes);
	}

	@Override
	@Nullable
	@SuppressWarnings("unchecked")
	public <A> A getAttribute(String name) {
		return (A) oauthUserAttributes.get(name);
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		//return Collections.unmodifiableList(authorities);
		return authorities;
	}

	@Override
	public String getName() {
		return String.valueOf(user.getUsername());
	}

	public UserExt getUser() {
		return user;
	}

	public void setUser(UserExt user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "OAuth2UserExt [user=" + user + ", authorities=" + authorities + ", oauthUserAttributes="
				+ oauthUserAttributes + ", getPassword()=" + getPassword() + ", getUsername()=" + getUsername()
				+ ", isAccountNonExpired()=" + isAccountNonExpired() + ", isAccountNonLocked()=" + isAccountNonLocked()
				+ ", isCredentialsNonExpired()=" + isCredentialsNonExpired() + ", isEnabled()=" + isEnabled()
				+ ", getAttributes()=" + getAttributes() + ", getAuthorities()=" + getAuthorities() + ", getName()="
				+ getName() + ", getUser()=" + getUser() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}

}
