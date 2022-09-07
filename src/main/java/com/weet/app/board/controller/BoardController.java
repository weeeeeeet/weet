package com.weet.app.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.weet.app.board.service.BoardService;
import com.weet.app.common.APIResponse;
import com.weet.app.common.domain.Criteria;
import com.weet.app.common.domain.PageDTO;
import com.weet.app.exception.ControllerException;
import com.weet.app.exception.ServiceException;

import io.swagger.annotations.ApiOperation;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@RestController
@RequestMapping("/board")
public class BoardController {
	
	@Setter(onMethod_= @Autowired)
	private BoardService service;
	
	// 전체 게시글 목록 조회
	@GetMapping("/list")
	@ApiOperation(value = "전체글 목록 조회", notes = "페이징, 키워드 검색, 정렬을 지원합니다.")
	public APIResponse boardList(String keyword, Criteria cri) throws ControllerException {
		
		APIResponse res = new APIResponse();
		
		try { 
			PageDTO dto = new PageDTO(cri, this.service.getListCount(keyword));
			res.add("paging", dto);
			res.add("result", this.service.getAllList(keyword, cri)); 
			
		} catch (ServiceException e) { throw new ControllerException(e); } // try-catch
		
		return res;
	} // boardList
	
	// 추천 TOP10 게시글 조회
	@GetMapping("/list/top")
	@ApiOperation(value = "인기글 조회", notes = "최근 7일간 인기글 10개를 조회합니다. 가장 최근 댓글 1개를 같이 반환")
	public APIResponse boardBestList() throws ControllerException{
		
		APIResponse res = new APIResponse();
		try { res.add("result", this.service.getListTop10()); } 
		catch (ServiceException e) { throw new ControllerException(e); } // try-catch
		
		return res;
	} // boardBestList
	
	// 최근 게시글 5개 목록 조회
	@GetMapping("/list/recent")
	public String boardRecentList() {
		return "test!";
	}
	
	// 게시글 상세 조회
	@GetMapping("/{bno}")
	@ApiOperation(value = "게시글 상세 조회", notes = "게시글과 모든 댓글목록을 반환합니다.")
	public APIResponse boardDetail(@PathVariable("bno") int bno) throws ControllerException {
		
		APIResponse res = new APIResponse();
		
		try { res.add("result", this.service.getOneBoard(bno)); } 
		catch (ServiceException e) { throw new ControllerException(e); } // try-catch
		
		return res;
	} // boardDetail
	
	// 게시글 작성
	@PostMapping("/{bno}")
	public String boardWrite() {
		return "test!";
	}
	
	// 게시글 수정
	@PutMapping("/{bno}")
	public String boardModify() {
		return "test!";
	}
	
	// 게시글 삭제
	@DeleteMapping("/{bno}")
	public String boardDelete() {
		return "test!";
	}
	
	// 게시글 임시저장
	@PostMapping("/tmp/{bno}")
	public String boardTempSave() {
		return "test!";
	}
	
	// 게시글 추천
	@PostMapping("/vote/{bno}")
	public String boardVote() {
		return "test!";
	}
	
	// 게시글 추천취소
	@DeleteMapping("/vote/{bno}")
	public String boardVoteCancel() {
		return "test!";
	}
	
	// 댓글 작성
	@PostMapping("/reply/{rno}")
	public String replyWrite() {
		return "test!";
	}
	
	// 댓글 수정
	@PutMapping("/reply/{rno}")
	public String replyModify() {
		return "test!";
	}
	
	// 댓글 삭제
	@DeleteMapping("/reply/{rno}")
	public String replyDelete() {
		return "test!";
	}
	
	// 댓글 채택
	@PostMapping("/reply/select/{rno}")
	public String replySelect() {
		return "test!";
	}
	
} // end class
