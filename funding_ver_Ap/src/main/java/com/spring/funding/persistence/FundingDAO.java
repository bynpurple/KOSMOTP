package com.spring.funding.persistence;

import java.util.List;
import java.util.Map;

import com.spring.funding.vo.AccountVO;
import com.spring.funding.vo.BoardVO;
import com.spring.funding.vo.ContractVO;
import com.spring.funding.vo.FAQCommentVO;
import com.spring.funding.vo.FundInfVO;
import com.spring.funding.vo.FundInquiryVO;
import com.spring.funding.vo.FundStockInfVO;
import com.spring.funding.vo.Fund_reserveVO;
import com.spring.funding.vo.FundingTransactionVO;
import com.spring.funding.vo.FundingVO;
import com.spring.funding.vo.NoticeVO;
import com.spring.funding.vo.commentReplyVO;
import com.spring.funding.vo.funding_stock_info_allVO;

public interface FundingDAO {
	public Map<String, Object> selectUser(String username);

	public int loginPro(Map<String, Object> map);	// 로그인 하기
	
	public int fundEdit1(Map<String,Object> map);	// 펀드작성하기 1
	
	public int fundEdit2(Map<String,Object> map);	// 펀드작성하기 2
	
	public int fundEditCompleted(Map<String,Object> map);	// 펀드작성하기 완료
	
	public int fundEditStock(Map<String,Object> stock);	// 주식 발행 정보 입력
	
	public FundInfVO fundInf(int fund_id);	// 펀드 정보
	
	public FundStockInfVO stockInf(int fund_id);	// 주식 발행 정보
	
	public int Modifyfund1(Map<String, Object> map);// 펀드 수정 페이지 
	
	public int ModifyfundStock(Map<String, Object> stock); // 주식 발행 정보 수정
	
	public int idChk(int fund_id); //펀드 작성 이력 확인	
	
	public int fundCommnet(Map<String,Object> map);	// 펀드 코멘트 작성
	
	public List<FAQCommentVO> fundCommnetView(int fund_id);	// 펀드 코멘트 출력
	
	public int CommentTalk(Map<String,Object> map);	// 펀드 코멘트 답글 작성
	
	public List<commentReplyVO> CommnetRepleView(Map<String,Object> map);	// 펀드 코멘트 답글 출력
	
	public int fundCommnetDel(Map<String,Object> map);	// 펀드 코멘트 삭제
	
	public int fundRepleDel(Map<String,Object> map);	// 코멘트 댓글 삭제
	
	// 회원가입 & 로그인
	public int insertUser(Map<String, String>map);			// 회원 가입
	public int idCheck(String username);	// ID 중복확인하기
	public int hpCheck(String hp);		// HP 중복확인하기
	public int insertAuth(Map<String, Object> map);	// 인증하기
	public int authCheck(Map<String, Object> map);	// 인증 확인하기
	public int insertBoard_member(Map<String, String> map);		// 회원가입시 게시판 글 확인용 테이블에 회원 정보 input
	
	// 계정 및 패스워드 찾기
	public int idHpChk(Map<String, Object> map);		// 이름, 전화번호 확인	
	public int modifyPwd(Map<String, String>map);	// 패스워드 변경
	public FundingVO findId(String hp);		// 아이디 찾기
	public int idNameHpChk(Map<String, Object> map);		// 아이디, 이름, 전화번호 확인
	
	// 공지사항 및 이벤트
	public int insertNotice(NoticeVO vo);		// 공지사항 입력하기
	public int insertEvent(NoticeVO vo);			// 이벤트 입력하기
	public int allNoticeCount();						// 공지사항 & 이벤트 갯수 구하기
	public List<NoticeVO> allNoticeList(Map<String, Object> map);	// 공지사항 & 이벤트 게시글 리스트로 출력
	public List<NoticeVO> noticeList(Map<String, Object> map);		// 공지사항 리스트 보여주기
	public List<NoticeVO> eventList(Map<String, Object> map);		// 이벤트 리스트 보여주기
	public NoticeVO noticeInfo(int notice_id);		// 공지사항 상세조회
	public int deleteNotice(int notice_id);			// 공지사항 삭제
	public int modifyNotice(Map<String, Object> map);			// 공지사항 수정
	
	// 관리자 페이지
	public int memberCount();		// 회원 수(관리자제외)
	public int board_cnt();			// 전체 회원 게시글 작성 수
	public int board_rp_cnt();		// 전체 회원 게시글 답글 수
	public List<BoardVO> boardCount(Map<String, Object> map);	// 게시글, 답글 갯수 가져오기
	public int fundingHost();	// 현재 진행 중인 펀딩 수
	public List<FundingVO> memberList(Map<String, Object> map);		// 회원 리스트
	
	// 1대1 문의
	public int getArticleCnt();	// 1대1문의 게시글 갯수 구하기
	public List<FundInquiryVO>getArticleList(Map<String, Object>map); 	// 게시글 목록 조회
	public int addReadCnt(int num);		// 1대1문의 글 조회수 증가
	public FundInquiryVO getArticle(int num);	// 1대1문의 글 상세조회
	public int insertBoard(FundInquiryVO vo);	// 글쓰기 처리
	public int updateBoard(FundInquiryVO vo);	// 글수정 처리
	public int deleteBoard(int num);		// 글 삭제
	public int insertBoardComment(FundInquiryVO vo);	// 답글 쓰기
	public List<FundInquiryVO> boardCommentList(Map<String, Object> map);		// 답글 보기
	public int updateBoardComment(String username);	// 답글 수 + 1
	public int updateBoardCount(String username);			// 게시글 수 + 1
	public int minusBoardCount(String username);			// 게시글 수 - 1
	public int inquiryComment(int num);	// 답글 존재 여부 확인
	public int minusBoardComment(String username);	// 답글 수 - 1
	public int updateReply_cnt(int num);	// 해당 게시글의 답글 확인
	
	//스마트컨트랙트
	public int createContract(String fundcode, String contractAddress, String username);		//컨트랙트 생성 및 인서트
	public ContractVO getContract(String fundcode);								//컨트랙트 주소 가져오기
	public int plusContractIndex(String fundcode);							//컨트랙트 인덱스 수정
	public int createTransaction(Map<String, Object> map);					//트랜잭션 내용 추가
	public AccountVO accountInfo(String username);
	public int updateAccount(Map<String, Object> map);
	public List<FundingTransactionVO> getMyOwnTransaction(String username);
	public int updateHostAccount(Map<String, Object> map);
	public List<FundingTransactionVO> getFundTransaction(int fund_id);
	
	//fund갯수 구하기
	public int startupCount();
	public int cultureCount();
	
	// 펀드 리스트  구하기 ============== 아진 추가 2019.09.17 ================
    public List<funding_stock_info_allVO> allfundList();
    
    
    // ============== 아진 추가 2019.09.17 ================
    public int createAccount(Map<String, Object> map);
    
    public int applicationFund(Fund_reserveVO vo);	// 펀딩 신청하기
	public int requestFundCount();	// 펀딩 신청 수량
	public List<Fund_reserveVO> requestFundList(Map<String, Object> map);	// 펀딩 신청 리스트
	public Fund_reserveVO confirmFund(int reserve_id);	// 펀딩 신청 상세보기
	public int completeConfirm(int reserve_id);	// 펀딩 승인

}
