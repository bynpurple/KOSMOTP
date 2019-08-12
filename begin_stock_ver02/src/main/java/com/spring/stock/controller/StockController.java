package com.spring.stock.controller;

import java.io.IOException;
import java.nio.file.AccessDeniedException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.WebAttributes;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.stock.persistence.StockDAO;
import com.spring.stock.service.StockService;
import com.spring.stock.vo.NewsVO;
import com.spring.stock.vo.StockstockVO;

@Controller
public class StockController {
	
	private static final Logger logger = LoggerFactory.getLogger(StockController.class);
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder; // 비밀번호 암호와 객체
	
	@Autowired
	private StockService service;
	
	@Autowired
	private StockDAO dao;
	
	// HomeController.java는 주석처리할것
	@RequestMapping("/")
	public String home(Model model) {
		
		logger.info("경로 : home");
		
		return "stock/trading";
	}
	
	// 로그인 페이지로 이동
	@RequestMapping("/user/login")
	public String login() {
		logger.info("경로 : login");
		
		return "user/login";
	}
	
	// 회원가입 페이지로 이동
	@RequestMapping("/user/join")
	public String join() {
		logger.info("경로 : join");
		
		return "user/join";
	}
	
	// 회원가입 페이지로 이동 예시
		@RequestMapping("/join2")
		public String join2() {
			logger.info("경로 : join2");
			
			return "user/register";
		}
	
	// 권한이 없는 사용자에게 안내 페이지 출력 - 403에러
	@RequestMapping("/user/denied")
	public String denied(HttpServletRequest req, Model model,Authentication auto) {
		logger.info("경로 : denied");
		AccessDeniedException ade = (AccessDeniedException)req.getAttribute(WebAttributes.ACCESS_DENIED_403);
		
		model.addAttribute("errMsg", ade);
		return "user/denied";
	}
	
	// 마이 페이지로 이동
	@RequestMapping("/user/mypage")
	public String mypage() {
		logger.info("경로 : mypage");
		return "user/mypage2";
	}
	
	// 추가분 - 회원정보보기 - 회원정보 변경 2019.08.12
	@RequestMapping("/user/modify")
	public String modify(HttpServletRequest req, Model model) { 
	  logger.info("경로 : modify"); 
	  service.modifyView(req, model);
  
	  return "user/userInfoModify"; 
	}
	 
	// 추가분 - 회원정보 수정 2019.08.12
	@RequestMapping("/user/modifyPro") 
	public String modifyPro(HttpServletRequest req, Model model) { 
	  logger.info("경로 : modifyPro"); 
	  service.c_modifyView(req, model);
	  
	  return "user/modifyPro"; 
	}
	
	// 추가분 - 회원 탈퇴 처리 2019.08.12
	@RequestMapping("/user/c_deletePro") 
	public String c_deletePro(HttpServletRequest req, Model model, HttpServletResponse res) { 
	  logger.info("경로 : c_deletePro"); 
	  service.c_deletePro(req, model, res);
	  
	  return "user/deletePro"; 
	}
	
	// 관리자 페이지로 이동
	@RequestMapping("/admin/")
	public String admin() {
		logger.info("경로 : admin");
		
		return "admin/main";
	}
	
	// ID 중복확인
	@RequestMapping("/user/confirmId")
	public String confiemId(HttpServletRequest req, Model model) {
		logger.info("경로 : confirmId");
		service.confirnId(req, model);
		return "user/confirmId";
	}
	
	// HP 중복확인
	@RequestMapping("/user/confirmHp")
	public String confirmHp(HttpServletRequest req, Model model) throws Exception {
		logger.info("경로 : confirmHp");
		service.comfirnHP(req, model);
		return "user/confirmHp";
	}
	
	// 이용약관 보기
	@RequestMapping("/user/confirmTerms")
	public String confirmTerms(HttpServletRequest req, Model model) {
		logger.info("경로 : confirmTerms");
		return "user/confirmTerms";
	}
	
	// 핸드폰 번호 인증
	@RequestMapping("/user/auth")
	public String auth(HttpServletRequest req, Model model) {
		service.checkAuth(req, model);
		return "user/auth";
	}
	
	// 회원가입처리
	@RequestMapping("/user/insertUser")
	public String insertUser(@RequestParam(value="username", required = false) String username, 
			@RequestParam(value="password",required = false) String password,
			@RequestParam String name,
			@RequestParam(value="authority", required = false) String authority, 
			@RequestParam String hp) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("username", username);
		System.out.println("암호화 전의 비밀번호 :" + password);
		// 비밀번호 암호화
		String encryptPassword = passwordEncoder.encode(password);
		System.out.println("암호화 후의 비밀번호 :" + encryptPassword);
		map.put("password", encryptPassword);
		map.put("name", name);
		map.put("authority", authority);
		map.put("hp", hp);
		dao.insertUser(map);
		return "user/login";
	}
	
	// 회원정보 찾기
	@RequestMapping("/user/findInfo")
	public String findInfo(HttpServletRequest req, Model model) {
		
		return "user/findInfo";
	}
	
	// 계정 정보 찾기
	@RequestMapping("/user/findId")
	public String findId(HttpServletRequest req, Model model) {
		return "user/findId";
	}
	
	//비밀번호 찾기_1
	@RequestMapping("/user/findPwd")
	public String findPwd(HttpServletRequest req, Model model) {
		return "user/findPwd";
	}
	
	// 비밀번호 찾기_2
	@RequestMapping("/user/findPwdCon")
	public String findPwdCon(HttpServletRequest req, Model model) throws Exception {
		service.idNameHpCheck(req, model);
		return "user/findPwdCon";
	}
	
	// 비밀번호 찾기_3
	@RequestMapping("/user/findPwdChk")
	public String findPwdChk(HttpServletRequest req, Model model) {
		service.insertPwd(req, model);
		return "user/findPwdChk";
	}
		
	
	// 로그아웃 처리
	@RequestMapping("/user/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}
	
	// 트레이딩 - 즉시 거래
	@RequestMapping("/user/trading")
	public String trading(HttpSession session, HttpServletRequest req, Model model) throws IOException {
		session.invalidate();
		service.upDownRate(req, model);
		service.search(req, model);
		return "stock/trading";
	}
	
	// 예약 주문
	@RequestMapping("/user/stockBooking")
	public String stockBooking(HttpSession session, HttpServletRequest req, Model model) {
		session.invalidate();
		service.buySellBook(req, model);
		service.upDownRate(req, model);
		
		return "stock/stockBooking";
	}
	
	// 회사 코드 및 명 AJAX DB연결 페이지
	@RequestMapping("/user/search_sub")
	public String search_sub(HttpSession session, HttpServletRequest req, Model model) {
		session.invalidate();
		service.searchList(req, model);
		return "stock/search_sub";
	}
			
	// 코드 선택 시 호가창 출력
	@RequestMapping("/user/asking_stock")
	public String asking_stock(HttpSession session, HttpServletRequest req, Model model) {
		session.invalidate();
		
		service.asking_stock(req, model);
		return "stock/asking_stock";
	}
	
	// 예약 주문 시 코드 선택 하면 정보 출력
	@RequestMapping("/user/inf_stock")
	public String inf_stock(HttpSession session, HttpServletRequest req, Model model) {
		session.invalidate();
		
		service.asking_stock(req, model);
		return "stock/inf_stock";
	}
	
	// 즉시구매
	@RequestMapping("/user/buyOrder")
	public String buyOrder(HttpSession session, HttpServletRequest req, Model model) {
		session.invalidate();
		
		return "stock/buyOrder";
	}
	
	@RequestMapping("/user/searchCode")
	public String searchCode(HttpSession session) {
		session.invalidate();
		
		return "stock/searchCode";
	}
	
	@RequestMapping("/user/test")
	public String test(HttpSession session) {
		session.invalidate();
		
		return "stock/test";
	}
	
	//뉴스크롤링 
	@RequestMapping("/user/news")
	public String crawling(HttpServletRequest req, Model model) throws Exception {

		String url ="https://news.naver.com/main/list.nhn?mode=LS2D&mid=shm&sid1=101&sid2=258";
		
		org.jsoup.nodes.Document doc = Jsoup.connect(url).get();
		
		Elements element = doc.select("div.content");
		String subject = element.select("h3").text();
		
		System.out.println(subject);
		System.out.println("===================");
		
		// 큰바구니 선언  
		List<NewsVO> newsList = new ArrayList<NewsVO>();
		NewsVO vo = null;
		 
		int lisize = element.select("li").size();
		System.out.println("기사숫자~~~ " + lisize);
		
		for(Element el : element.select("li")) {
			
			vo = new NewsVO();

			Elements aa= el.select("dt").select("a");
			String link = aa.attr("href");
			String photo = aa.select("img").attr("src");
			String title = aa.text();
			Elements dd = el.select("dd");
			String lede = dd.select("span").select(".lede").text(); 
			String write = dd.select("span").select(".writing").text(); 
			String date = dd.select("span").select(".date.is_new").text(); 
			
			if(photo != "") { 
				vo.setPhoto(photo);
			}else {
				String p_root = "/stock/resources/no_detail_img.gif";
				vo.setPhoto(p_root);}
			
			vo.setLink(link);
			vo.setTitle(title);
			vo.setLede(lede); 
			
			vo.setWriter(write);
			vo.setDate(date);
			
			newsList.add(vo); 
		} 
		
		model.addAttribute("newsList", newsList); 
		return "stock/news";
	}
	
	
	// 관심종목  리스트
	@RequestMapping("/user/interestedItems")
	public String interestedItems(HttpServletRequest req, Model model) {
		logger.info("경로 : interestedItems");
		
		// 서비스 호출 
		service.interestedItemsList(req, model);
		
		return "stock/interestdItems";
	}
	
	// 관심종목 추가
	@RequestMapping("/user/insertInterest")
	public String insertInterest(HttpServletRequest req, Model model) {
		logger.info("경로 : insertInterest");
		service.insertInterest(req, model);
		
		return "stock/insertInterest";
	}
	
		
		
	// 관심종목  - 선택기업(자바스크립트타고 넘어옴/ ajax리턴) 
	@RequestMapping("/user/selectCompany")
	public @ResponseBody Map<String, Object> selectCompany(HttpServletRequest req, Model model) {
		logger.info("경로 : selectCompany");
		
		String name = req.getParameter("c_name"); 
		System.out.println("이름 값 확인!~~~~~~!!" + name);
		
		Map<String,Object> map = new HashMap<String, Object>();
		StockstockVO company = new StockstockVO();
		// 서비스 호출 
		company = service.selectCompany(req, model);
		
		map.put("stockname", company.getStockname());	// 종목명
		map.put("stockcurrent", company.getStockcurrent());	// 현재가 
		map.put("stockvolume", company.getStockvolume());	//거래량
		map.put("totalstock", company.getTotalstock());	// 총 주식수
		
		return map;
	}
	
	// 기업 리스트
	@RequestMapping("/user/company")
	public String company(HttpServletRequest req, Model model) {
		logger.info("경로 : company");
		service.stockList(req, model);
		return "stock/company";
	}
	
	// 기업리스트 > 상세페이지(기업재무정보)
	@RequestMapping("/user/financialInfo")
	public String financialInfo(HttpServletRequest req, Model model) {
		logger.info("경로 : financialInfo");
		service.chart(req, model);
		
		return "stock/financialInfo";
	}
	
	
	//종목 분석
	@RequestMapping("/user/detailtheme")
	public String detailtheme(HttpServletRequest req, Model model) {
		logger.info("경로 : detailtheme");
		
		return "stock/analyze_theme";
	}
	
	//재무 정보
	@RequestMapping("/user/detailStock")
	public String detailStock(HttpServletRequest req, Model model) {
		logger.info("경로 : detailStock");
		
		return "stock/detail_stock";
	}
	
	//종목선택
	@RequestMapping("/user/choicetheme")
	public String choicetheme(HttpServletRequest req, Model model) {
		logger.info("경로 : choicetheme");
		service.gettop5stock(req ,model);
		
		return "stock/choicetheme";
	}
}
