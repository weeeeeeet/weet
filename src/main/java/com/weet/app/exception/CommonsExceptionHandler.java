package com.weet.app.exception;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@ControllerAdvice
public class CommonsExceptionHandler {
	
	
	@ExceptionHandler( Exception.class )
	public String handleException(Exception e, Model model) {
		log.trace("handleException(e, model) invoked.");
		
		model.addAttribute("_EXCEPTION_", e);
		
		// 어떻게 하면, 여러번 wrapping 된 예외를 모두 출력할 수 있을까요!?
		// 예: DAOException 발생 -> ServiceException 으로 Wrapping하여 throw -> ControllerException으로
		//     Wrapping 하여 Throw됨 (우리의 MVC 구성요소의 예외발생 구조가 이러함)
		Throwable t = e;
		
		do {
			// 무조건 가장 바깥쪽 예외에 대한 정보 출력 후, 안쪽에 계속 겹쳐있는 예외를 모두 출력
			log.error("\t =============================");
			log.error("\t+ 1. Exception type: {}", t.getClass().getName());
			log.error("\t+ 2. Exception message: {}", t.getMessage());
		} while((t = t.getCause()) != null);
		
		return "errorPage";	// View name
	} // handleException

} // end class
