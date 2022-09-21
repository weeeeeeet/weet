package com.weet.app.user.domain;

import lombok.Data;


@Data
public class LoginDTO {
	private String userId;
	private String userPwd;

	private boolean rememberMe;
} // end class
