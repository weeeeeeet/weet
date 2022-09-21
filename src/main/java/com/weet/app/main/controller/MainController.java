package com.weet.app.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.weet.app.board.domain.BoardVO;
import com.weet.app.board.service.BoardService;
import com.weet.app.classes.domain.ClassVO;
import com.weet.app.classes.service.ClassService;
import com.weet.app.exception.ControllerException;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@RequestMapping("/")
@Controller
public class MainController {
	
	@Setter(onMethod_= @Autowired)
	private ClassService classService;

	@Setter(onMethod_= @Autowired)
	private BoardService boardService;
	
	// ======================= 메인페이지 ======================== //
	@GetMapping("/")
	public String goMain(Model model) throws ControllerException {
		log.trace("goMain() invoked.", model);
		
		try {
			List<ClassVO> recommend = this.classService.getListRecommend();
			List<ClassVO> end = this.classService.getListEnd();
			List<ClassVO> newC = this.classService.getListNew();
			List<BoardVO> board = this.boardService.getBoardMain();	// 커뮤니티 인기글
			
			model.addAttribute("_LIST_RECOMMEND_", recommend);
			model.addAttribute("_LIST_END_", end);
			model.addAttribute("_LIST_NEW_", newC);
			model.addAttribute("_LIST_BOARD_", board);
			
		} catch(Exception e) {
			throw new ControllerException(e);
		} //try-catch
		
		return "index";
	} // goMain
	
}