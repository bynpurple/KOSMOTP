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
 	
 	// 기업 수정 주가 차트
 	public void chart(HttpServletRequest req, Model model);

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
}
