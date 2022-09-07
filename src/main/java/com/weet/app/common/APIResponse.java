package com.weet.app.common;

import java.util.ArrayList;
import java.util.List;

import org.springframework.http.HttpStatus;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class APIResponse {
	
	
	@ApiModelProperty(example = "상태코드")
	private int status;
	
	@ApiModelProperty(example = "메시지")
	private String message;
	
	@ApiModelProperty(example = "응답데이터")
	private List<Object> data;

	
	public APIResponse() {
		this(HttpStatus.OK);
	} // constructor
	
	public APIResponse(HttpStatus httpStatus) {
		
		this.status = httpStatus.value();
		this.message = httpStatus.getReasonPhrase();
		this.data = new ArrayList<>();
	} // constructor-overloading
	
	
	public void add(Object value) {
		
		this.data.add(value);
	} // add
} // end class
