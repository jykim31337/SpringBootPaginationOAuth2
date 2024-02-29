package com.springboot.demo.config;

import org.springframework.boot.context.event.ApplicationStartedEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class ApplicationStartupEnvironment implements ApplicationListener<ApplicationStartedEvent> {

	private final Environment env;

	public ApplicationStartupEnvironment(Environment env) {
		this.env = env;
	}

	@Override
	public void onApplicationEvent(ApplicationStartedEvent event) {
		String googleAdminEmail = env.getProperty("google.admin.email");
		log.debug("googleAdminEmail: " + googleAdminEmail);
	}
}