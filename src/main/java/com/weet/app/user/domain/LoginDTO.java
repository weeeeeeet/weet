package com.weet.app.user.domain;

import lombok.Data;


@Data
public class LoginDTO {
	private String userid;
	private String userpw;

	private boolean rememberMe;
} // end class
