package com.weet.app.common.domain;

import lombok.Data;

@Data
public class Criteria {
	
	private int currPage = 1;	// 현재 페이지 번호
	private int amount = 5;		// 각 페이지에서 보여줄 게시물의 개수
	private int PagesPerPage = 5;
	
	private String sort;	// 정렬
	private String keyword;		// 검색키워드
} // end class
