package com.spring.stock.persistence;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

@Repository
public class StockDAOImpl implements StockDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertUser(Map<String, String> map) {
		return sqlSession.insert("com.spring.stock.persistence.StockDAO.insertUser", map);
	}

	@Override
	public Map<String, Object> selectUser(String username) {
		return sqlSession.selectOne("com.spring.stock.persistence.StockDAO.selectUser", username);
	}

	@Override
	public int idCheck(String username) {
		return sqlSession.selectOne("com.spring.stock.persistence.StockDAO.idCheck", username);
	}

	@Override
	public int hpCheck(String hp) {
		return sqlSession.selectOne("com.spring.stock.persistence.StockDAO.hpCheck", hp);
	}

	@Override
	public int insertAuth(Map<String, Object> map) {
		return sqlSession.insert("com.spring.stock.persistence.StockDAO.insertAuth", map);
	}

	@Override
	public int authCheck(Map<String, Object> map) {
		return sqlSession.selectOne("com.spring.stock.persistence.StockDAO.authCheck", map);
	}

	@Override
	public List<StockRecodeVO> stockTickerYesterday() {
		return sqlSession.selectList("com.spring.stock.persistence.StockDAO.stockTickerYesterday");
	}

	@Override
	public List<StockRecodeVO> stockTickerToday() {
		return sqlSession.selectList("com.spring.stock.persistence.StockDAO.stockTickerToday");
	}

	@Override
	public List<StockRecodeVO> searchList(String keyword) {
		return sqlSession.selectList("com.spring.stock.persistence.StockDAO.searchList",keyword);
	}
	
	
	// 관심종목 갯수구하기
	@Override
	public int getItemCnt(Map<String, Object> map) {
		return sqlSession.selectOne("com.spring.stock.persistence.StockDAO.getItemCnt", map);
	}

	// 관심종목 리스트 뿌리기 
	@Override
	public List<StockstockVO> getItemList(Map<String, Object> map) {
		return sqlSession.selectList("com.spring.stock.persistence.StockDAO.getItemList", map);
	}

	// 선택기업 확인 
	@Override
	public StockstockVO selectCompany(Map<String, Object> map) {
		return sqlSession.selectOne("com.spring.stock.persistence.StockDAO.selectCompany", map);
	}
	
	//=================================================

	@Override
	public List<Map<String, Object>> chart(String stockcode) {
		return sqlSession.selectList("com.spring.stock.persistence.StockDAO.chart",stockcode);
	}

	@Override
	public List<StockstockVO> stockList() {
		return sqlSession.selectList("com.spring.stock.persistence.StockDAO.stockList");
	}

	@Override
	public List<Stock_StockVO> buyBook() {
		return sqlSession.selectList("com.spring.stock.persistence.StockDAO.buyBook");	//String id 추가 필요
	}
	
	@Override
	public List<Stock_StockVO> sellBook() {
		return sqlSession.selectList("com.spring.stock.persistence.StockDAO.sellBook"); //String id 추가 필요
	}

	@Override
	public Stock_StockVO asking_stock(String CompanyCode) {
		return sqlSession.selectOne("com.spring.stock.persistence.StockDAO.asking_stock", CompanyCode);
	}
	
	// 관심종목 삭제
	@Override
	public int deleteItem(Map<String, Object> map) {
		return sqlSession.delete("com.spring.stock.persistence.StockDAO.deleteItem", map);
	}
	
	//상단 5개 종목명 리스트
	@Override
	public List<Stock_StockVO> getTopList() {
		return sqlSession.selectList("com.spring.stock.persistence.StockDAO.getTopList");
	}
	
	//현재 존재하는 종목명
	@Override
	public List<String> getThemeList() {
		return sqlSession.selectList("com.spring.stock.persistence.StockDAO.getThemeList");	
	}
	//13일 추가
	//각 종목마다의 리스트 추가
	@Override
	public List<Stock_StockVO> getThemeMap(String theme) {
		List<Stock_StockVO> svo = new ArrayList<Stock_StockVO>();
		svo.add(sqlSession.selectOne("com.spring.stock.persistence.StockDAO.getHighestPriceStock", theme));
		svo.add(sqlSession.selectOne("com.spring.stock.persistence.StockDAO.getHighestVolumeStock", theme));
		svo.add(sqlSession.selectOne("com.spring.stock.persistence.StockDAO.getHighestGapStock", theme));
		return svo;
	}
	
	@Override
	public StockThemeVO getpreviewTheme(String theme) {
		StockThemeVO svo = new StockThemeVO();
		
		svo.setAvg_gap(sqlSession.selectOne("com.spring.stock.persistence.StockDAO.getAvgGap", theme));
		svo.setTotal_gap_count(sqlSession.selectOne("com.spring.stock.persistence.StockDAO.getTotalGapCount", theme));
		svo.setUpper_gap_count(sqlSession.selectOne("com.spring.stock.persistence.StockDAO.getUpperGapCount", theme));
		svo.setLower_gap_count(sqlSession.selectOne("com.spring.stock.persistence.StockDAO.getLowerGapCount", theme));
		
		return svo;
	}
	
	@Override
	public int sendMessage(MessageVO mvo) {
		return sqlSession.insert("com.spring.stock.persistence.StockDAO.sendMessage", mvo);
	}
	
	//13일 종료
	@Override
	public int modifyPwd(Map<String, String>map) {
		return sqlSession.update("com.spring.stock.persistence.StockDAO.modifyPwd", map);
	}
	
	@Override
	public int idHpChk(Map<String, Object> map) {
		return sqlSession.selectOne("com.spring.stock.persistence.StockDAO.idHpChk", map);
	}
	
	@Override
	public int checkInterest(Map<String, Object> map) {
		return sqlSession.selectOne("com.spring.stock.persistence.StockDAO.checkInterest", map);
	}
	
	@Override
	public List<StockRecodeVO> financialInfo(String stockcode) {
		return sqlSession.selectList("com.spring.stock.persistence.StockDAO.financialInfo", stockcode);
	}
	
	@Override
	public int insertInterest(Map<String, Object> map) {
		return sqlSession.insert("com.spring.stock.persistence.StockDAO.insertInterest",map);
		
	}
	
	@Override
	public StockstockVO StockInfo(String stockcode) {
		return sqlSession.selectOne("com.spring.stock.persistence.StockDAO.StockInfo",stockcode);
	}
	
	// 로그인 정보확인 
	@Override
	public String getPwd(Map<String, Object> map) {
		return sqlSession.selectOne("com.spring.stock.persistence.StockDAO.getPwd", map);
	}

	// 회원정보 가져오기 
	@Override
	public StockVO getMemberInfo(String strId) {
		return sqlSession.selectOne("com.spring.stock.persistence.StockDAO.getMemberInfo", strId);
	}

	// 회원정보 수정 
	@Override
	public int updateMember(StockVO vo) {
		return sqlSession.update("com.spring.stock.persistence.StockDAO.updateMember", vo);
	}

	// 회원정보 삭제
	@Override
	public int deleteMember(String strId) {
		return sqlSession.delete("com.spring.stock.persistence.StockDAO.deleteMember", strId);
	}
	
	@Override
	public List<Stock_StockVO> getdetailTheme(String theme) {
		return sqlSession.selectList("com.spring.stock.persistence.StockDAO.getDetailTheme", theme);
	}
	
	@Override
	public List<MessageVO> getReceivedMessage(String username) {
		return sqlSession.selectList("com.spring.stock.persistence.StockDAO.getReceivedMessage", username);
	}
	
	@Override
	public List<MessageVO> getSentMessage(String username) {
		return sqlSession.selectList("com.spring.stock.persistence.StockDAO.getSentMessage", username);
	}
	
	@Override
	public MessageVO getDetailMessage(int message_id) {
		return sqlSession.selectOne("com.spring.stock.persistence.StockDAO.getDetailMessage", message_id);
	}
	
	@Override
	public void setReadable(MessageVO mvo) {
		sqlSession.update("com.spring.stock.persistence.StockDAO.setReadable", mvo);
	}
	
	@Override
	public List<MessageVO> getDeletedMessage(String username) {
		return sqlSession.selectList("com.spring.stock.persistence.StockDAO.getDeletedMessage", username);
	}
	
	@Override
	public int setNewable(List message_ids) {
		int result = 0;
		
		for(int i = 0; i < message_ids.size(); i++) {
			int message_id = (int) message_ids.get(i);
			sqlSession.update("com.spring.stock.persistence.StockDAO.setNewable", message_id);
			result++;
			
		}
		System.out.println(result);
		return result;
	}
	
	@Override
	public int recoveryNewable(List message_ids) {
		int result = 0;
		
		for(int i = 0; i < message_ids.size(); i++) {
			int message_id = (int) message_ids.get(i);
			sqlSession.update("com.spring.stock.persistence.StockDAO.recoveryNewable", message_id);
			result++;
			
		}
		System.out.println(result);
		return result;
	}
	
	@Override
	public List<String> getEntireUsernames() {
		return sqlSession.selectList("com.spring.stock.persistence.StockDAO.getEntireUsernames");
	}
	
	@Override
	public int sendEntireMessage(List<MessageVO> mvo) {
		Map<String, List<MessageVO>> map = new HashMap();
		map.put("mvo", mvo);
		System.out.println(mvo.size());
		return sqlSession.insert("com.spring.stock.persistence.StockDAO.sendEntireMessage", map);
	}
	
	@Override
	public List<StockRecodeVO> getStockRecord(String stocktheme) {
		return sqlSession.selectList("com.spring.stock.persistence.StockDAO.getStockRecord", stocktheme);
	}
	
	@Override
	public List<Map<String,Object>> selectCompanyChart(String stockcode) {
		return sqlSession.selectList("com.spring.stock.persistence.StockDAO.selectCompanyChart", stockcode);
	}
	
	// 관심종목 - 250 기준 (2019-08-14 추가분 -아진) 
	@Override
	public StockRecodeVO selectAvg(String stockcode) {
		return sqlSession.selectOne("com.spring.stock.persistence.StockDAO.selectAvg", stockcode);
	}
	
	//나의 해당 주식 거래 완료 내역 조회
	@Override
	public List<completedVO> completedStock(Map<String, Object> map) {
		return sqlSession.selectList("com.spring.stock.persistence.StockDAO.completedStock",map);
	}
	//나의 보유 주식 조회
	@Override
	public List<completedVO> MyStock(String username) {
		return sqlSession.selectList("com.spring.stock.persistence.StockDAO.MyStock",username);
	}
	
    //이체화면 클릭 시 계좌정보 조회
	@Override
	public AccountVO accountInfo(String username) {
		return sqlSession.selectOne("com.spring.stock.persistence.StockDAO.accountInfo",username);
	}
	//계좌 금액 조회
	@Override
	public AccountVO accountSearch(Map<String, Object> map) {
		return sqlSession.selectOne("com.spring.stock.persistence.StockDAO.accountSearch",map);
	}
	//계좌 존재 여부 조회
	@Override
	public int accountChk(Map<String, Object> map) {
		return sqlSession.selectOne("com.spring.stock.persistence.StockDAO.accountChk",map);
	}
	
	//이체 완료
	@Override
	public int transferMoney(Map<String, Object> map) {
		return sqlSession.insert("com.spring.stock.persistence.StockDAO.transferMoney", map);
	}
	//이체 시 금액 차감
	@Override
	public void minusMoney(Map<String, Object> map) {
		sqlSession.update("com.spring.stock.persistence.StockDAO.minusMoney",map);
	}
	//이체 정보 리스트
	@Override
	public List<TransferVO> transfInfo(String withdraw) {
		return sqlSession.selectList("com.spring.stock.persistence.StockDAO.transfInfo",withdraw);
	}
	//이체 정보 날짜 조회
	@Override
	public List<TransferVO> dateTranseInf(Map<String, Object> map) {
		return sqlSession.selectList("com.spring.stock.persistence.StockDAO.dateTranseInf",map);
	}
	@Override
	public int getNoticeCnt() {
		return sqlSession.selectOne("com.spring.stock.persistence.StockDAO.getNoticeCnt");
	}

	@Override
	public List<StockVO> getNoticeList(Map<String, Object> map) {
		List<StockVO> dtos = null;
		StockDAO dao = sqlSession.getMapper(StockDAO.class);
		dtos = dao.getNoticeList(map);	
		return dtos;
	}

	@Override
	public int insertNotice(StockVO vo) {
		return sqlSession.insert("com.spring.stock.persistence.StockDAO.insertNotice", vo);
	}

	@Override
	public int addNoticeReadCnt(int nonum) {
		return sqlSession.update("com.spring.stock.persistence.StockDAO.addNoticeReadCnt", nonum);
	}

	@Override
	public StockVO getNotice(int nonum) {
		return sqlSession.selectOne("com.spring.stock.persistence.StockDAO.getNotice", nonum);
	}

	@Override
	public int userCount() {
		return sqlSession.selectOne("com.spring.stock.persistence.StockDAO.userCount");
	}

	@Override
	public StockVO getHostInfo(String username) {
		return sqlSession.selectOne("com.spring.stock.persistence.StockDAO.getHostInfo", username);
	}

	@Override
	public List<StockVO> getUserList(Map<String, Object> map) {
		List<StockVO> dtos = null;
		StockDAO dao = sqlSession.getMapper(StockDAO.class);
		dtos = dao.getUserList(map);	
		return dtos;
	}
	
	//매수 목록 갯수 구하기
	@Override
	public int getArticleCnt(String username) {
		return sqlSession.selectOne("com.spring.stock.persistence.StockDAO.getArticleCnt", username);
	}

	//매수 목록 구하기
	@Override
	public List<Stock_completedVO> getArticleList2(Map<String, Object> map) {
		List<Stock_completedVO> list = null;
		StockDAO dao = sqlSession.getMapper(StockDAO.class);
		list = dao.getArticleList2(map);
		return list;
	}

	//매도 목록 갯수
	@Override
	public int getArticleCnt1(String username) {
		return sqlSession.selectOne("com.spring.stock.persistence.StockDAO.getArticleCnt1", username);
	}

	//매도 목록
	@Override
	public List<Stock_completedVO> getArticleList1(Map<String, Object> map1) {
		List<Stock_completedVO> list1 = null;
		StockDAO dao = sqlSession.getMapper(StockDAO.class);
		list1 = dao.getArticleList1(map1);
		return list1;
	}

	@Override
	public int getArticleCnt2(String username) {
		return sqlSession.selectOne("com.spring.stock.persistence.StockDAO.getArticleCnt2", username);
	}

	@Override
	public List<Stock_transferVO> getArticleList(Map<String, Object> map2) {
		List<Stock_transferVO> list2 = null;
		StockDAO dao = sqlSession.getMapper(StockDAO.class);
		list2 = dao.getArticleList(map2);
		return list2;
	}

	@Override
	public int getArticleCnt3(String username) {
		return sqlSession.selectOne("com.spring.stock.persistence.StockDAO.getArticleCnt3", username);
	}

	@Override
	public List<Stock_transferVO> getArticleList3(Map<String, Object> map3) {
		List<Stock_transferVO> list3 = null;
		StockDAO dao = sqlSession.getMapper(StockDAO.class);
		list3 = dao.getArticleList3(map3);
		return list3;
	}
	
	// 1대1 게시글 갯수 구하기
	@Override
	public int getArtcleCnt4() {
		return sqlSession.selectOne("com.spring.stock.persistence.StockDAO.getArtcleCnt4");
	}
	// 1대1 게시글 목록 조회
	@Override
	public List<userInquiryVO> getArticleList4(Map<String, Object> map) {
		return sqlSession.selectList("com.spring.stock.persistence.StockDAO.getArticleList4", map);
	}

	// 1대1 게시글 조회수 증가
	@Override
	public int addReadCnt(int num) {
		return sqlSession.update("com.spring.stock.persistence.StockDAO.addReadCnt", num);
	}
	
	// 1대1 게시글 상세페이지
	@Override
	public userInquiryVO getArticle(int num) {
		return sqlSession.selectOne("com.spring.stock.persistence.StockDAO.getArticle", num); 
	}
	
	// 글쓰기
	@Override
	public int insertBoard(userInquiryVO vo) {
		return sqlSession.insert("com.spring.stock.persistence.StockDAO.insertBoard", vo);
	}
	
	// 글수정
	@Override
	public int updateBoard(userInquiryVO vo) {
		return sqlSession.update("com.spring.stock.persistence.StockDAO.updateBoard", vo);
	}

	@Override
	public int deleteBoard(int num) {
		return sqlSession.delete("com.spring.stock.persistence.StockDAO.deleteBoard", num);
	}

	@Override
	public List<StockstockVO> stocklistsearch(String stockname) {
		return sqlSession.selectList("com.spring.stock.persistence.StockDAO.stocklistsearch",stockname);
	}
	
	@Override
	public List<Map<String, Object>> tradingchart(String stockcode) {
		return sqlSession.selectList("com.spring.stock.persistence.StockDAO.tradingchart",stockcode);
	}
}
