package com.weet.app.board.domain;

import lombok.Data;

@Data
public class BoardDTO {
	
	private Integer commId;
	private String userId;
	
	private String commPostTitle;
	private String commPostContents;
	private Character commTempsave;
} // end class
