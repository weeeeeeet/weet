package com.weet.app.mypage.domain;

import lombok.Data;


@Data
//+ 페이징 처리를 위한 3가지 기준 정보를 가지는 클래스
public class Criteria { 
	
	// + 현재 페이지 번호
	private int currPage = 1;
	
	// + 한 페이지에 보여지는 양
	private int amount = 5;
	
	// + 한 페이지에서 보여줄 pagination의 길이
	// + ( 페이지 번호 목록의 길이 )
	private int pagesPerPage = 5;

} // end class
