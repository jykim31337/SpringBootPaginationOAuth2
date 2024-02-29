package com.springboot.demo.dto;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

public class UserExt extends User{

	private static final long serialVersionUID = 1L;
	
	private String email;
	private String picture;

	public UserExt(String username, String password, String email, String picture, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
		this.email = email;
		this.picture = picture;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	@Override
	public String toString() {
		return "UserExt [email=" + email + ", picture=" + picture + ", getEmail()=" + getEmail() + ", getPicture()="
				+ getPicture() + ", getAuthorities()=" + getAuthorities() + ", getPassword()=" + getPassword()
				+ ", getUsername()=" + getUsername() + ", isEnabled()=" + isEnabled() + ", isAccountNonExpired()="
				+ isAccountNonExpired() + ", isAccountNonLocked()=" + isAccountNonLocked()
				+ ", isCredentialsNonExpired()=" + isCredentialsNonExpired() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + ", getClass()=" + getClass() + "]";
	}
}
