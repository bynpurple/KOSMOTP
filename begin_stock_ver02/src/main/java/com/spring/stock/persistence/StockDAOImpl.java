package com.spring.stock.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.stock.vo.StockRecodeVO;
import com.spring.stock.vo.StockVO;
import com.spring.stock.vo.Stock_StockVO;
import com.spring.stock.vo.StockstockVO;

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
	
	//각 종목마다의 리스트 추가
	@Override
	public Map<String, List<Stock_StockVO>> getThemeMap(List<String> themeList) {
		// TODO Auto-generated method stub
		return null;
	}
	
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
}
