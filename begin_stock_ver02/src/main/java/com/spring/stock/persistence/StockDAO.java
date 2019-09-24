package com.spring.stock.persistence;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.spring.stock.vo.AccountVO;
import com.spring.stock.vo.MessageVO;
import com.spring.stock.vo.StockRecodeVO;
import com.spring.stock.vo.StockThemeVO;
import com.spring.stock.vo.StockVO;
import com.spring.stock.vo.Stock_StockVO;
import com.spring.stock.vo.Stock_completedVO;
import com.spring.stock.vo.Stock_transferVO;
import com.spring.stock.vo.StockstockVO;
import com.spring.stock.vo.TransferVO;
import com.spring.stock.vo.completedVO;
import com.spring.stock.vo.userInquiryVO;

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
    public List<Stock_StockVO> getThemeMap(String theme);
    
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
	
	// 테마 세부 내용
	public List<Stock_StockVO> getdetailTheme(String theme);
	
	// 회원정보 삭제
	public int deleteMember(String strId);
	
	public StockThemeVO getpreviewTheme(String theme);
	
	//메시지 전송
	public int sendMessage(MessageVO mvo);
	
	//수신 메시지 목록 가져오기
	public List<MessageVO> getReceivedMessage(String username);
	
    //보낸 메시지 목록 가져오기
	public List<MessageVO> getSentMessage(String username);
	
	//메시지 세부 내용
	public MessageVO getDetailMessage(int message_id);
	
	//읽음 처리
	public void setReadable(MessageVO mvo);
	
	//메시지 휴지통 목록 가져오기
	public List<MessageVO> getDeletedMessage(String username);
	
	//메시지 휴지통행
	public int setNewable(List message_ids);
	
	//메시지 복구
	public int recoveryNewable(List message_ids);
	
	//전체 회원 명단 가져오기
	public List<String> getEntireUsernames();
	
	//전체 메시지 전송
	public int sendEntireMessage(List<MessageVO> mvo);
	
	public List<StockRecodeVO> getStockRecord(String stocktheme);
	
    // 관심종목 - 선택기업그래프 
    public List<Map<String,Object>> selectCompanyChart(String stockcode);
    
    // 관심종목- 250일 최고,최저값 확인 
    public StockRecodeVO selectAvg(String stockcode);
    
    //8.14 이경재 나의 주식 거래 정보
  	public List<completedVO>completedStock(Map<String,Object> map);
  	//나의 보유 주식 조회
  	public List<completedVO> MyStock(String username);
  	//이체화면 클릭 시 계좌정보 조회
  	public AccountVO accountInfo(String username);
  	//계좌 존재 여부 조회
  	public int accountChk(Map<String,Object> map);
  	//계좌 금액 조회
  	public AccountVO accountSearch(Map<String,Object> map);
  	//이체
  	public int transferMoney(Map<String,Object> map);
  	//이체 시 금액 차감
  	public void minusMoney(Map<String,Object> map);
  	//이체 정보 조회
  	public List<TransferVO> transfInfo(String username);
  	//이체 정보 날짜 조회
  	public List<TransferVO> dateTranseInf(Map<String, Object> map);
	// 공지사항 게시글 갯수 구하기
	public int getNoticeCnt();
	// 게시글 목록 조회
	public List<StockVO> getNoticeList(Map<String, Object> map);
	// 게시글 작성 처리
	public int insertNotice(StockVO vo);
	// 게시글 조회수
	public int addNoticeReadCnt(int nonum);
	// 공지사항 상세 조회
	public StockVO getNotice(int nonum);
	// 총고객 수
	public int userCount();
	// 관리자 정보 상세보기
	public StockVO getHostInfo(String username);
	// user 리스트 
	public List<StockVO> getUserList(Map<String, Object> map);
	//매도 내역 갯수구하기
	public int getArticleCnt(String username);
	//매도 내역 구하기
	public List<Stock_completedVO> getArticleList2(Map<String, Object> map);
	//매수 내역 갯수 구하기
	public int getArticleCnt1(String username);
	//매수 내역 구하기
	public List<Stock_completedVO> getArticleList1(Map<String, Object> map1);
	//이체 - 입금 내역 갯수 구하기
    public int getArticleCnt2(String username);
    //이체 - 입금 내역 구하기
    public List<Stock_transferVO> getArticleList(Map<String, Object> map2);
    //이체 - 출금 내역 갯수 구하기
    public int getArticleCnt3(String username);
    //이체 - 출금 내역 구하기
    public List<Stock_transferVO> getArticleList3(Map<String, Object> map3);
    // 1대1문의 게시글 갯수 구하기
 	public int getArtcleCnt4();
 	// 게시글 목록 조회
 	public List<userInquiryVO>getArticleList4(Map<String, Object>map);
 	// 1대1문의 글 조회수증가
 	public int addReadCnt(int num);
 	// 1대1문의 글 상세조회
 	public userInquiryVO getArticle(int num);
 	// 글쓰기 처리
 	public int insertBoard(userInquiryVO vo);
 	// 글수정 처리
 	public int updateBoard(userInquiryVO vo);
 	// 글 삭제
 	public int deleteBoard(int num);
 	// 종목 검색
  	public List<StockstockVO> stocklistsearch(String stockname) throws IOException;
  	// 트레이딩 페이지 차트
  	public List<Map<String, Object>> tradingchart(String stockcode);
}
