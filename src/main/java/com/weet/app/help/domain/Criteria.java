package com.weet.app.help.domain;

import lombok.Data;

// 페이징 처리를 위한 두가지 기준 정보를 가지는 클래스
// Criteria: 기준
@Data
public class Criteria {

	// ======== 페이징 ==========
	// 현재 페이지
	private int pageNum;
	
	// 한 페이지 당 보여질 게시물 개수
	private int amount;
	
	// ======= 단어 검색 =======
	private String keyword;
	
	// ======= 자주 묻는 질문 유형 ======
	private String type;
	
	// ----------------------------------------------------------------------------
	
	// 기본 생성자
	public Criteria() {
		this(1,15);
	}

	// 원하는 페이지 Num, 원하는 amount
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	} 

	@Override
	public String toString() {
		return "Criteria [pageNum=" + pageNum + ", amount=" + amount + ", keyword=" + keyword + ", type=" + type + "]";
	}
} // end class
