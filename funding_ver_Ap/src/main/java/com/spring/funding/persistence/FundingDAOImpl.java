package com.spring.funding.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

@Repository
public class FundingDAOImpl implements FundingDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public Map<String, Object> selectUser(String username) {
		return sqlSession.selectOne("com.spring.stock.persistence.StockDAO.selectUser", username);
	}
	
	@Override
	public int loginPro(Map<String, Object> map) {
		return sqlSession.selectOne("com.spring.stock.persistence.StockDAO.loginPro", map);
	}
	
	//펀드작성 이력확인
	@Override
	public int idChk(int fund_id) {
		return sqlSession.selectOne("com.spring.funding.persistence.FundingDAO.idChk",fund_id);
	}
	/* 이경재 9/5 추가 해야할 것  시작 */
	//펀드작성하기1
	@Override
	public int fundEdit1(Map<String, Object> map) {
		return sqlSession.insert("com.spring.funding.persistence.FundingDAO.fundEdit1",map);
	}
	//펀드작성하기2
	@Override
	public int fundEdit2(Map<String, Object> map) {
		return sqlSession.update("com.spring.funding.persistence.FundingDAO.fundEdit2",map);
	}
	//펀드작성하기 완료
	@Override
	public int fundEditCompleted(Map<String, Object> map) {
		return sqlSession.update("com.spring.funding.persistence.FundingDAO.fundEditCompleted",map);
	}
	//주식 발행 정보 입력
	@Override
	public int fundEditStock(Map<String, Object> stock) {
		return sqlSession.insert("com.spring.funding.persistence.FundingDAO.fundEditStock",stock);
	}
	
	//주식 발행 정보 수정
	@Override
	public int ModifyfundStock(Map<String, Object> stock) {
		return sqlSession.update("com.spring.funding.persistence.FundingDAO.ModifyfundStock",stock);
	}
	// 펀드 정보
	@Override
	public FundInfVO fundInf(int fund_id) {
		return sqlSession.selectOne("com.spring.funding.persistence.FundingDAO.fundInf",fund_id);
	}
	// 주식 발행 정보
	@Override
	public FundStockInfVO stockInf(int fund_id) {
		return sqlSession.selectOne("com.spring.funding.persistence.FundingDAO.stockInf",fund_id);
	}
	// 펀드 수정 페이지
	@Override
	public int Modifyfund1(Map<String, Object> map) {
		return sqlSession.update("com.spring.funding.persistence.FundingDAO.Modifyfund1",map);
	}
	
	// 펀드 코멘트
	@Override
	public int fundCommnet(Map<String, Object> map) {
		return sqlSession.insert("com.spring.funding.persistence.FundingDAO.fundCommnet",map);
	}
	
	// 펀드 코멘트 출력
	@Override
	public List<FAQCommentVO> fundCommnetView(int fund_id) {
		return sqlSession.selectList("com.spring.funding.persistence.FundingDAO.fundCommnetView",fund_id);
	}
	
	// 코멘트 리플 입력
	@Override
	public int CommentTalk(Map<String, Object> map) {
		return sqlSession.insert("com.spring.funding.persistence.FundingDAO.CommentTalk",map);
	}
	
	// 코멘트 리플 출력
	@Override
	public List<commentReplyVO> CommnetRepleView(Map<String,Object> map) {
		return sqlSession.selectList("com.spring.funding.persistence.FundingDAO.CommnetRepleView",map);
	}
	
	// 코멘트 삭제
	@Override
	public int fundCommnetDel(Map<String, Object> map) {
		return sqlSession.delete("com.spring.funding.persistence.FundingDAO.fundCommnetDel",map);
	}
	
	// 코멘트 리플 삭제
	@Override
	public int fundRepleDel(Map<String, Object> map) {
		return sqlSession.delete("com.spring.funding.persistence.FundingDAO.fundRepleDel",map);
	}
	/* 이경재 9/5 추가 해야할 것  종료 */
	
	//김일광
	@Override
	public int idCheck(String username) {
		return sqlSession.selectOne("com.spring.funding.persistence.FundingDAO.idCheck", username);
	}
	
	@Override
	public int hpCheck(String hp) {
		return sqlSession.selectOne("com.spring.funding.persistence.FundingDAO.hpCheck", hp);
	}
	
	@Override
	public int authCheck(Map<String, Object> map) {
		return sqlSession.selectOne("com.spring.funding.persistence.FundingDAO.authCheck", map);
	}
	
	@Override
	public int idHpChk(Map<String, Object> map) {
		return sqlSession.selectOne("com.spring.funding.persistence.FundingDAO.idHpChk", map);
	}
	
	@Override
	public int insertAuth(Map<String, Object> map) {
		return sqlSession.insert("com.spring.funding.persistence.FundingDAO.insertAuth", map);
	}
	
	@Override
	public int modifyPwd(Map<String, String>map) {
		return sqlSession.update("com.spring.funding.persistence.FundingDAO.modifyPwd", map);
	}
	
	@Override
	public FundingVO findId(String hp) {
		return sqlSession.selectOne("com.spring.funding.persistence.FundingDAO.findId", hp);
	}
	
	@Override
	public int idNameHpChk(Map<String, Object> map) {
		return sqlSession.selectOne("com.spring.funding.persistence.FundingDAO.idNameHpChk", map);
	}
	
	@Override
	public int insertNotice(NoticeVO vo) {
		return sqlSession.insert("com.spring.funding.persistence.FundingDAO.insertNotice", vo);
	}
	
	@Override
	public int insertEvent(NoticeVO vo) {
		return sqlSession.insert("com.spring.funding.persistence.FundingDAO.insertEvent", vo);
	}
	
	@Override
	public int allNoticeCount() {
		return sqlSession.selectOne("com.spring.funding.persistence.FundingDAO.allNoticeCount");
	}
	
	@Override
	public List<NoticeVO> allNoticeList(Map<String, Object> map) {
		List<NoticeVO> dtos = null;
		FundingDAO dao = sqlSession.getMapper(FundingDAO.class);
		dtos = dao.allNoticeList(map);	
		return dtos;
	}
	
	@Override
	public List<NoticeVO> noticeList(Map<String, Object> map) {
		List<NoticeVO> dtos = null;
		FundingDAO dao = sqlSession.getMapper(FundingDAO.class);
		dtos = dao.noticeList(map);	
		return dtos;
	}
	
	@Override
	public List<NoticeVO> eventList(Map<String, Object> map) {
		List<NoticeVO> dtos = null;
		FundingDAO dao = sqlSession.getMapper(FundingDAO.class);
		dtos = dao.eventList(map);	
		return dtos;
	}
	
	@Override
	public NoticeVO noticeInfo(int notice_id) {
		return sqlSession.selectOne("com.spring.funding.persistence.FundingDAO.noticeInfo", notice_id);
	}
	
	@Override
	public int deleteNotice(int notice_id) {
		return sqlSession.delete("com.spring.funding.persistence.FundingDAO.deleteNotice", notice_id);
	}
	
	@Override
	public int modifyNotice(Map<String, Object> map) {
		return sqlSession.update("com.spring.funding.persistence.FundingDAO.modifyNotice", map);
	}
	
	@Override
	public int memberCount() {
		return sqlSession.selectOne("com.spring.funding.persistence.FundingDAO.memberCount");
	}
	
	
	@Override
	public int board_cnt() {
		return sqlSession.selectOne("com.spring.funding.persistence.FundingDAO.board_cnt");
	}
	
	@Override
	public int board_rp_cnt() {
		return sqlSession.selectOne("com.spring.funding.persistence.FundingDAO.board_rp_cnt");
	}
	
	@Override
	public List<BoardVO> boardCount(Map<String, Object> map) {
		List<BoardVO> dtos = null;
		FundingDAO dao = sqlSession.getMapper(FundingDAO.class);
		dtos = dao.boardCount(map);	
		return dtos;
	}
	
	@Override
	public int insertBoard_member(Map<String, String> map) {
		return sqlSession.insert("com.spring.funding.persistence.FundingDAO.insertBoard_member", map);
	}
	
	@Override
	public int fundingHost() {
		return sqlSession.selectOne("com.spring.funding.persistence.FundingDAO.fundingHost");
	}
	
	// 1대1 게시글 갯수 구하기
	@Override
	public int getArticleCnt() {
		return sqlSession.selectOne("com.spring.funding.persistence.FundingDAO.getArtcleCnt");
	}
	
	// 1대1 게시글 목록 조회
	@Override
	public List<FundInquiryVO> getArticleList(Map<String, Object> map) {
		return sqlSession.selectList("com.spring.funding.persistence.FundingDAO.getArticleList", map);
	}

	// 1대1 게시글 조회수 증가
	@Override
	public int addReadCnt(int num) {
		return sqlSession.update("com.spring.funding.persistence.FundingDAO.addReadCnt", num);
	}

	// 1대1 게시글 상세페이지
	@Override
	public FundInquiryVO getArticle(int num) {
		return sqlSession.selectOne("com.spring.funding.persistence.FundingDAO.getArticle", num);
	}
	
	// 글쓰기
	@Override
	public int insertBoard(FundInquiryVO vo) {
		return sqlSession.insert("com.spring.funding.persistence.FundingDAO.insertBoard", vo);
	}
	
	// 글수정
	@Override
	public int updateBoard(FundInquiryVO vo) {
		return sqlSession.update("com.spring.funding.persistence.FundingDAO.updateBoard", vo);
	}
	
	// 글삭제(부모)
	@Override
	public int deleteBoard(int num) {
		return sqlSession.delete("com.spring.funding.persistence.FundingDAO.deleteBoard", num);
	}
	
	@Override
	public int insertBoardComment(FundInquiryVO vo) {
		return sqlSession.insert("com.spring.funding.persistence.FundingDAO.insertBoardComment", vo);
	}
	
	@Override
	public List<FundInquiryVO> boardCommentList(Map<String, Object> map) {
		return sqlSession.selectList("com.spring.funding.persistence.FundingDAO.boardCommentList", map);
	}
	
	@Override
	public int updateBoardComment(String username) {
		return sqlSession.update("com.spring.funding.persistence.FundingDAO.updateBoardComment", username);
	}
	
	@Override
	public int updateBoardCount(String username) {
		return sqlSession.update("com.spring.funding.persistence.FundingDAO.updateBoardCount", username);
	}
	
	@Override
	public int minusBoardCount(String username) {
		return sqlSession.update("com.spring.funding.persistence.FundingDAO.minusBoardCount", username);
	}
	
	@Override
	public int inquiryComment(int num) {
		return sqlSession.selectOne("com.spring.funding.persistence.FundingDAO.inquiryComment", num);
	}
	
	@Override
	public int minusBoardComment(String username) {
		return sqlSession.update("com.spring.funding.persistence.FundingDAO.minusBoardComment", username);
	}
	
	@Override
	public int updateReply_cnt(int num) {
		return sqlSession.update("com.spring.funding.persistence.FundingDAO.updateReply_cnt", num);
	}
	
	//김일광 종료
	
	//스마트 컨트랙트
	@Override
	public int createContract(String fundcode, String contractAddress, String username) {
		Map<String, String> map = new HashMap<>();
		map.put("fundcode", fundcode);
		map.put("contractAddress", contractAddress);
		map.put("username", username);
		int result = 0;
		
		result = sqlSession.insert("com.spring.funding.persistence.FundingDAO.insertFundList",map);
		if(result == 1) {
			result = sqlSession.insert("com.spring.funding.persistence.FundingDAO.createContract", map); 
		}
		return result;
	}
	
	//컨트랙트 로드
	@Override
	public ContractVO getContract(String fundcode) {
		return sqlSession.selectOne("com.spring.funding.persistence.FundingDAO.getContract", fundcode);
	}
	
	//컨트랙트 콜 후 디비 수정
	@Override
	public int plusContractIndex(String fundcode) {
		return sqlSession.update("com.spring.funding.persistence.FundingDAO.plusContractIndex", fundcode);
	}
	
	//트랜잭션 내용 추가
	@Override
	public int createTransaction(Map<String, Object> map) {
		return sqlSession.insert("com.spring.funding.persistence.FundingDAO.createTransaction", map);
	}

	//계좌정보가져오기
	@Override
	public AccountVO accountInfo(String username) {
		return sqlSession.selectOne("com.spring.funding.persistence.FundingDAO.accountInfo",username);
	}

	@Override
	public int insertUser(Map<String, String> map) {
		return sqlSession.insert("com.spring.funding.persistence.FundingDAO.insertUser", map);
	}
	
	@Override
	public int startupCount() {
		return sqlSession.selectOne("com.spring.funding.persistence.FundingDAO.startupCount");
	}

	@Override
	public int cultureCount() {
		return sqlSession.selectOne("com.spring.funding.persistence.FundingDAO.cultureCount");
	}
	
	// 펀드 리스트 수  구하기 ============== 아진 추가 2019.09.17 ================
    @Override
    public List<funding_stock_info_allVO> allfundList() {
       return sqlSession.selectList("com.spring.funding.persistence.FundingDAO.allfundList");
    }
    
    @Override
	public List<FundingVO> memberList(Map<String, Object> map) {
		List<FundingVO> dtos = null;
		FundingDAO dao = sqlSession.getMapper(FundingDAO.class);
		dtos = dao.memberList(map);	
		return dtos;
	}

	@Override
	public int updateAccount(Map<String, Object> map) {
		sqlSession.update("com.spring.funding.persistence.FundingDAO.updateAccount", map);
		return sqlSession.update("com.spring.funding.persistence.FundingDAO.updateAccount", map);
	}

	@Override
	public List<FundingTransactionVO> getMyOwnTransaction(String username) {
		return sqlSession.selectList("com.spring.funding.persistence.FundingDAO.getMyOwnTransaction", username);
	}

	@Override
	public int updateHostAccount(Map<String, Object> map) {
		return sqlSession.update("com.spring.funding.persistence.FundingDAO.updateHostAccount", map);
	}
	
	@Override
	public int applicationFund(Fund_reserveVO vo) {
		return sqlSession.insert("com.spring.funding.persistence.FundingDAO.applicationFund", vo);
	}
	
	@Override
	public List<FundingTransactionVO> getFundTransaction(int fund_id) {
		String fund_id2 = Integer.toString(fund_id); 
		return sqlSession.selectList("com.spring.funding.persistence.FundingDAO.getFundTransaction", fund_id2);
	}

	// ============== 계좌생성 -  아진 추가 2019.09.17 ================
	@Override
	public int createAccount(Map<String, Object> map) {
		return sqlSession.insert("com.spring.funding.persistence.FundingDAO.createAccount", map);
	}
	
	@Override
	public int requestFundCount() {
		return sqlSession.selectOne("com.spring.funding.persistence.FundingDAO.requestFundCount");
	}

	@Override
	public List<Fund_reserveVO> requestFundList(Map<String, Object> map) {
		List<Fund_reserveVO> dtos = null;
		FundingDAO dao = sqlSession.getMapper(FundingDAO.class);
		dtos = dao.requestFundList(map);	
		return dtos;
	}
	
	@Override
	public Fund_reserveVO confirmFund(int reserve_id) {
		return sqlSession.selectOne("com.spring.funding.persistence.FundingDAO.confirmFund", reserve_id);
	}

	@Override
	public int completeConfirm(int reserve_id) {
		return sqlSession.update("com.spring.funding.persistence.FundingDAO.completeConfirm", reserve_id);
	}
	
	
    
}