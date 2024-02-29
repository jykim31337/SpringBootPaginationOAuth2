package com.springboot.demo;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import lombok.Getter;
import lombok.Setter;

@SpringBootTest
class DemoApplicationTests {

	@Test
	void contextLoads() {
		User user = new User();
		
		user.setFirstName("==========FIRST NAME==========");
		
		System.out.println(user.getFirstName());
	}
	
	@Getter @Setter
	class User {
		private String firstName;
	}

}
