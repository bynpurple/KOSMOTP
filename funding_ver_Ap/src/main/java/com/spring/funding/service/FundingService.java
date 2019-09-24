package com.spring.funding.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface FundingService {

	public void editor(HttpServletRequest req, Model model);	// 펀드 작성하기1
	
	public void editor1(HttpServletRequest req, Model model);	// 펀드 작성하기2
	
	public void editorCompleted(HttpServletRequest req, Model model);	// 펀드 작성하기 완료
	
	public void fundingDetail(HttpServletRequest req, Model model);	// 펀드 상세 내용
	
	public void Modifyeditor(HttpServletRequest req, Model model); // 수정 펀드 상세페이지1
	
	public void fundCommnet(HttpServletRequest req, Model model); // 펀드 코멘트
	
	public void fundCommnetView(HttpServletRequest req, Model model); // 펀드 코멘트
	
	public void Recomment(HttpServletRequest req, Model model); // 코멘트 답글
	
	public void RecommentTalk (HttpServletRequest req, Model model); //답글 입력
	
	public void fundCommnetDel (HttpServletRequest req, Model model); //코멘트 삭제
	
	public void fundrepleDel (HttpServletRequest req, Model model); //코멘트 댓글 삭제
	
	// 로그인 & 회원가입
	public void loginPro(HttpServletRequest req, Model model);				// 로그인 하기
	public void confirmId(HttpServletRequest req, Model model);				// 아이디 중복확인
	public void checkAuth(HttpServletRequest req, Model model);		// 인증 확인
	public void confirmHp(HttpServletRequest req, Model model) throws Exception;			// 연락처 중복확인
	public void confirmSession(HttpServletRequest req, Model model);
	
	// 회원정보 찾기
	public void idHpCheck(HttpServletRequest req, Model model) throws Exception;	// 계정 찾기 정보(이름, hp) 조회
	public void showId(HttpServletRequest req, Model model);	// 아이디 보여주기
	public void idNameHpCheck(HttpServletRequest req, Model model) throws Exception;	// 패스워드 찾기 정보(아이디, 이름, hp) 조회
	public void insertPwd(HttpServletRequest req, Model model);	// 패스워드 변경 페이지
	public void modifyPwd(HttpServletRequest req, Model model);	// 패스워드 변경 완료
	
	// 공지사항 및 이벤트
	public void writeNotice(HttpServletRequest req, Model model);			// 글번호 넘기기용
	public void writeNoticePro(HttpServletRequest req, Model model);		// 관리자 공지사항 작성(관리자)
	public void writeEventPro(HttpServletRequest req, Model model);		// 괸리자 이벤트 작성(관리자)
	public void allNoticeList(HttpServletRequest req, Model model);			// 전체 공지사항&이벤트 보여주기
	public void noticeList(HttpServletRequest req, Model model);				// 공지사항 리스트 보여주기
	public void eventList(HttpServletRequest req, Model model);				// 이벤트 리스트 보여주기
	public void noticeForm(HttpServletRequest req, Model model);			// 공지사항, 이벤트 상세보기
	public void deleteNotice(HttpServletRequest req, Model model);			// 공지사항/이벤트 삭제하기(관리자)
	public void modifyNoticePro(HttpServletRequest req, Model model);	// 공지사항 수정하기
	
	// 관리자 페이지
	public void memberBoard(HttpServletRequest req, Model model);		// 회원 1대1문의 내역
	public void memberList(HttpServletRequest req, Model model);			// 모든 회원 명단 확인
	public void findingCount(HttpServletRequest req, Model model);			// 진행 중인 펀딩 수
	
	// 1대1 문의
	public void quiryList(HttpServletRequest req, Model model);				// 1대1 문의 글목록
    public void contentForm(HttpServletRequest req, Model model);			// 상세페이지
    public void userWriterForm(HttpServletRequest req, Model model);		// 글쓰기 페이지
    public void writePro(HttpServletRequest req, Model model);				// 글쓰기 처리 완료
    public void usermodifyView(HttpServletRequest req, Model model);	// 글수정 상세페이지
 	public void modifyPro(HttpServletRequest req, Model model);			// 글수정 처리 페이지
  	public void userdeletePro(HttpServletRequest req, Model model);		// 글삭제 처리페이지
  	public void board_comment(HttpServletRequest req, Model model);	// 1대1문의 답글 쓰기
	
	//스마트컨트랙트
	public void createContract(HttpServletRequest req, Model model);		//컨트랙트 생성
	public void getContract(HttpServletRequest req, Model model);			//컨트랙트 로드
	public void callContract(HttpServletRequest req, Model model) throws Exception;			//컨트랙트 성사
	
	public void getInvestors(HttpServletRequest req, Model model) throws Exception;
	public void accountInfo(HttpServletRequest req, Model model);
	public void getMyAccount(HttpServletRequest req, Model model);
	public void getMyOwnTransaction(HttpServletRequest req, Model model) throws Exception;
	
	//fund갯수
	public void fundCount(HttpServletRequest req, Model model);
	
	// ============== 아진 추가 2019.09.17 ================
    public void fundingList(HttpServletRequest req, Model model);      // 펀딩 리스트 
    
    public void applicationFund(HttpServletRequest req, Model model);		// 펀딩 신청하기
  	public void requestFundingList(HttpServletRequest req, Model model);	// 펀딩 신청 리스트
  	public void confirmRequestFund(HttpServletRequest req, Model model);	// 펀딩 신청 리스트 상세보기
  	public void completeConfirm(HttpServletRequest req, Model model);		// 펀딩 승인하기
}
