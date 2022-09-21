package com.weet.app.help.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.weet.app.exception.DAOException;
import com.weet.app.help.domain.Criteria;
import com.weet.app.help.domain.HelpDTO;
import com.weet.app.help.domain.HelpVO;

@Mapper
public interface HelpMapper {
	
//	====================== 1대1 문의 ======================= //
	
	// 1대1 문의 목록
	List<HelpVO> selectInquiryList() throws DAOException;
	
	// 1대1 문의 글쓰기
	public abstract Integer insertInquiry(HelpDTO dto) throws DAOException;
	
	public abstract Integer insertSelectKey(HelpDTO dto) throws DAOException;
	
	// 1대1 문의글 상세 조회
	@Select("SELECT * FROM t_cs WHERE service_no = #{inquiryToBeRead}")
	public abstract HelpVO selectInquiry(@Param("inquiryToBeRead") Integer serviceNo) throws DAOException;	// dto에서 param값을 꺼낼 수 없기 때문에 bno
	
	// 1대1 문의글 삭제
	@Delete("DELETE FROM t_cs WHERE service_no = #{inquiryToBeDeleted}")
	public abstract int deleteInquiry(@Param("inquiryToBeDeleted") Integer serviceNo) throws DAOException;
	
	// 1대1 문의글 수정
	public abstract Integer updateInquiry(HelpDTO dto) throws DAOException;
	
	
//	=================== 자주 묻는 질문 ==================== //
	
	// 자주 묻는 질문 목록
	public abstract List<HelpVO> selectQnaList(Criteria cri) throws DAOException;
	
	// 자주 묻는 질문 상세 조회
	@Select("SELECT * FROM t_cs WHERE service_no = #{qnaToBeRead}")
	public abstract HelpVO selectQna(@Param("qnaToBeRead") Integer serviceNo) throws DAOException;
	
	// 총 개수
	public int getTotal(Criteria cri);
	

//	====================== 공지사항 ======================= //
	
	// 공지사항 목록
	public abstract List<HelpVO> selectNoticeList(Criteria cri) throws DAOException;
	
	// 공지사항 상세 조회
	@Select("SELECT * FROM t_cs WHERE service_no = #{noticeToBeRead}")
	public abstract HelpVO selectNotice(@Param("noticeToBeRead") Integer serviceNo) throws DAOException;
	
	// 총 개수
	public int getTotalNotice(Criteria cri);

}
