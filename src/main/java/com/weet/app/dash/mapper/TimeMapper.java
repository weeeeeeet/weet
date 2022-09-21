package com.weet.app.dash.mapper;

import org.apache.ibatis.annotations.Select;

public interface TimeMapper {

	@Select("SELECT to_char(current_date, 'yyyy/MM/dd HH24:MI:SS') AS now FROM dual")
	public abstract String getCurrentTime1();
	
	//--------------------- 마이바티스의 XML mapper 자동실행 규칙 ----------------------//
	// 마이바티스는 아래의 추상메소드에 대한 SQL 문장을 찾기 위해 클래스경로(classpath) 에서,
	//
	//  (1) 이 인터페이스와 동일한 패키지 폴더를 찾아가,
	//  (2) 이 인터페이스와 동일한 이름의 XML mapper 파일을 찾아가,
	//  (3) 이 인터페이스와 동일한 패키지 이름을 namespace 속성의 값으로 가지는 XML mapper 파일 안의,
	//  (4) 이 추상메소드와 동일한 이름의 id 값을 가지는 SQL문장을 찾아 실행시킴
	//
	// * 만일, 위의 조건 중 (1), (2), (4)와 일치하지 못하면, 아래의 오류가 발생:
	//   org.apache.ibatis.binding.BindingException: Invalid bound statement (not found): 
	//   org.zerock.myapp.mapper.TimeMapper.getTime2
	//
	// * 만일, 위의 조건 중 (3)와 일치하지 못하면, 아래의 오류가 발생:
	//   org.apache.ibatis.builder.BuilderException: Wrong namespace.
	//   Expected 'org.zerock.myapp.mapper.TimeMapper'
	//   but found 'org.zerock.myapp.mapper.TimeMapper2'.
	//--------------------------------------------------------------------------//
	
	// 이 추상메소드는 SQL문장을 어노테이션으로 가지지 않음
	// TimeMapper.xml파일에 등록된 Mapped 문장으로 처리
	public abstract String getCurrentTime2();
} // end interface
