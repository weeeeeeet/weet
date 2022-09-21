package com.weet.app.classes.domain;

import lombok.Data;

// 페이징 처리를 위한 두가지 기준 정보를 가지는 클래스
// Criteria: 기준
@Data
public class Criteria2 {

	// ======== 페이징 ==========
	// 현재 페이지
	private int pageNum;
	
	// 한 페이지 당 보여질 게시물 개수
	private int amount;
	
	//  ======= 단어 검색 =======
	private String keyword;
	
	// ======= 클래스 정렬 ======
	private String classSort;
	
	// ======= 클래스 개인 & 그룹 ======
	private String type;
	
	// ----------------------------------------------------------------------------
	
	// 기본 생성자 -> 기본 세팅: pageNum = 1, amount = 10
	public Criteria2() {
		this(1,21);
	}

	// 원하는 페이지 Num, 원하는 amount
	public Criteria2(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	} 
	

	@Override
	public String toString() {
		return "Criteria [pageNum=" + pageNum + ", amount=" + amount + ", keyword=" + keyword + ", classSort=" + classSort + ", type=" + type + "]";
	}
} // end class
