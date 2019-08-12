package com.spring.stock.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.stock.vo.StockRecodeVO;
import com.spring.stock.vo.StockVO;
import com.spring.stock.vo.Stock_StockVO;
import com.spring.stock.vo.StockstockVO;

public interface StockDAO {
	// 회원가입
	public int idCheck(String username); 									// 회원가입 ID 중복확인
	public int hpCheck(String hp);												// 회원가입 HP 중복확인
	public int insertUser(Map<String, String>map);						// 회원 가입
	public Map<String, Object> selectUser(String username);		// 회원 정보 삭제
	public int insertAuth(Map<String, Object> map);					// 인증DB 추가
	public int authCheck(Map<String, Object> map);
	// 주식 ticker 광고 기능(상단 슬라이드식 보여주는 광고)
	public List<StockRecodeVO> stockTickerYesterday();	//어제 정보
	public List<StockRecodeVO> stockTickerToday();		//금일 정보

	// 주식 및 회사 검색 (ajax)
	public List<StockRecodeVO> searchList(String keyword);
	
	// 관심종목 갯수구하기 
    public int getItemCnt(Map<String, Object> map);

    // 관심종목 리스트조회
    public List<StockstockVO> getItemList(Map<String, Object> map);    
    // 게시판 한개의 글  ArtboxBoardVO 근데 그걸 게시판 있는거 만큼 다 가지고 와야함 -> 객체 여러개!! List로 받음 
	
    // 선택기업 
    public StockstockVO selectCompany(Map<String, Object> map);
    
 	// 종목 리스트
 	public List<StockstockVO> stockList();
 	
 	// 수정 주가 차트
 	public List<Map<String,Object>> chart(String stockcode);
 	
 	// 매수 예약 내역
 	public List<Stock_StockVO> buyBook();	//id 넣어야함
 	
 	// 매도 예약 내역
 	public List<Stock_StockVO> sellBook();	//id 넣어야함
 	
 	// 호가창 출력  화면
 	public Stock_StockVO asking_stock(String CompnayCode);
 	
 	// 관심종목 삭제 
    public int deleteItem(Map<String, Object> map);
    
    //상단 5개 종목명 리스트
    public List<Stock_StockVO> getTopList();
    
    //각 종목마다의 리스트 추가
    public Map<String, List<Stock_StockVO>> getThemeMap(List<String> themeList);
    
  //현재 존재하는 종목명
	public List<String> getThemeList();
	
	public int idHpChk(Map<String, Object> map);		// 이름, 전화번호 확익
	public int modifyPwd(Map<String, String>map);				// 패스워드 변경
	
	// 관심종목 추가
 	public int insertInterest(Map<String, Object> map);
 	
 	// 관심종목 추가시 중복체크
 	public int checkInterest(Map<String, Object> map);
 	// 재무 내역
  	public List<StockRecodeVO> financialInfo(String stockcode);
  	
  	// 기업 정보
  	public StockstockVO StockInfo(String stockcode);
    
    // 비밀번호 확인 
	public String getPwd(Map<String,Object> map);
    
	// 회원정보가져오기
	public StockVO getMemberInfo(String strId);
	
	// 회원정보 수정
	public int updateMember(StockVO vo);
	
	// 회원정보 삭제
	public int deleteMember(String strId);
}
