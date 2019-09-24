package com.spring.stock.service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

import com.spring.stock.vo.StockstockVO;

public interface StockService {

	// 회원가입
	public void confirnId(HttpServletRequest req, Model model);		// 아이디 중복확인
	public void comfirnHP(HttpServletRequest req, Model model) throws Exception;		// H.P 번호 중복확인
	public void checkAuth(HttpServletRequest req, Model model);
	public void idNameHpCheck(HttpServletRequest req, Model model) throws Exception;
	public void insertPwd(HttpServletRequest req, Model model);
	public void modifyPwd(HttpServletRequest req, Model model);
	
	// 등락률(전일종가-금일종가/금일종가 *100)
	public void upDownRate(HttpServletRequest req, Model model);	//등락률
		
	// 회사 명 및 코드 검색(ajax)
	public void searchList(HttpServletRequest req, Model model);
	
	// 관심목록보기 
    public void interestedItemsList(HttpServletRequest req, Model model);
	
    // 선택기업 목록 
    public StockstockVO selectCompany(HttpServletRequest req, Model model);
    
    // 검색어 (급상승 종목, 검색 상위 종목, 네이버 실시간)
 	public void search(HttpServletRequest req, Model model) throws IOException;
 		
 	// 종목 리스트
 	public void stockList(HttpServletRequest req, Model model);

	// 매수 매도 예약 내역
	public void buySellBook(HttpServletRequest req, Model model);
	
	// 회사 명 선택 후 호가창 출력
	public void asking_stock(HttpServletRequest req, Model model);
	
    // 관심종목 삭제 
    public int deletePro(HttpServletRequest req, Model model);
    
    //최고 변동량 주식 리스트 
    public void gettop5stock(HttpServletRequest req, Model model);

 	// 관심종목 추가
 	public void insertInterest(HttpServletRequest req, Model model);

    // 회원정보보기
    public void modifyView(HttpServletRequest req, Model model);
    
    // 회원정보 수정
    public void c_modifyView(HttpServletRequest req, Model model);
    
    // 회원 탈퇴처리 
    public void c_deletePro(HttpServletRequest req, Model model, HttpServletResponse res);
    
    // 테마 정보
    public void detailTheme(HttpServletRequest req, Model model);
    
    //메시지 전송
    public void sendMessage(HttpServletRequest req, Model model);
    
    //수신 메시지 목록 가져오기
    public void getReceivedMessage(HttpServletRequest req, Model model);
    
    //보낸 메시지 목록 가져오기
    public void getSentMessage(HttpServletRequest req, Model model);
    
    //메시지 세부 내용
    public void getDetailMessage(HttpServletRequest req, Model model);
    
    //휴지통 메시지 목록 가져오기
    public void getDeletedMessage(HttpServletRequest req, Model model);
    
    //메시지 휴지통행
    public void deleteMessagePro(HttpServletRequest req, Model model);
    
    //메시지 복구
    public void recoveryMessagePro(HttpServletRequest req, Model model);
    
    //관리자 전체 메시지 전송
    public void sendEntireMessagePro(HttpServletRequest req, Model model);
    
    //모든 테마 리스트 가져오기
    public void getEntireThemes(HttpServletRequest req, Model model);
    
    //분석할 선택된 테마 정보 가져오기
    public void getChooseThemes(HttpServletRequest req, Model model);

  	////8.14 이경재 나의 주식 거래 정보
  	public void completedStock(HttpServletRequest req, Model model);
  	//8.15 이경재 나의 보유 주식
  	public void MyStock(HttpServletRequest req, Model model);
  	//8.19이체
  	public void transferMoney(HttpServletRequest req, Model model);
  	//계좌 조회
  	public void accountSearch(HttpServletRequest req, Model model);
  	//계좌 정보 조회
  	public void accountInfo(HttpServletRequest req, Model model);
  	//이체 정보 체크
  	public void transferChk(HttpServletRequest req, Model model);
  	//이제정보 불러오기 ajax
  	public void dateTranseInf(HttpServletRequest req, Model model);
 // 공지사항 리스트
    public void noticeList(HttpServletRequest req, Model model);
    
    // 공지사항 작성
    public void noticeWrite(HttpServletRequest req, Model model);
    
    // 공지사항 작성 
    public void noticeWritePro(HttpServletRequest req, Model model);
    
    // 공지사항 보기
    public void noticeForm(HttpServletRequest req, Model model);
    
    // 관리자 페이지
    public void hostForm(HttpServletRequest req, Model model);
    
    //매수목록
    public void buyList(HttpServletRequest req, Model model);
    
    //매도목록
    public void sellList(HttpServletRequest req, Model model);
    
    //이체 - 입금목록
    public void Trans_InList(HttpServletRequest req, Model model);
    
    //이체 - 출금목록
    public void Trans_OutList(HttpServletRequest req, Model model);
    
    // 1대1 문의 글목록
    public void quiryList(HttpServletRequest req, Model model);
    
    // 상세 페이지
    public void contentForm(HttpServletRequest req, Model model);
    
    // 글쓰기페이지
    public void userWriterForm(HttpServletRequest req, Model model);
    
    // 글쓰기 처리완료
    public void writePro(HttpServletRequest req, Model model);
    
    // 글수정 상세페이지
    public void usermodifyView(HttpServletRequest req, Model model);
 	
 	// 글수정 처리 페이지
 	public void modifyPro(HttpServletRequest req, Model model);
 	
 	// 글삭제 처리페이지
 	public void userdeletePro(HttpServletRequest req, Model model);
 	
 	// 종목검색(추가)
    public void stocklistsearch(HttpServletRequest req, Model model) throws IOException;

 	// 기업 수정 주가 차트
 	public void chart(HttpServletRequest req, Model model) throws IOException;
 	
 	// 트레이딩 차트
 	public void chart_stock(HttpServletRequest req, Model model);
}
