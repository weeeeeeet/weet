package com.weet.app.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.weet.app.board.domain.BoardDTO;
import com.weet.app.board.domain.ReplyDTO;
import com.weet.app.board.service.BoardService;
import com.weet.app.common.APIResponse;
import com.weet.app.common.domain.Criteria;
import com.weet.app.common.domain.PageDTO;
import com.weet.app.exception.ControllerException;
import com.weet.app.exception.ServiceException;

import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import springfox.documentation.annotations.ApiIgnore;
import springfox.documentation.spring.web.scanners.ApiDescriptionReader;

@Log4j2
@NoArgsConstructor

@RestController
@RequestMapping("/board/api")
public class BoardController {
	
	@Setter(onMethod_= @Autowired)
	private BoardService service;
	
	// 전체 게시글 목록 조회
	@GetMapping("/list")
	@ApiOperation(value = "전체글 목록 조회", notes = "페이징, 키워드 검색, 정렬을 지원합니다. 게시글과 해당 게시글의 최근댓글 1개를 같이 반환합니다.")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "currPage", value = "현재페이지", paramType = "query", required = true),
		@ApiImplicitParam(name = "keyword", value = "검색키워드", paramType = "query"),
		@ApiImplicitParam(name = "sort", value = "정렬방식: recent(기본값), like, reply, view", paramType = "query"),
		@ApiImplicitParam(name = "amount", value = "조회할 글의 개수(기본값: 5)", paramType = "query"),
		@ApiImplicitParam(name = "pagesPerPage", value = "페이지 단위(기본값: 5)", paramType = "query")
	})
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
	public APIResponse boardBestList() throws ControllerException {
		
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
	
	// 답글 목록 조회
	@GetMapping("/list/re/reply/{commId}/{replyGroup}")
	@ApiOperation(value = "답글 목록 조회", notes = "특정 게시글의 특정 댓글에 대한 답글목록을 반환합니다.")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "commId", value = "게시글 번호", paramType = "path", required = true),
		@ApiImplicitParam(name = "replyGroup", value = "댓글 번호(replyId)", paramType = "path", required = true)
	})
	public APIResponse reReplyList(
		@PathVariable("commId") int commId, 
		@PathVariable("replyGroup") int replyGroup) throws ControllerException {
		
		APIResponse res = new APIResponse();
		
		try { res.add("result", this.service.getReReplyList(commId, replyGroup)); } 
		catch (ServiceException e) { throw new ControllerException(e); } // try-catch
		
		return res;
	} // reReplyList
	
	// 게시글 상세 조회
	@GetMapping("/{commId}")
	@ApiOperation(value = "게시글 상세 조회", notes = "게시글과 모든 댓글목록을 반환합니다.(대댓글 제외)")
	@ApiImplicitParam(name = "commId", value = "게시글 번호", paramType = "path", required = true)
	public APIResponse boardDetail(@PathVariable("commId") int commId) throws ControllerException {
		
		APIResponse res = new APIResponse();
		
		try { res.add("result", this.service.getOneBoard(commId)); } 
		catch (ServiceException e) { throw new ControllerException(e); } // try-catch
		
		return res;
	} // boardDetail
	
	// 게시글 작성
	@PostMapping("/new")
	@ApiOperation(value = "게시글 작성", notes = "게시글을 작성합니다. 성공 여부와 작성글 번호(PK)를 반환합니다.")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "userId", value = "작성자 아이디", paramType = "query", required = true),
		@ApiImplicitParam(name = "commPostTitle", value = "게시글 제목", paramType = "query", required = true),
		@ApiImplicitParam(name = "commPostContents", value = "게시글 내용", paramType = "query", required = true),
		@ApiImplicitParam(name = "commTempsave", value = "실제등록: 0, 임시저장: 1", paramType = "query", required = true)
	})
	public APIResponse boardWrite(@ApiIgnore BoardDTO dto) throws ControllerException {
		log.trace("boardWrite({}) invoked.", dto);
		
		APIResponse res = new APIResponse();
		
		try { 
			res.add("result", this.service.createBoard(dto) ? "SUCCESS" : "FAILED"); 
			res.add("commId", dto.getCommId());
		} catch (ServiceException e) { throw new ControllerException(e); } // try-catch
		
		return res;
	} // boardWrite
	
	// 게시글 수정
	@PutMapping("/{commId}")
	@ApiOperation(value = "게시글 수정", notes = "게시글을 수정합니다. 성공 여부와 글 번호(PK)를 반환합니다.")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "commId", value = "게시글 번호", paramType = "path", required = true),
		@ApiImplicitParam(name = "commPostTitle", value = "게시글 제목", paramType = "query", required = true),
		@ApiImplicitParam(name = "commPostContents", value = "게시글 내용", paramType = "query", required = true),
		@ApiImplicitParam(name = "commTempsave", value = "실제등록: 0, 임시저장: 1", paramType = "query", required = true)
	})
	public APIResponse boardModify(@ApiIgnore @RequestBody BoardDTO dto) throws ControllerException {
		log.trace("boardModify({}) invoked.", dto);
		
		APIResponse res = new APIResponse();
		
		try { 
			res.add("result", this.service.modifyBoard(dto) ? "SUCCESS" : "FAILED"); 
			res.add("commId", dto.getCommId());
		} catch (ServiceException e) { throw new ControllerException(e); } // try-catch
		
		return res;
	} // boardModify
	
	// 게시글 삭제
	@DeleteMapping("/{commId}")
	@ApiOperation(value = "게시글 삭제", notes = "게시글을 삭제합니다. 성공 여부를 반환합니다.")
	@ApiImplicitParam(name = "commId", value = "게시글 번호", paramType = "path", required = true)
	public APIResponse boardDelete(@PathVariable("commId") int commId) throws ControllerException {
		log.trace("boardWrite({}) invoked.", commId);
		
		APIResponse res = new APIResponse();
		
		try { 
			res.add("result", this.service.removeBoard(commId) ? "SUCCESS" : "FAILED"); 
		} catch (ServiceException e) { throw new ControllerException(e); } // try-catch
		
		return res;
	} // boardDelete
	
	// 게시글 추천 여부 체크
	@GetMapping("/vote/{commId}/{userId}")
	@ApiOperation(value = "게시글 추천여부 조회", notes = "특정 유저의 게시글을 추천여부를 조회합니다. 추천했을 시 true를 반환합니다.")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "commId", value = "게시글 번호", paramType = "path", required = true),
		@ApiImplicitParam(name = "userId", value = "유저 아이디", paramType = "path", required = true)
	})
	public APIResponse checkVote(
		@PathVariable("commId") int commId,
		@PathVariable("userId") String userId) throws ControllerException {
		
		log.trace("checkVote({}, {}) invoked.", commId, userId);
		
		APIResponse res = new APIResponse();
		
		try { res.add("result", this.service.checkMyLike(commId, userId)); } 
		catch(Exception e) { throw new ControllerException(e); } // try-catch 
		
		return res;
	} // checkVote
	
	// 게시글 추천
	@PostMapping("/vote/{commId}/{userId}")
	@ApiOperation(value = "게시글 추천", notes = "게시글을 추천합니다. 성공 여부를 반환합니다.")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "commId", value = "게시글 번호", paramType = "path", required = true),
		@ApiImplicitParam(name = "userId", value = "유저 아이디", paramType = "path", required = true)
	})
	public APIResponse boardVote(
		@PathVariable("commId") int commId,
		@PathVariable("userId") String userId) throws ControllerException {
		
		log.trace("boardVote({}, {}) invoked.", commId, userId);
		
		APIResponse res = new APIResponse();
		
		try { res.add("result", this.service.boardLike(commId, userId) ? "SUCCESS" : "FAILED"); } 
		catch(Exception e) { throw new ControllerException(e); } // try-catch 
		
		return res;
	} // boardVote
	
	// 게시글 추천취소
	@DeleteMapping("/vote/{commId}/{userId}")
	@ApiOperation(value = "게시글 추천 취소", notes = "게시글을 추천을 취소합니다. 성공 여부를 반환합니다.")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "commId", value = "게시글 번호", paramType = "path", required = true),
		@ApiImplicitParam(name = "userId", value = "유저 아이디", paramType = "path", required = true)
	})
	public APIResponse boardVoteCancel(
		@PathVariable("commId") int commId,
		@PathVariable("userId") String userId) throws ControllerException {
		
		log.trace("boardVoteCancel({}, {}) invoked.", commId, userId);
		
		APIResponse res = new APIResponse();
		
		try { res.add("result", this.service.cancelBoardLike(commId, userId) ? "SUCCESS" : "FAILED"); } 
		catch(Exception e) { throw new ControllerException(e); } // try-catch 
		
		return res;
	} // boardVoteCancel
	 
	// 댓글 작성
	@PostMapping("/reply/new")
	@ApiOperation(value = "댓글 작성", notes = "댓글을 작성합니다. 성공 여부를 반환합니다.")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "userId", value = "작성자 ID", paramType = "query", required = true),
		@ApiImplicitParam(name = "replyContents", value = "댓글 내용", paramType = "query", required = true),
		@ApiImplicitParam(name = "commId", value = "게시글 번호", paramType = "query", required = true),
	})
	public APIResponse replyWrite(@ApiIgnore ReplyDTO dto) throws ControllerException {
		log.trace("replyWrite({}) invoked.", dto);
		
		APIResponse res = new APIResponse();
		
		try { 
			res.add("result", this.service.createReply(dto) ? "SUCCESS" : "FAILED");
		} catch (ServiceException e) { throw new ControllerException(e); } // try-catch
		
		return res;
	} // replyWrite
	
	// 댓글 수정
	@PutMapping("/reply/{replyId}")
	@ApiOperation(value = "댓글 수정", notes = "댓글을 수정합니다. 성공 여부를 반환합니다.")
	@ApiImplicitParams({
		@ApiImplicitParam(name = "replyId", value = "댓글 번호", paramType = "path", required = true),
		@ApiImplicitParam(name = "replyContents", value = "댓글 내용", paramType = "query", required = true),
	})
	public APIResponse replyModify(@ApiIgnore @RequestBody ReplyDTO dto) throws ControllerException {
		log.trace("replyModify({}) invoked.", dto);
		
		APIResponse res = new APIResponse();
		
		try { 
			res.add("result", this.service.modifyReply(dto) ? "SUCCESS" : "FAILED");
		} catch (ServiceException e) { throw new ControllerException(e); } // try-catch
		
		return res;
	} // replyModify
	
	// 댓글 삭제
	@DeleteMapping("/reply/{replyId}")
	@ApiOperation(value = "댓글 삭제", notes = "댓글을 삭제합니다.(DB삭제 X) 성공 여부를 반환합니다.")
	public APIResponse replyDelete(@PathVariable int replyId, int commId) throws ControllerException {
		log.trace("replyDelete({}, {}) invoked.", replyId, commId);
		
		APIResponse res = new APIResponse();
		
		try { 
			res.add("result", this.service.removeReply(replyId, commId) ? "SUCCESS" : "FAILED");
		} catch (ServiceException e) { throw new ControllerException(e); } // try-catch
		
		return res;
	} // replyDelete
	
	// 댓글 채택
	@PostMapping("/reply/select/{replyId}")
	public String replySelect() {
		return "test!";
	}
	
	// 임시저장 목록 조회
	@GetMapping("/tmp")
	public APIResponse tempSaveList(String userId) throws ControllerException {
		log.trace("tempSaveList({}) invoked.", userId);
		
		APIResponse res = new APIResponse();
		
		try { 
			res.add("result", this.service.getTmpSave(userId));
		} catch (ServiceException e) { throw new ControllerException(e); } // try-catch
		
		return res;
	} // tempSaveList
	
	@PutMapping("/view/{commId}")
	@ApiOperation(value = "조회수 업데이트", notes = "게시글의 조회수를 업데이트합니다. 성공여부를 반환합니다.")
	public APIResponse increaseViewCount(
		@PathVariable("commId") int commId) throws ControllerException {
		
		log.trace("increaseViewCount({}) invoked.", commId);
		
		APIResponse res = new APIResponse();
		
		try { res.add("result", this.service.increaseView(commId) ? "SUCCESS" : "FAILED"); } 
		catch (ServiceException e) { throw new ControllerException(e); } // try-catch
		
		return res;
	} // increaseViewCount
	
} // end class
