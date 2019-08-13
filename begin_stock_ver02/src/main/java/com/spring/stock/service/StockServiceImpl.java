package com.spring.stock.service;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.ui.Model;

import com.spring.stock.persistence.StockDAO;
import com.spring.stock.vo.AccountVO;
import com.spring.stock.vo.MessageVO;
import com.spring.stock.vo.SearchVO;
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
import com.squareup.okhttp.MediaType;
import com.squareup.okhttp.OkHttpClient;
import com.squareup.okhttp.Request;
import com.squareup.okhttp.RequestBody;
import com.squareup.okhttp.Response;

@Service
public class StockServiceImpl implements StockService {

	@Autowired
	StockDAO dao;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	Map<String, Object> map = new HashMap<>();
	
	@Override
	public void confirnId(HttpServletRequest req, Model model) {
		String username = req.getParameter("username");
		int cnt = dao.idCheck(username);
		model.addAttribute("selectCnt", cnt);
		model.addAttribute("username", username);
	}

	@Override
	public void comfirnHP(HttpServletRequest req, Model model) throws Exception {
		String hp = req.getParameter("hp");
		int cnt = dao.hpCheck(hp);

		//등록된 회원인지를 확인 후 문자 전송
		if(cnt == 0) {
			//인증번호테이블에 들어갈 MAP
			Map<String, Object> map = new HashMap<>();
			//인증번호
			Random rand = new Random();
	        String numStr = ""; //난수가 저장될 변수

	        for(int i=0;i<6;i++) {
	            //0~9 까지 난수 생성
	            String ran = Integer.toString(rand.nextInt(10));
	            numStr += ran;
	        }

	        //문자 전송
			OkHttpClient client = new OkHttpClient();
			String phonenumber = hp;
			String content = "[EZ-STOCK]회원가입 인증 번호는 " + numStr + "입니다. 3분안에 입력하시길 바랍니다.";
			
			map.put("hp", phonenumber);
	        map.put("numStr", numStr);
	        map.put("date", new Timestamp(System.currentTimeMillis()));

	        int cnt2 = dao.insertAuth(map);

			MediaType mediaType = MediaType.parse("application/json");
			RequestBody body = RequestBody.create(mediaType, "{\n    \"type\": \"sms\",\n    \"contentType\": \"COMM\",\n    \"countryCode\": \"82\",\n    \"from\": \"01033658389\",\n    \"to\": [\n        \"" + phonenumber +"\"\n    ],\n    \"subject\": \"제목입니다.\",\n    \"content\": \""+ content +"\"\n}");
			Request request = new Request.Builder()
			  .url("https://api-sens.ncloud.com/v1/sms/services/ncp%3Asms%3Akr%3A256598824881%3Akosmo50/messages")
			  .post(body)
			  .addHeader("Content-Type", "application/json")
			  .addHeader("x-ncp-auth-key", "rluyDmcMWeN5h8Oau6U1")
			  .addHeader("x-ncp-service-secret", "320df0af5bbb4353825450b4f4fc03ab")
			  .addHeader("User-Agent", "PostmanRuntime/7.15.2")
			  .addHeader("Accept", "*/*")
			  .addHeader("Cache-Control", "no-cache")
			  .addHeader("Postman-Token", "e7bdfa69-8070-4f61-a13c-501e677e7f97,50154054-ceb1-4bea-aa23-75efff8e8499")
			  .addHeader("Host", "api-sens.ncloud.com")
			  .addHeader("Accept-Encoding", "gzip, deflate")
			  .addHeader("Content-Length", "211")
			  .addHeader("Connection", "keep-alive")
			  .addHeader("cache-control", "no-cache")
			  .build();
			Response response = client.newCall(request).execute();
		}
		model.addAttribute("selectCnt", cnt);
		model.addAttribute("hp", hp);
	}

	@Override
	public void checkAuth(HttpServletRequest req, Model model) {
		Map<String, Object> map = new HashMap<>();
		map.put("hp", req.getParameter("hp"));
		map.put("numStr", req.getParameter("authnum"));
		map.put("date", new Timestamp(System.currentTimeMillis()));
		
		int cnt = dao.authCheck(map);
		
		model.addAttribute("result", cnt);
		
	}
	

	@Override
	public void idNameHpCheck(HttpServletRequest req, Model model) throws Exception {
		String hp = req.getParameter("hp");
		map.put("username", req.getParameter("username"));
		map.put("name", req.getParameter("name"));
		map.put("hp", hp);
		int selectCnt = dao.idHpChk(map);
		if (selectCnt == 1) {
			//인증번호
			Random rand = new Random();
	        String numStr = ""; //난수가 저장될 변수

	        for(int i=0;i<6;i++) {
	            //0~9 까지 난수 생성
	            String ran = Integer.toString(rand.nextInt(10));
	            numStr += ran;
	        }

	        //문자 전송
			OkHttpClient client = new OkHttpClient();
			String phonenumber = hp;
			String content = "[EZ-STOCK]패스워드 찾기 인증 번호는 " + numStr + "입니다. 3분안에 입력하시길 바랍니다.";
			
			map.put("hp", phonenumber);
	        map.put("numStr", numStr);
	        map.put("date", new Timestamp(System.currentTimeMillis()));

	        int cnt2 = dao.insertAuth(map);

			MediaType mediaType = MediaType.parse("application/json");
			RequestBody body = RequestBody.create(mediaType, "{\n    \"type\": \"sms\",\n    \"contentType\": \"COMM\",\n    \"countryCode\": \"82\",\n    \"from\": \"01033658389\",\n    \"to\": [\n        \"" + phonenumber +"\"\n    ],\n    \"subject\": \"제목입니다.\",\n    \"content\": \""+ content +"\"\n}");
			Request request = new Request.Builder()
			  .url("https://api-sens.ncloud.com/v1/sms/services/ncp%3Asms%3Akr%3A256598824881%3Akosmo50/messages")
			  .post(body)
			  .addHeader("Content-Type", "application/json")
			  .addHeader("x-ncp-auth-key", "rluyDmcMWeN5h8Oau6U1")
			  .addHeader("x-ncp-service-secret", "320df0af5bbb4353825450b4f4fc03ab")
			  .addHeader("User-Agent", "PostmanRuntime/7.15.2")
			  .addHeader("Accept", "*/*")
			  .addHeader("Cache-Control", "no-cache")
			  .addHeader("Postman-Token", "e7bdfa69-8070-4f61-a13c-501e677e7f97,50154054-ceb1-4bea-aa23-75efff8e8499")
			  .addHeader("Host", "api-sens.ncloud.com")
			  .addHeader("Accept-Encoding", "gzip, deflate")
			  .addHeader("Content-Length", "211")
			  .addHeader("Connection", "keep-alive")
			  .addHeader("cache-control", "no-cache")
			  .build();
			Response response = client.newCall(request).execute();
		}
		model.addAttribute("selectCnt", selectCnt);
		model.addAttribute("hp", hp);
	}
	
	@Override
	public void insertPwd(HttpServletRequest req, Model model) {
		StockVO vo = new StockVO();
		String username = req.getParameter("username");
		System.out.println("username : " + username);
		model.addAttribute("username", username);
		model.addAttribute("vo", vo);
	}
	
	@Override
	public void modifyPwd(HttpServletRequest req, Model model) {
		Map<String, String> map = new HashMap<String, String>();
		String username = req.getParameter("username");
		System.out.println("username : " + username);
		map.put("username", req.getParameter("username"));
		System.out.println("암호화 전의 비밀번호 :" + req.getParameter("password"));
		String encryptPassword = passwordEncoder.encode(req.getParameter("password"));
		System.out.println("암호화 후의 비밀번호 :" + encryptPassword);
		map.put("password", encryptPassword);
		int updateCnt = dao.modifyPwd(map);
		System.out.println("updateCnt : " + updateCnt);
		model.addAttribute("updateCnt", updateCnt);
	}

	//화면상단 회사 및 상승률 ticker
	@Override
	public void upDownRate(HttpServletRequest req, Model model) {
		List<StockRecodeVO> yesDate = dao.stockTickerYesterday();
		model.addAttribute("yesDate",yesDate);
	}

	
	@Override
	public void searchList(HttpServletRequest req, Model model) {
		String keyword = req.getParameter("keyword");
		
		List<StockRecodeVO> searchList = dao.searchList(keyword);
		model.addAttribute("searchList",searchList);
	}
	
	//아진
	@Override
	public void interestedItemsList(HttpServletRequest req, Model model) {
		
    	// 검색된 input 값 
    	String input =(req.getParameter("searchInput") == null) ? "" : req.getParameter("searchInput");
    	input = input.trim();	// 공백을 제거 
    	
        
    	System.out.println("input 값확인!~~~~~~ : " + input);
    	
        // 3단계. 화면으로부터 입력받은 값을 받아온다. 
        // 페이징 처리 
        int pageSize = 10;          // 한 페이지당 출력할 글 갯수 
        int pageBlock = 3;        // 한 블럭당 페이지 갯수 
        
        int cnt = 0;             // 글의 갯수 
        int start = 0;            // 현재페이지의 시작 페이지번호   ex) <1|2|3> 의 1 -> db파라미터로 넘겨줄값
        int end = 0;             // 현재페이지의 마지막 페이지번호  ex) <1|2|3> 의 3 -> db파라미터로 넘겨줄값
        int number = 0;            // 출력용 글번호  (보이는 , 중간글이 삭제되도 알아서 맞춰지게)
        String pageNum = "";     // 페이지 번호  ( 넘겨받을 )
        int currentPage = 0;    // 현재 페이지 
        
        int pageCount = 0;        // 페이지 갯수
        int startPage = 0;        // 시작 페이지 
        int endPage = 0;        // 마지막 페이지 
        
        // 아이디 갖고오기
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication(); 
		User user = (User) authentication.getPrincipal(); 
		String strId = user.getUsername();
        
        // 5-1단계. 글갯수 구하기 (검색값 가지고 간다.)
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("input", input);
        map.put("strId", strId);
        cnt = dao.getItemCnt(map);
        
        System.out.println("cnt : " + cnt);  // 먼저 테이블에 30건 insert 해둠 
        
        // 받을 예정 
        pageNum = req.getParameter("pageNum");
        
        if(pageNum == null) { pageNum = "1";} // 첫 페이지를 1로 지정
        
        // 현재페이지 출력 
        System.out.println("~~~~~~~~~~~~~~" + pageNum);
        currentPage = Integer.parseInt(pageNum);        // 현재페이지 : 1 / 계산을 위해서 안에서 pageNum을 int로 변환 
        System.out.println("currentPage : " + currentPage);
        
        pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1: 0);    // 삼항연산자 
        
        // 현재 페이지  시작 글번호 (페이지별) ----- DB에서 가져올 글 숫자 구함 !!
        start = (currentPage - 1) * pageSize + 1; 
        
        // 현재페이지 마지막 글번호 (페이지별)
        end = start + pageSize - 1; 
        
        System.out.println("start : " + start);
        System.out.println("end : " + end);
        
        if(end > cnt) end = cnt;  // 혹시 이런 경우를 대비해서 
        
        // 출력용 글번호
        number = cnt - (currentPage -1) * pageSize;
        
        System.out.println("number (출력용페이지) : " + number);
        System.out.println("pageSize : " + pageSize);
        
        
        if(cnt > 0) {
        	// 5-2단계. 게시글 목록 조회 (위에서 선언한 map에 추가 - 안쓰는건 안쓰면됨  / map-키: 값)
        	map.put("start", start);
        	map.put("end", end);
            List<StockstockVO> itemList = dao.getItemList(map);
            model.addAttribute("itemList", itemList);              //  큰바구니 : 게시글 목록 cf)작은 바구니 : 게시글 1건 
        }
        
        // 시작페이지 
        startPage = (currentPage / pageBlock) * pageBlock + 1;
        
        if(currentPage % pageBlock == 0) startPage -= pageBlock;      
        System.out.println("startPage : " + startPage);
        
        // 마지막 페이지 
        endPage = startPage + pageBlock - 1;
        
        if(endPage > pageCount) endPage = pageCount;
        System.out.println("endPage : " + endPage);
        
        model.addAttribute("cnt", cnt);            // 글 갯수
        model.addAttribute("number", number);        // 출력용 글번호 
        model.addAttribute("pageNum", pageNum);    // 페이지 번호
        
        if(cnt > 0) {
        	model.addAttribute("startPage", startPage);         // 시작페이지
        	model.addAttribute("endPage", endPage);             // 마지막페이지
        	model.addAttribute("pageBlock", pageBlock);         // 출력할 페이지 갯수 
        	model.addAttribute("pageCount", pageCount);         // 페이지 갯수
        	model.addAttribute("currentPage", currentPage);     // 현재 페이지 
        }
	}


	// 선택기업 목록 
	@Override
	public StockstockVO selectCompany(HttpServletRequest req, Model model) {
		
		String stockcode = req.getParameter("c_code");
		String stockname = req.getParameter("c_name");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("stockcode", stockcode);
		map.put("stockname", stockname);
		
		StockstockVO company = new StockstockVO();
		company = dao.selectCompany(map);
		
		return company;
	}


	// 종목 리스트
	@Override
	public void stockList(HttpServletRequest req, Model model) {
		List<StockstockVO> list=new ArrayList<StockstockVO>();
		list=dao.stockList();
		model.addAttribute("list",list);
		String result="";
         for(int i=0; i<list.size(); i++) {
            if(result!="") {
               result+=", ";
            }
            result+="'"+list.get(i).getStockname()+"'";
         }
         model.addAttribute("stockname",result);
	}
	
	// 검색어 (급상승 종목, 검색 상위 종목, 네이버 실시간)
	@Override
	public void search(HttpServletRequest req, Model model) throws IOException {
		// 네이버 실시간 검색어
		String url1="https://www.naver.com";
		Document doc = Jsoup.connect(url1).get();
	    Elements contents=doc.select("ul[data-list=1to10] li.ah_item a[data-clk=lve.keyword]");
	    List<SearchVO> naver=new ArrayList<SearchVO>();
	    for(Element e : contents) {
	    	String link = e.attr("href");
            String rank = e.select("span.ah_r").text();
            String name = e.select("span.ah_k").text();
	    	
            SearchVO search = new SearchVO();
            
            search.setNum(rank);
            search.setTitle(name);
            search.setUrl(link);
            
            naver.add(search);
	    }
	 
	    model.addAttribute("naver",naver);
	    
	    // 검색 상위 종목
		String url2 ="https://finance.naver.com/news/news_list.nhn";
		Document doc2 = Jsoup.connect(url2).get();
		Elements element = doc2.select("div.box_type_r_top");
		
		List<SearchVO> best=new ArrayList<SearchVO>();
		SearchVO vo;
		
		int i=1;
		for(Element el : element.select("tr")) {
			vo = new SearchVO();

			Elements aaaa= el.select("td").select("a");
			String link = aaaa.attr("href");
			vo.setUrl("https://finance.naver.com"+link);
			
			Elements dd = el.select("td"); // 걍한꺼번에
			String www = dd.text();
			vo.setTitle(www);
			vo.setNumber(i);
			i++;
			
			best.add(vo);
		}
		model.addAttribute("best",best);
		
		// 급등 종목 TOP10
		String url3 ="https://finance.naver.com/sise/sise_low_up.nhn";
		Document doc3 = Jsoup.connect(url3).get();
		Elements element2 = doc3.select("div.box_type_l");
		
		List<SearchVO> up=new ArrayList<SearchVO>();
		SearchVO vo2;
		
		for(Element el : element2.select("tr")) {
			vo2 = new SearchVO();

			String num= el.select("td.no").text();
			vo2.setNum(num);
			
			String link=el.select("td a").attr("href");
			String title=el.select("td a").text();
			vo2.setTitle(title);
			vo2.setUrl("https://finance.naver.com"+link);
			
			if(num.length()!=0) {
				up.add(vo2);
			}
			
			if(num.equals("10")) {
				break;
			}
		}
		model.addAttribute("up",up);
	}
		
		//나의 매수/매도 예약 내역 확인
		@Override
		public void buySellBook(HttpServletRequest req, Model model) {
			String userId = req.getParameter("");	// 아직 연결 안되어있음(로그인 시 아이디 확인 후 자동으로 화면 창 나오게함)
			
			List<Stock_StockVO> buyBookStock = dao.buyBook();
			List<Stock_StockVO> sellBookStock = dao.sellBook();
			model.addAttribute("buyBookStock",buyBookStock);
			model.addAttribute("sellBookStock",sellBookStock);
		}
		//코드 선택 시 호가창 출력
		@Override
		public void asking_stock(HttpServletRequest req, Model model) {
			String CompanyCode = req.getParameter("CompanyCode");
			
			Stock_StockVO vo = dao.asking_stock(CompanyCode);
			model.addAttribute("vo",vo);
		}
		
		// 관심종목 삭제 
		@Override
		public int deletePro(HttpServletRequest req, Model model) {

			String stockcode = req.getParameter("c_code");
			String stockname = req.getParameter("c_name");
	        
	        Map<String,Object> map = new HashMap<String,Object>();
	        map.put("stockcode", stockcode);
			map.put("stockname", stockname);
	        
	        int deleteCnt = dao.deleteItem(map);
	        
	        // 페이징 처리 
	        //int num = Integer.parseInt(req.getParameter("num"));
	        //int pageNum = Integer.parseInt(req.getParameter("pageNum"));
	        
	        model.addAttribute("deleteCnt", deleteCnt);
	        //model.addAttribute("pageNum", pageNum);
	        //model.addAttribute("num", num);
			
			return deleteCnt;
		}
		//13일 추가
		@Override
		public void gettop5stock(HttpServletRequest req, Model model) {
			//상단 5개 종목명 리스트
			List<Stock_StockVO> topList = new ArrayList<>();
			//현재 존재하는 종목명
			List<String> themeList = new ArrayList<>();
			//각 종목마다의 리스트 추가
			Map<String, List<Stock_StockVO>> themeMap = new HashMap<>();
			
			topList = dao.getTopList();
			for(int i = 0; i < topList.size(); i++) {
				Stock_StockVO svo = topList.get(i);
				System.out.println(svo.getStockName());
			}
			
			themeList = dao.getThemeList();
			
			
			for(int i = 0; i < themeList.size(); i++) {
				themeMap.put(themeList.get(i), dao.getThemeMap(themeList.get(i)));
			}
			
			model.addAttribute("topList", topList);
			model.addAttribute("themeMap", themeMap);
		}
		
		// 관심종목 추가
		@Override
		public void insertInterest(HttpServletRequest req, Model model) {
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			String id = authentication.getName();
			String stockcode=req.getParameter("stockcode");
			
			Map<String,Object> map=new HashMap<String, Object>();
			map.put("id", id);
			map.put("stockcode", stockcode);
			
			int selectCnt=dao.checkInterest(map);
			// 관심종목 이미 담겨있을 때
			if(selectCnt==1) {
				model.addAttribute("selectCnt",selectCnt);
			// 관심종목 새로 추가
			} else {
				int insertCnt=dao.insertInterest(map);
				model.addAttribute("insertCnt",insertCnt);
			}
		}
		
		// 회원정보보기 - 추가분 2019.08.12
			
		@Override 
		public void modifyView(HttpServletRequest req, Model model) {
		  
			String strPwd = req.getParameter("pwd"); Authentication
			authentication = SecurityContextHolder.getContext().getAuthentication(); 
			User user = (User) authentication.getPrincipal(); 
			String strId = user.getUsername();
			
			Map<String, Object> map = new HashMap<String,Object>();
			map.put("strId", strId); 
			System.out.println(strId + " id~~~~~~~~~~~~ ");
			  
			 // id로 비밀번호 값 가져오기 
			String c_pwd = dao.getPwd(map);
			
			System.out.println( strPwd +": 입력받은 값 "); 
			System.out.println( c_pwd  +": 데이터베이스에서 갖고온값"); 
			System.out.println(passwordEncoder.matches(strPwd, c_pwd));
			
			if(passwordEncoder.matches(strPwd, c_pwd)) { 
			System.out.println("비밀번호 일치");
			 
			StockVO vo = dao.getMemberInfo(strId); 
			model.addAttribute("vo", vo);
			model.addAttribute("loginCnt", 1); 
			model.addAttribute("currentPwd",strPwd);
			
			}else {
			model.addAttribute("loginCnt", 0); 
			}
		}

		// 회원정보 수정 
		@Override
		public void c_modifyView(HttpServletRequest req, Model model) {
			StockVO vo = new StockVO(); // 바구니 생성 
			
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication(); 
		    User user = (User) authentication.getPrincipal();
		    String strId = user.getUsername();
		    
			vo.setUsername(strId);
			System.out.println("아이디 : " + strId);
			
			String strpwd = req.getParameter("pwd");
			System.out.println("암호화 전의 비밀번호 : " + strpwd);
			//비밀번호 암호화
			String encryptPassword = passwordEncoder.encode(strpwd);
			System.out.println("암호화 후의 비밀번호 : " + encryptPassword);
			
			vo.setPassword(encryptPassword);
			vo.setName(req.getParameter("name"));
			
			// 전화번호
			String hp = req.getParameter("hp");
			vo.setHp(hp);
			System.out.println("전화번호 : " + hp);
			
			// 5. 회원 정보 수정처리 확인
			int updateCnt = dao.updateMember(vo);
			// 6. 처리 결과를 저장 
			model.addAttribute("updateCnt", updateCnt);
		}

		// 회원탈퇴 
		@Override
		public void c_deletePro(HttpServletRequest req, Model model, HttpServletResponse res) {
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication(); 
		    User user = (User) authentication.getPrincipal();
		    String strId = user.getUsername();
		    int deleteCnt = 0;
		    
	    	deleteCnt = dao.deleteMember(strId);
	    	
	    	// 세션삭제
	    	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			if(auth != null) {
				new SecurityContextLogoutHandler().logout(req, res, auth);
			}
			// 6. 값 넘겨주기 
			model.addAttribute("deleteCnt", deleteCnt);
			
		}
		
		//13일 추가
		@Override
		public void detailTheme(HttpServletRequest req, Model model) {
			String theme = req.getParameter("theme");
			
			List<Stock_StockVO> lvo = new ArrayList<>();
			StockThemeVO svo = new StockThemeVO();
			if(theme == null) {
				model.addAttribute("result", 0);
			} else {
				lvo = dao.getdetailTheme(theme);
				svo = dao.getpreviewTheme(theme);
				
				model.addAttribute("svo", svo);
				model.addAttribute("lvo", lvo);
			}
			
		}
		
		//메시지 전송
		@Override
		public void sendMessage(HttpServletRequest req, Model model) {
			MessageVO mvo = new MessageVO();
			int searchId = 0;
			System.out.println(req.getParameter("username"));
			mvo.setUsername(req.getParameter("username"));
			mvo.setReceivename(req.getParameter("recename"));
			mvo.setMessage_subject(req.getParameter("message_subject"));
			mvo.setMessage_content(req.getParameter("message_content"));
			mvo.setMessage_senddate(new Timestamp(System.currentTimeMillis()));
			searchId = dao.idCheck(mvo.getReceivename());
			if(searchId == 1) {	//받는 이가 존재한다면 메시지 전송 성공
				mvo.setErrored('n');
			} else { //받는 이가 존재하지 않는다면 메시지 전송 실패
				mvo.setErrored('y');
			}
			
			int result = dao.sendMessage(mvo);
			model.addAttribute("result", result);
		}
		
		//수신 메시지 목록 가져오기
		@Override
		public void getReceivedMessage(HttpServletRequest req, Model model) {
			List<MessageVO> mList = new ArrayList<>();
			System.out.println(req.getParameter("username"));
			mList = dao.getReceivedMessage(req.getParameter("username"));
			
			model.addAttribute("mList_received", mList);
		}
		
	    //보낸 메시지 목록 가져오기
		@Override
		public void getSentMessage(HttpServletRequest req, Model model) {
			List<MessageVO> mList = new ArrayList<>();
			
			mList = dao.getSentMessage(req.getParameter("username"));
			
			model.addAttribute("mList_sent", mList);
		}
		
		//메시지 세부내용
		@Override
		public void getDetailMessage(HttpServletRequest req, Model model) {
			int message_id = Integer.parseInt(req.getParameter("message_id"));
			
			MessageVO mvo = dao.getDetailMessage(message_id);
			req.setAttribute("mvo", mvo);
			String receivename = req.getParameter("receivename");
			System.out.println(receivename);
			if(receivename != null) {
				System.out.println(mvo.getReadable());
				System.out.println(mvo.getReceivename());
				if(mvo.getReadable() == 'n' && receivename.equals(mvo.getReceivename())) {
					dao.setReadable(mvo);
					System.out.println("success!!");
				}
			}
		}
		
	    //휴지통 메시지 목록 가져오기
		@Override
		public void getDeletedMessage(HttpServletRequest req, Model model) {
			List<MessageVO> mList = new ArrayList<>();
			
			mList = dao.getDeletedMessage(req.getParameter("username"));
			
			model.addAttribute("mList_deleted", mList);
		}
		
	    //메시지 휴지통 행
		@Override
		public void deleteMessagePro(HttpServletRequest req, Model model) {
			String[] idArray = req.getParameterValues("message_id");
			
			int[] nums = Arrays.stream(idArray).mapToInt(Integer::parseInt).toArray();
			List<Integer> message_ids = new ArrayList<>();
			
			for(int i = 0; i < nums.length; i++) {
				message_ids.add(nums[i]);
			}
			
			System.out.println(message_ids.size());
			
			int result = 0;
			result = dao.setNewable(message_ids);
			
			model.addAttribute("result", result);
		}
		
		//메시지 복구
		@Override
		public void recoveryMessagePro(HttpServletRequest req, Model model) {
			String[] idArray = req.getParameterValues("message_id");
			
			int[] nums = Arrays.stream(idArray).mapToInt(Integer::parseInt).toArray();
			List<Integer> message_ids = new ArrayList<>();
			
			for(int i = 0; i < nums.length; i++) {
				message_ids.add(nums[i]);
			}
			
			System.out.println(message_ids.size());
			
			int result = 0;
			result = dao.recoveryNewable(message_ids);
			
			model.addAttribute("result", result);
		}
		
		//전체 메시지 전송 - 관리자
		@Override
		public void sendEntireMessagePro(HttpServletRequest req, Model model) {
			List<String> uList = new ArrayList<>();
			List<MessageVO> mList = new ArrayList<>();
			uList = dao.getEntireUsernames();
			int result = 0;
			System.out.println(uList);
			MessageVO mvo = new MessageVO();
			mvo.setUsername("host");
			mvo.setMessage_subject("[전체발송]" + req.getParameter("message_subject"));
			mvo.setMessage_content("[전체발송 메시지 입니다.]<br>" + req.getParameter("message_content"));
			mvo.setMessage_senddate(new Timestamp(System.currentTimeMillis()));
			mvo.setErrored('n');
			for(int i = 0; i < uList.size(); i++) {
				mvo.setReceivename(uList.get(i));
				result += dao.sendMessage(mvo);
			}
			
			System.out.println("총" + result + "건이 발송됨");
			model.addAttribute("result", result);
		}
		
		//모든 테마 가져오기
		@Override
		public void getEntireThemes(HttpServletRequest req, Model model) {
			List<String> themeList = new ArrayList<>();
			
			themeList = dao.getThemeList();
			
			model.addAttribute("themeList", themeList);
		}
		
		//분석할 선택된 테마 정보 가져오기
		@Override
		public void getChooseThemes(HttpServletRequest req, Model model) {
			String[] themes = req.getParameterValues("themes");
			int length = themes.length;
			List<String> tList = new ArrayList<>();
			for(int i = 0; i < themes.length; i++) {
				tList.add(themes[i]);
				System.out.println(tList.get(i));
			}
			model.addAttribute("length", length);
			model.addAttribute("tList", tList);
			if(length == 2) {
				List<StockRecodeVO> rList1 = new ArrayList<>();
				List<StockRecodeVO> rList2 = new ArrayList<>();
				
				rList1 = dao.getStockRecord(tList.get(0));
				rList2 = dao.getStockRecord(tList.get(1));
				
				model.addAttribute("rList1", rList1);
				model.addAttribute("rList1Name", tList.get(0));
				model.addAttribute("rList2", rList2);
				model.addAttribute("rList2Name", tList.get(1));
			} else if(length == 3) {
				List<StockRecodeVO> rList1 = new ArrayList<>();
				List<StockRecodeVO> rList2 = new ArrayList<>();
				List<StockRecodeVO> rList3 = new ArrayList<>();

				rList1 = dao.getStockRecord(tList.get(0));
				rList2 = dao.getStockRecord(tList.get(1));
				rList3 = dao.getStockRecord(tList.get(2));
				
				model.addAttribute("rList1", rList1);
				model.addAttribute("rList2", rList2);
				model.addAttribute("rList3", rList3);
				
				model.addAttribute("rList1Name", tList.get(0));
				model.addAttribute("rList2Name", tList.get(1));
				model.addAttribute("rList3Name", tList.get(2));
			} else {
				List<StockRecodeVO> rList1 = new ArrayList<>();
				List<StockRecodeVO> rList2 = new ArrayList<>();
				List<StockRecodeVO> rList3 = new ArrayList<>();
				List<StockRecodeVO> rList4 = new ArrayList<>();

				rList1 = dao.getStockRecord(tList.get(0));
				rList2 = dao.getStockRecord(tList.get(1));
				rList3 = dao.getStockRecord(tList.get(2));
				rList4 = dao.getStockRecord(tList.get(3));
				
				model.addAttribute("rList1", rList1);
				model.addAttribute("rList2", rList2);
				model.addAttribute("rList3", rList3);
				model.addAttribute("rList4", rList4);
				
				model.addAttribute("rList1Name", tList.get(0));
				model.addAttribute("rList2Name", tList.get(1));
				model.addAttribute("rList3Name", tList.get(2));
				model.addAttribute("rList4Name", tList.get(3));
			}	
		}
		
		//8.14 이경재 나의 주식 거래 정보
		@Override
		public void completedStock(HttpServletRequest req, Model model) {
			String username="gkdl7282";	//req.getParameter("김일광이 로그인 아이디 넘겨주면 넣을 곳");
			String CompanyCode = req.getParameter("CompanyCode");
			
			Map<String,Object> map = new HashMap<String,Object>();
			
			map.put("username", username);
			map.put("stockcode",CompanyCode);
			List<completedVO> list = dao.completedStock(map);
			
			model.addAttribute("list",list);
		}
		
		@Override
		public void MyStock(HttpServletRequest req, Model model) {
			String username="gkdl7282";	//req.getParameter("김일광이 로그인 아이디 넘겨주면 넣을 곳");
			
			List<completedVO> list = dao.MyStock(username);
			
			model.addAttribute("list",list);
		}
		
		//8.19 이체
		@Transactional(rollbackFor=Exception.class)
		@Override
		public void transferMoney(HttpServletRequest req, Model model) {
			String withdrawMessage = req.getParameter("withdrawMessage"); //입금 계좌 표시
			String transferMessage = req.getParameter("transferMessage"); //출금 계좌 표시
			String withdraw = req.getParameter("withdraw");	// 입금 계좌
			String deposit_account = req.getParameter("deposit_account"); //출금 계좌
			String transfer_price = req.getParameter("transfer_price"); //금액
			int sum = Integer.parseInt(req.getParameter("sum"));//이체 잔액
			try {
			if(sum>0) {
				System.out.println("sum" + sum);
				
				Map<String,Object> map = new HashMap<String,Object>();
				map.put("withdrawMessage", withdrawMessage);
				map.put("transferMessage", transferMessage);
				map.put("withdraw", withdraw);				//출금 계좌
				map.put("deposit_account",deposit_account); //입금 계좌
				map.put("transfer_price", transfer_price);  
				
				int transCnt = dao.transferMoney(map);
				
				if(transCnt == 1) {
					Map<String,Object> map1 = new HashMap<String,Object>();
					map1.put("withdraw", withdraw);				//출금 계좌
					map1.put("sum", sum); 
					
					dao.minusMoney(map1);
					
					model.addAttribute("transCnt",transCnt);
					}
			}
			}catch(Exception e) {
				System.out.println("exception 발생"); //록백 처리
				TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			}
			
		}
		
		//계좌 금액 조회
		@Override
		public void accountSearch(HttpServletRequest req, Model model) {
			String withdraw = req.getParameter("withdraw");
			String account_pwd = req.getParameter("account_pwd");
			
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("account", withdraw);
			map.put("password",account_pwd);
			
			int accountCnt = dao.accountChk(map);
			
			if(accountCnt ==1) {
				AccountVO account = dao.accountSearch(map);
				model.addAttribute("account",account);
				model.addAttribute("accountCnt",accountCnt);
			}else {
				model.addAttribute("accountCnt",accountCnt);
			}
		}
		//이체화면 클릭 시 계좌정보 조회
		@Override
		public void accountInfo(HttpServletRequest req, Model model) {
			String username = "host";//req.getParameter("username");
			AccountVO vo = dao.accountInfo(username);
			model.addAttribute("vo",vo);
		}
		
		//이체 시 체크
		@Override
		public void transferChk(HttpServletRequest req, Model model) {
			String withdrawMessage = req.getParameter("withdrawMessage"); //입금 계좌 표시
			String transferMessage = req.getParameter("transferMessage"); //출금 계좌 표시
			String withdraw = req.getParameter("withdraw");	// 입금 계좌
			String deposit_account = req.getParameter("deposit_account"); //출금 계좌
			String transfer_price = req.getParameter("transfer_price"); //금액
			int sum = Integer.parseInt(req.getParameter("sum"));//이체 잔액
			
			model.addAttribute("transfer_price",transfer_price);
			model.addAttribute("deposit_account",deposit_account);
			model.addAttribute("withdraw",withdraw);
			model.addAttribute("transferMessage",transferMessage);
			model.addAttribute("withdrawMessage",withdrawMessage);
			model.addAttribute("sum",sum);
		}
		//이제정보 불러오기 ajax
		@Override
		public void dateTranseInf(HttpServletRequest req, Model model) {
			int dayDate = Integer.parseInt(req.getParameter("dayDate"));
			String withdraw = req.getParameter("withdraw");
			
			if(dayDate == 0) {
				List<TransferVO> list = dao.transfInfo(withdraw);
				System.out.println("withdraw" + withdraw);
				model.addAttribute("list",list);
			}else {
				Map<String,Object> map = new HashMap<String,Object>();
				map.put("withdraw", withdraw);
				map.put("dayDate", dayDate);
				
				List<TransferVO> list = dao.dateTranseInf(map);
				System.out.println("withdraw" + withdraw);
				System.out.println("dayDate" + dayDate);
				model.addAttribute("list",list);
			}
		}
		// 공지사항 리스트
		@Override
		public void noticeList(HttpServletRequest req, Model model) {
			int pageSize = 500; 	// 글 최대 500개까지 저장 가능(500개 넘어가면 그 이후부터는 출력안됨 보이게 하려면 500을 다른 숫자로 변경하면 보임)
			int pageBlock = 3; 		// 한 블럭당 페이지 갯수 123 234(사실 이거 안쓰는데 그냥 지우기는 그래서[혹시 필요한 순간이 있을까봐] 안지움)
			int cnt = 0; 			// 글의 갯수
			int start = 0; 			// 현재 페이지의 시작 글번호
			int end = 0; 			// 현재 페이지의 마지막 글번호
			int number = 0; 		// 출력용 글번호
			String pageNum = "";	// 페이지 번호
			int currentPage = 0;	// 현재 페이지
			int pageCount = 0;		// 페이지 갯수
			int startPage = 0;		// 시작 페이지
			int endPage = 0;		// 마지막 페이지
	
			cnt = dao.getNoticeCnt();
			System.out.println("cnt : " + cnt);	// 먼저 테이블에서 30건 insert
	
			pageNum = req.getParameter("pageNum");
	
			if(pageNum == null) {
				pageNum = "1";	// 첫 페이지를 1페이지로 지정
			}
			currentPage = Integer.parseInt(pageNum);	// 현재 페이지 1
			System.out.println("currentPage : " + currentPage);
			pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);	 // 페이지 갯수 + 나머지 있으면 1
			start = (currentPage - 1) * pageSize + 1;
			end = start + pageSize - 1;
			System.out.println("start : " + start + " " + "end : " + end);
			if(end > cnt) end = cnt;
			number = cnt - (currentPage - 1) * pageSize;
			System.out.println("number : " + number + " " + "pageSize : " + pageSize);
			if(cnt > 0) {
				map.put("start", start);
				map.put("end", end);
				List<StockVO> dto = dao.getNoticeList(map);
				model.addAttribute("dto", dto);	// 큰바구니 : 게시글목록 cf) 작은바구니 : 게시글 1건
			}
			startPage = (currentPage / pageBlock) * pageBlock + 1;		// 1 = (1/3) * 3 + 1
			if(currentPage % pageBlock == 0) startPage -= pageBlock;
			System.out.println("srartPage : " + startPage);
			endPage = startPage + pageBlock - 1;
			if(endPage > pageCount) endPage = pageCount;
			System.out.println("endPage : " + endPage);
			model.addAttribute("cnt", cnt);	// 글갯수
			model.addAttribute("number", number);	// 출력용 글번호
			model.addAttribute("pageNum", pageNum);	// 페이지번호
			if(cnt > 0) {
				model.addAttribute("startPage", startPage); // 시작페이지
				model.addAttribute("endPage", endPage); // 마지막페이지
				model.addAttribute("pageBlock", pageBlock);	// 출력할 페이지 갯수
				model.addAttribute("pageCount", pageCount);	// 페이지 갯수
				model.addAttribute("currentPage", currentPage);	// 현재페이지
			}
		}
	
		@Override
		public void noticeWrite(HttpServletRequest req, Model model) {
			int nonum = 0;
		
			if(req.getParameter("nonum") != null) {nonum = Integer.parseInt(req.getParameter("nonum"));}
		
			model.addAttribute("nonum", nonum);
		}
	
		@Override
		public void noticeWritePro(HttpServletRequest req, Model model) {
			StockVO vo = new StockVO();
		
			vo.setNonum(Integer.parseInt(req.getParameter("nonum")));
			vo.setWriter(req.getParameter("writer"));
			vo.setSubject(req.getParameter("subject"));
			vo.setContent(req.getParameter("editor1"));
			vo.setRef_date(new Timestamp(System.currentTimeMillis()));
		
			int insertCnt = dao.insertNotice(vo);
		
			model.addAttribute("insertCnt", insertCnt);
		}
	
		@Override
		public void noticeForm(HttpServletRequest req, Model model) {
			int nonum = Integer.parseInt(req.getParameter("nonum"));
		
			// 조회수 증가
		    dao.addNoticeReadCnt(nonum);	
		
			StockVO vo = dao.getNotice(nonum);
		
			model.addAttribute("dto", vo);
		}
	
		@Override
		public void hostForm(HttpServletRequest req, Model model) {
			String username = req.getParameter("username");
			System.out.println("username : " + username);
			int cnt = dao.userCount();
			System.out.println("cnt : " + cnt);
			int minusCnt = cnt - 1;
			System.out.println("minusCnt : " + minusCnt);
			
			StockVO vo = dao.getHostInfo(username);
			
			model.addAttribute("minusCnt", minusCnt);
			model.addAttribute("vo", vo);
			int pageSize = 500; 	// 표시할 유저 최대 500개까지 저장 가능(500개 넘어가면 그 이후부터는 출력안됨 보이게 하려면 500을 다른 숫자로 변경하면 보임)
			int pageBlock = 3; 		// 한 블럭당 페이지 갯수 123 234(사실 이거 안쓰는데 그냥 지우기는 그래서[혹시 필요한 순간이 있을까봐] 안지움)
			int start = 0; 			// 현재 페이지의 시작 글번호
			int end = 0; 			// 현재 페이지의 마지막 글번호
			int number = 0; 		// 출력용 글번호
			String pageNum = "";	// 페이지 번호
			int currentPage = 0;	// 현재 페이지
			int pageCount = 0;		// 페이지 갯수
			int startPage = 0;		// 시작 페이지
			int endPage = 0;		// 마지막 페이지
	
			pageNum = req.getParameter("pageNum");
	
			if(pageNum == null) {
				pageNum = "1";	// 첫 페이지를 1페이지로 지정
			}
			currentPage = Integer.parseInt(pageNum);	// 현재 페이지 1
			System.out.println("currentPage : " + currentPage);
			pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);	 // 페이지 갯수 + 나머지 있으면 1
			start = (currentPage - 1) * pageSize + 1;
			end = start + pageSize - 1;
			System.out.println("start : " + start + " " + "end : " + end);
			if(end > cnt) end = cnt;
			number = cnt - (currentPage - 1) * pageSize;
			System.out.println("number : " + number + " " + "pageSize : " + pageSize);
			if(cnt > 0) {
				map.put("start", start);
				map.put("end", end);
				List<StockVO> dto = dao.getUserList(map);
				model.addAttribute("dto", dto);	// 큰바구니 : 게시글목록 cf) 작은바구니 : 게시글 1건
			}
			startPage = (currentPage / pageBlock) * pageBlock + 1;		// 1 = (1/3) * 3 + 1
			if(currentPage % pageBlock == 0) startPage -= pageBlock;
			System.out.println("srartPage : " + startPage);
			endPage = startPage + pageBlock - 1;
			if(endPage > pageCount) endPage = pageCount;
			System.out.println("endPage : " + endPage);
			model.addAttribute("cnt", cnt);	// 회원 수
			model.addAttribute("number", number);	// 출력용 글번호
			model.addAttribute("pageNum", pageNum);	// 페이지번호
			if(cnt > 0) {
				model.addAttribute("startPage", startPage); // 시작페이지
				model.addAttribute("endPage", endPage); // 마지막페이지
				model.addAttribute("pageBlock", pageBlock);	// 출력할 페이지 갯수
				model.addAttribute("pageCount", pageCount);	// 페이지 갯수
				model.addAttribute("currentPage", currentPage);	// 현재페이지
			}
		}
	
		//매수 내역
		@Override
		public void buyList(HttpServletRequest req, Model model) {
			String username = req.getParameter("username");
			//3단계. 화면으로부터 입력받은 값을 받아온다.
			//페이징 처리
			int pageSize = 5; //한페이지당 출력할 글 갯수
			int pageBlock = 3; //한블럭당 3페이지 
			int cnt = 0;		//글 갯수
			int start = 0;		//현재페이지의 시작 글번호
			int end = 0;		//현재페이지의 마지막 글번호
			int number = 0;		//출력용 글번호
			String pageNum = ""; //페이지 번호
			int currentPage = 0; //현재 페이지
			
			int pageCount = 0; //페이지 갯수
			int startPage = 0; //시작페이지
			int endPage = 0;	//마지막페이지
			
			//4단계 다형성 적용, 싱글톤 방식으로 dao 객체 생성하라
			//BoardDAO dao = BoardDAOImpl.getInstance();
			
			//5-1단계. 글의 갯수 구하기]
			
			
			System.out.println("service username" + username);
			cnt=dao.getArticleCnt(username);
			System.out.println("cnt : " +cnt);
			
			pageNum = req.getParameter("pageNum");
			
			if(pageNum == null) {
				pageNum = "1";
			}
			
			// 글 30건 기준
			
			//현재 페이지
			currentPage = Integer.parseInt(pageNum);
			System.out.println("currentPage : " +currentPage);
			
			//페이지 갯수
			pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0); /*한 페이지에 들어갈 글 건으로 나누었을때 나머지가 발생하면 1페이지를 추가 발생하지 않으면 추가하지 않는다.*/
			
			// 현재페이지 시작 글번호
			//1 = (1 - 1)*5 +1 
			start = (currentPage -1) * pageSize +1;
			
			// 현재페이지 마지막 글번호(페이지별)
			//5 = 1+5 -1
			end = start + pageSize - 1;
			
			System.out.println("start : " +start);
			System.out.println("end : " + end);
			
			if(end > cnt) end = cnt;
			
			//출력용 글번호
			//30 -(1-1) * 5
			number = cnt - (currentPage -1) * pageSize;
			
			System.out.println("number : " + number);
			System.out.println("pageSize : " + pageSize);
			
			if(cnt > 0) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("username", username);
				map.put("start", start);
				map.put("end", end);
				
				List<Stock_completedVO> list = dao.getArticleList2(map);
				model.addAttribute("list", list); //큰바구니 : 게시글 목록 cf)작은 바구니 : 게시글 1건
				System.out.println("service : " + list);
			}
			
			//6단계. request나 session에 처리 결과를 저장(jsp에 전달하기 위함)
			
			//시작페이지
			//1 = (1 / 3) * 3 + 1; ?????????????
			startPage = (currentPage / pageBlock) * pageBlock + 1;
			
			if(currentPage % pageBlock == 0) startPage -= pageBlock;
			System.out.println("startPage : " + startPage);
			
			//마지막페이지
			//1+ 3 - 1;
			endPage = startPage + pageBlock -1;
			if(endPage > pageCount) endPage = pageCount;
			System.out.println("endPage : " + endPage);
			
			System.out.println("================================");
			
			model.addAttribute("cnt", cnt); //글갯수
			model.addAttribute("number", number); //출력용 글번호
			model.addAttribute("pageNum", pageNum);
			
			if(cnt > 0) {
				model.addAttribute("startPage", startPage); //시작페이지
				model.addAttribute("endPage", endPage);		// 마지막 페이지
				model.addAttribute("pageBlock", pageBlock);	// 출력할 페이지 갯수
				model.addAttribute("pageCount", pageCount);	//페이지 갯수
				model.addAttribute("currentPage", currentPage);//현재페이지
			}
			
		}

		@Override
		public void sellList(HttpServletRequest req, Model model) {
			//3단계. 화면으로부터 입력받은 값을 받아온다.
			//페이징 처리
			int pageSize1 = 5; //한페이지당 출력할 글 갯수
			int pageBlock1 = 3; //한블럭당 3페이지 
			int cnt1 = 0;		//글 갯수
			int start1 = 0;		//현재페이지의 시작 글번호
			int end1 = 0;		//현재페이지의 마지막 글번호
			int number1 = 0;		//출력용 글번호
			String pageNum1 = ""; //페이지 번호
			int currentPage1 = 0; //현재 페이지
			
			int pageCount1 = 0; //페이지 갯수
			int startPage1 = 0; //시작페이지
			int endPage1 = 0;	//마지막페이지
			
			//4단계 다형성 적용, 싱글톤 방식으로 dao 객체 생성하라
			//BoardDAO dao = BoardDAOImpl.getInstance();
			
			//5-1단계. 글의 갯수 구하기]
			String username = req.getParameter("username");
			System.out.println("sellList : " + username);
			cnt1 =dao.getArticleCnt1(username);
			System.out.println("cnt1 : " +cnt1);
			
			pageNum1 = req.getParameter("pageNum1");
			
			if(pageNum1 == null) {
				pageNum1 = "1";
			}
			
			// 글 30건 기준
			
			//현재 페이지
			currentPage1 = Integer.parseInt(pageNum1);
			System.out.println("currentPage1 : " +currentPage1);
			
			//페이지 갯수
			pageCount1 = (cnt1 / pageSize1) + (cnt1 % pageSize1 > 0 ? 1 : 0); /*한 페이지에 들어갈 글 건으로 나누었을때 나머지가 발생하면 1페이지를 추가 발생하지 않으면 추가하지 않는다.*/
			
			// 현재페이지 시작 글번호
			//1 = (1 - 1)*5 +1 
			start1 = (currentPage1 -1) * pageSize1 +1;
			
			// 현재페이지 마지막 글번호(페이지별)
			//5 = 1+5 -1
			end1 = start1 + pageSize1 - 1;
			
			System.out.println("start1 : " +start1);
			System.out.println("end1 : " + end1);
			
			if(end1 > cnt1) end1 = cnt1;
			
			//출력용 글번호
			//30 -(1-1) * 5
			number1 = cnt1 - (currentPage1 -1) * pageSize1;
			
			System.out.println("number1 : " + number1);
			System.out.println("pageSize1 : " + pageSize1);
			
			if(cnt1 > 0) {
				Map<String, Object> map1 = new HashMap<String, Object>();
				map1.put("username", username);
				map1.put("start1", start1);
				map1.put("end1", end1);
				
				List<Stock_completedVO> list1 = dao.getArticleList1(map1);
				System.out.println(list1.size());
				model.addAttribute("list1", list1); //큰바구니 : 게시글 목록 cf)작은 바구니 : 게시글 1건
				System.out.println("service : " + list1);
			}
			
			//6단계. request나 session에 처리 결과를 저장(jsp에 전달하기 위함)
			
			//시작페이지
			//1 = (1 / 3) * 3 + 1; ?????????????
			startPage1 = (currentPage1 / pageBlock1) * pageBlock1 + 1;
			
			if(currentPage1 % pageBlock1 == 0) startPage1 -= pageBlock1;
			System.out.println("startPage1 : " + startPage1);
			
			//마지막페이지
			//1+ 3 - 1;
			endPage1 = startPage1 + pageBlock1 -1;
			if(endPage1 > pageCount1) endPage1 = pageCount1;
			System.out.println("endPage1 : " + endPage1);
			
			System.out.println("================================");
			
			model.addAttribute("cnt1", cnt1); //글갯수
			model.addAttribute("number1", number1); //출력용 글번호
			model.addAttribute("pageNum1", pageNum1);
			
			if(cnt1 > 0) {
				model.addAttribute("startPage1", startPage1); //시작페이지
				model.addAttribute("endPage1", endPage1);		// 마지막 페이지
				model.addAttribute("pageBlock1", pageBlock1);	// 출력할 페이지 갯수
				model.addAttribute("pageCount1", pageCount1);	//페이지 갯수
				model.addAttribute("currentPage1", currentPage1);//현재페이지
			}
			
		}

		@Override
		public void Trans_InList(HttpServletRequest req, Model model) {
			//3단계. 화면으로부터 입력받은 값을 받아온다.
			//페이징 처리
			int pageSize2 = 5; //한페이지당 출력할 글 갯수
			int pageBlock2 = 3; //한블럭당 3페이지 
			int cnt2 = 0;		//글 갯수
			int start2 = 0;		//현재페이지의 시작 글번호
			int end2 = 0;		//현재페이지의 마지막 글번호
			int number2 = 0;		//출력용 글번호
			String pageNum2 = ""; //페이지 번호
			int currentPage2 = 0; //현재 페이지
			
			int pageCount2 = 0; //페이지 갯수
			int startPage2 = 0; //시작페이지
			int endPage2 = 0;	//마지막페이지
			
			//4단계 다형성 적용, 싱글톤 방식으로 dao 객체 생성하라
			//BoardDAO dao = BoardDAOImpl.getInstance();
			
			//5-1단계. 글의 갯수 구하기]
			String username = req.getParameter("username");
			System.out.println("t_InList : " + username);
			cnt2 =dao.getArticleCnt2(username);
			System.out.println("cnt2 : " +cnt2);
			
			pageNum2 = req.getParameter("pageNum2");
			
			if(pageNum2 == null) {
				pageNum2 = "1";
			}
			
			// 글 30건 기준
			
			//현재 페이지
			currentPage2 = Integer.parseInt(pageNum2);
			System.out.println("currentPage2 : " +currentPage2);
			
			//페이지 갯수
			pageCount2 = (cnt2 / pageSize2) + (cnt2 % pageSize2 > 0 ? 1 : 0); /*한 페이지에 들어갈 글 건으로 나누었을때 나머지가 발생하면 1페이지를 추가 발생하지 않으면 추가하지 않는다.*/
			
			// 현재페이지 시작 글번호
			//1 = (1 - 1)*5 +1 
			start2 = (currentPage2 -1) * pageSize2 +1;
			
			// 현재페이지 마지막 글번호(페이지별)
			//5 = 1+5 -1
			end2 = start2 + pageSize2 - 1;
			
			System.out.println("start2 : " +start2);
			System.out.println("end2 : " + end2);
			
			if(end2 > cnt2) end2 = cnt2;
			
			//출력용 글번호
			//30 -(1-1) * 5
			number2 = cnt2 - (currentPage2 -1) * pageSize2;
			
			System.out.println("number2 : " + number2);
			System.out.println("pageSize2 : " + pageSize2);
			
			if(cnt2 > 0) {
				Map<String, Object> map2 = new HashMap<String, Object>();
				map2.put("username", username);
				map2.put("start2", start2);
				map2.put("end2", end2);
				
				List<Stock_transferVO> list2 = dao.getArticleList(map2);
				System.out.println(list2.size());
				model.addAttribute("list2", list2); //큰바구니 : 게시글 목록 cf)작은 바구니 : 게시글 1건
				System.out.println("service : " + list2);
			}
			
			//6단계. request나 session에 처리 결과를 저장(jsp에 전달하기 위함)
			
			//시작페이지
			//1 = (1 / 3) * 3 + 1; ?????????????
			startPage2 = (currentPage2 / pageBlock2) * pageBlock2 + 1;
			
			if(currentPage2 % pageBlock2 == 0) startPage2 -= pageBlock2;
			System.out.println("startPage2 : " + startPage2);
			
			//마지막페이지
			//1+ 3 - 1;
			endPage2 = startPage2 + pageBlock2 -1;
			if(endPage2 > pageCount2) endPage2 = pageCount2;
			System.out.println("endPage2 : " + endPage2);
			
			System.out.println("================================");
			
			model.addAttribute("cnt2", cnt2); //글갯수
			model.addAttribute("number2", number2); //출력용 글번호
			model.addAttribute("pageNum2", pageNum2);
			
			if(cnt2 > 0) {
				model.addAttribute("startPage2", startPage2); //시작페이지
				model.addAttribute("endPage2", endPage2);		// 마지막 페이지
				model.addAttribute("pageBlock2", pageBlock2);	// 출력할 페이지 갯수
				model.addAttribute("pageCount2", pageCount2);	//페이지 갯수
				model.addAttribute("currentPage2", currentPage2);//현재페이지
			}
			
		}

		@Override
		public void Trans_OutList(HttpServletRequest req, Model model) {
			//3단계. 화면으로부터 입력받은 값을 받아온다.
			//페이징 처리
			int pageSize3 = 5; //한페이지당 출력할 글 갯수
			int pageBlock3 = 3; //한블럭당 3페이지 
			int cnt3 = 0;		//글 갯수
			int start3 = 0;		//현재페이지의 시작 글번호
			int end3 = 0;		//현재페이지의 마지막 글번호
			int number3 = 0;		//출력용 글번호
			String pageNum3 = ""; //페이지 번호
			int currentPage3 = 0; //현재 페이지
			
			int pageCount3 = 0; //페이지 갯수
			int startPage3 = 0; //시작페이지
			int endPage3 = 0;	//마지막페이지
			
			//4단계 다형성 적용, 싱글톤 방식으로 dao 객체 생성하라
			//BoardDAO dao = BoardDAOImpl.getInstance();
			
			//5-1단계. 글의 갯수 구하기]
			String username = req.getParameter("username");
			System.out.println("t_OutList : " + username);
			cnt3 =dao.getArticleCnt3(username);
			System.out.println("cnt3 : " +cnt3);
			
			pageNum3 = req.getParameter("pageNum3");
			
			if(pageNum3 == null) {
				pageNum3 = "1";
			}
			
			// 글 30건 기준
			
			//현재 페이지
			currentPage3 = Integer.parseInt(pageNum3);
			System.out.println("currentPage3 : " +currentPage3);
			
			//페이지 갯수
			pageCount3 = (cnt3 / pageSize3) + (cnt3 % pageSize3 > 0 ? 1 : 0); /*한 페이지에 들어갈 글 건으로 나누었을때 나머지가 발생하면 1페이지를 추가 발생하지 않으면 추가하지 않는다.*/
			
			// 현재페이지 시작 글번호
			//1 = (1 - 1)*5 +1 
			start3 = (currentPage3 -1) * pageSize3 +1;
			
			// 현재페이지 마지막 글번호(페이지별)
			//5 = 1+5 -1
			end3 = start3 + pageSize3 - 1;
			
			System.out.println("start3 : " +start3);
			System.out.println("end3 : " + end3);
			
			if(end3 > cnt3) end3 = cnt3;
			
			//출력용 글번호
			//30 -(1-1) * 5
			number3 = cnt3 - (currentPage3 -1) * pageSize3;
			
			System.out.println("number3 : " + number3);
			System.out.println("pageSize3 : " + pageSize3);
			
			if(cnt3 > 0) {
				Map<String, Object> map3 = new HashMap<String, Object>();
				map3.put("username", username);
				map3.put("start3", start3);
				map3.put("end3", end3);
				
				List<Stock_transferVO> list3 = dao.getArticleList3(map3);
				System.out.println(list3.size());
				model.addAttribute("list3", list3); //큰바구니 : 게시글 목록 cf)작은 바구니 : 게시글 1건
				System.out.println("service : " + list3);
			}
			
			//6단계. request나 session에 처리 결과를 저장(jsp에 전달하기 위함)
			
			//시작페이지
			//1 = (1 / 3) * 3 + 1; ?????????????
			startPage3 = (currentPage3 / pageBlock3) * pageBlock3 + 1;
			
			if(currentPage3 % pageBlock3 == 0) startPage3 -= pageBlock3;
			System.out.println("startPage3 : " + startPage3);
			
			//마지막페이지
			//1+ 3 - 1;
			endPage3 = startPage3 + pageBlock3 -1;
			if(endPage3 > pageCount3) endPage3 = pageCount3;
			System.out.println("endPage3 : " + endPage3);
			
			System.out.println("================================");
			
			model.addAttribute("cnt3", cnt3); //글갯수
			model.addAttribute("number3", number3); //출력용 글번호
			model.addAttribute("pageNum3", pageNum3);
			
			if(cnt3 > 0) {
				model.addAttribute("startPage3", startPage3); //시작페이지
				model.addAttribute("endPage3", endPage3);		// 마지막 페이지
				model.addAttribute("pageBlock3", pageBlock3);	// 출력할 페이지 갯수
				model.addAttribute("pageCount3", pageCount3);	//페이지 갯수
				model.addAttribute("currentPage3", currentPage3);//현재페이지
			}

		}
		
		@Override
		public void quiryList(HttpServletRequest req, Model model) {
			int pageSize = 500;
			int pageBlock = 3;
			int cnt = 0; 		// 글갯수
			int start = 0; 		// 현재페이지의 시작 글번호
			int end = 0; 		// 현재페이지의 마지막 글번호
			int number = 0; 	// 출력용 글번호
			String pageNum = "";// 페이지 번호
			int currentPage = 0; // 현재 페이지
			
			int pageCount = 0;	// 페이지 갯수
			int startPage = 0;	// 시작 페이지
			int endPage = 0; 	// 마지막 페이지
			
			cnt = dao.getArtcleCnt4();
			System.out.println("cnt : " + cnt);		
			pageNum = req.getParameter("pageNum");
			
			if(pageNum == null) {
				pageNum = "1";
			}
			
			currentPage = (Integer.parseInt(pageNum));
			
			pageCount = (cnt / pageSize) + (cnt % pageSize > 0 ? 1 : 0);
			start = (currentPage -1)* pageSize + 1;
			end = start + pageSize -1;
			if(end > cnt) end = cnt;
			number = cnt -(currentPage - 1) * pageSize;
			if(cnt > 0) {
				map.put("start", start);
				map.put("end", end);
				List<userInquiryVO> dtos = dao.getArticleList4(map);
				model.addAttribute("dtos", dtos);
				
			}
			startPage = (currentPage / pageBlock) * pageBlock + 1;
			
			if(currentPage % pageBlock == 0) startPage -= pageBlock;
			System.out.println("startPage : " + startPage);
			
			// 마지막페이지
			//  3= 1 + 3 - 1 
			endPage = startPage + pageBlock - 1;
			
			if(endPage > pageCount) endPage = pageCount;
			System.out.println("endPage : " + endPage);
			
			System.out.println("=======================");
			
			model.addAttribute("cnt", cnt); // 글갯수
			model.addAttribute("number", number); // 출력용 글번호
			model.addAttribute("pageNum", pageNum); // 페이지번호
			
			if(cnt > 0) {
				model.addAttribute("startPage", startPage); 		// 시작페이지
				model.addAttribute("endPage", endPage); 			//마지막페이지
				model.addAttribute("pageBlock", pageBlock); 		// 출력할 페이지 갯수
				model.addAttribute("pageCount", pageCount);		// 페이지개수
				model.addAttribute("currentPage", currentPage);	// 현재페이지
			}
		
		}
		
		// 조회수증가,상세페이지
		@Override
		public void contentForm(HttpServletRequest req, Model model) {
			int num = Integer.parseInt(req.getParameter("num"));
			int pageNum = Integer.parseInt(req.getParameter("pageNum"));
			
			dao.addReadCnt(num);
			userInquiryVO vo = dao.getArticle(num);
			
			model.addAttribute("dto",vo);
			model.addAttribute("pageNum",pageNum);
			model.addAttribute("num",num);
			
			
			
			
		}

		@Override
		public void userWriterForm(HttpServletRequest req, Model model) {
			// 3단계. 화면으로부터 입력받은 값을 받아온다.
			// 제목글(답변글이 아닌 경우)
			int num = 0;
			int ref = 1;
			int ref_step = 0; // 글순서(행)
			int ref_level = 0;// 글레벨(들여쓰기)
			
			// 답변글에 대한 글작성시
			if(req.getParameter("num")!=null) { // 즉 값이 있는경우
				num = Integer.parseInt(req.getParameter("num"));
				ref = Integer.parseInt(req.getParameter("ref"));
				ref_step = Integer.parseInt(req.getParameter("ref_step"));
				ref_level = Integer.parseInt(req.getParameter("ref_level"));
				System.out.println("ref_step" + ref_step);
				System.out.println("ref_level" + ref_level);
			}
			
			// 6단계. request나 session에 처리 결과를 저장(jsp에 전달하기 위함)
			model.addAttribute("num", num);
			model.addAttribute("ref", ref);
			model.addAttribute("ref_step", ref_step);
			model.addAttribute("ref_level", ref_level);
		
		}

		@Override
		public void writePro(HttpServletRequest req, Model model) {
			// BoardVO 바구니 생성
			userInquiryVO vo = new userInquiryVO();
			
			// 3-1 단계. writeForm의 hidden으로 넘긴 값을 바구니에 담는다.
			
			vo.setNum(Integer.parseInt(req.getParameter("num")));
			
			
			// 3-2단계 . 화면으로 부터 입력받은 값(작성자,비밀번호,제목, 내용)을 받아와서 바구니에 담는다.
			vo.setWriter(req.getParameter("writer"));
			vo.setSubject(req.getParameter("subject"));
			vo.setContent(req.getParameter("content"));
			
			// db에서 reg_date를 default로 sysd ate로작성해놓았으므로
			// 별도로 지정안할시 sysdate로 적용되고, 지정할 경우는 로컬이 우선순위\
			vo.setReg_date(new Timestamp(System.currentTimeMillis()));
			// 4단계. 다형성 적용, 싱글톤 방식으로 dao 객체를 생성
			//BoardDAO dao = BoardDAOImpl.getInstance();
			// 5단계. 글쓰기 처리
			int insertCnt = dao.insertBoard(vo);
			// 6단계. request나 session에 처리 결과를 저장(jsp에 전달하기 위함)
			model.addAttribute("insertCnt", insertCnt);
		}

		@Override
		public void usermodifyView(HttpServletRequest req, Model model) {
			// 3단계. 화면으로부터 입력받은 값을 받아온다.
			int num = Integer.parseInt(req.getParameter("num"));
			// 4단계. 다형성 적용, 싱글톤 방식으로 dao 객체를 생성
			//BoardDAO dao = BoardDAOImpl.getInstance();
			// 5-1단계. 비밀번호 인증
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("num", num);
			
			
			// 5-2단계. 비밀번호가 일치하면, 해당글 1건을 읽어서 BoardVO 바구니에 담는다.
			userInquiryVO vo =null;
			
			// 6단계. request나 session에 처리 결과를 저장(jsp에 전달하기 위함)
			model.addAttribute("dto", vo);
			model.addAttribute("num", num);
		}

		@Override
		public void modifyPro(HttpServletRequest req, Model model) {
			// 3단계. 화면으로부터 입력받은 값을 받아온다.
			int num = Integer.parseInt(req.getParameter("num"));
			// 바구니 생성
			userInquiryVO vo = new userInquiryVO();
			
			vo.setNum(num);
			vo.setSubject(req.getParameter("subject"));
			vo.setContent(req.getParameter("content"));
			// 4단계. 다형성 적용, 싱글톤 방식으로 dao 객체를 생성
			//BoardDAO dao = BoardDAOImpl.getInstance();
			
			// 5단계. 글수정 처리
			int updateCnt = dao.updateBoard(vo);
			// 6단계. request나 session에 처리 결과를 저장(jsp에 전달하기 위함)
			model.addAttribute("updateCnt", updateCnt);
			model.addAttribute("num", num);
			
		}

		@Override
		public void userdeletePro(HttpServletRequest req, Model model) {
			// 3단계. 화면으로부터 입력받은 값을 받아온다.
			
			// deleteForm의 hidden값으로 넘어온 값을 받아온다.
			int num = Integer.parseInt(req.getParameter("num"));
			
			// 4단계. 다형성 적용, 싱글톤 방식으로 dao 객체를 생성
			//BoardDAO dao = BoardDAOImpl.getInstance();
			// 5-1단계. 비밀번호 인증
			Map<String, Object> map =  new HashMap<String, Object>();
			map.put("num", num);
			// 5-2단계. 비밀번호가 일치하면  삭제처리
			int deleteCnt = 0;
			
			deleteCnt = dao.deleteBoard(num);
			
			// 6단계. request나 session에 처리 결과를 저장(jsp에 전달하기 위함)
			model.addAttribute("deleteCnt", deleteCnt);
		}
		
		
		// 추가
		// 트레이딩 페이지 차트
		@Override
		public void chart_stock(HttpServletRequest req, Model model) {
			String CompanyCode = req.getParameter("CompanyCode");
			
			List<Map<String,Object>> list=new ArrayList<Map<String,Object>>();
			
			list=dao.tradingchart(CompanyCode);
			String result="";
			for(int i = 0; i < list.size(); i++){
		        //arraylist 사이즈 만큼 for문을 실행
		        for(Entry<String, Object> e : list.get(i).entrySet() ){ 
		            // list 각각 hashmap받아서 출력
		            if(result!="") {
		            	result += ",";
			        }
		            
		            // 차트에 이용할 수 있도록 값 쪼개서 포장
		            if(e.getKey().equals("R_DATE")) {
		            	result+="{'date': '"+e.getValue()+"'";
		            } else if(e.getKey().equals("R_CLOSE")){
		            	result+="'close': '"+e.getValue()+"'";
		            } else if(e.getKey().equals("R_HIGH")){
		            	result+="'high': '"+e.getValue()+"'";
		            } else if(e.getKey().equals("R_LOW")){
		            	result+="'low': '"+e.getValue()+"'";
		            } else if(e.getKey().equals("R_OPEN")){
		            	result+="'open': '"+e.getValue()+"'}";
		            }
		        }
		    }
			System.out.println("tradingchart-"+result);
			model.addAttribute("chart", result);
		}
		
		// 종목(기업 검색)
		@Override
		public void stocklistsearch(HttpServletRequest req, Model model) throws IOException {
			String stockname=req.getParameter("stockname");
			List<StockstockVO> list=new ArrayList<StockstockVO>();
			list=dao.stocklistsearch(stockname);
			model.addAttribute("list",list);
			
			List<StockstockVO> list2=new ArrayList<StockstockVO>();
			list2=dao.stockList();
			
			String result="";
			for(int i=0; i<list2.size(); i++) {
				if(result!="") {
					result+=", ";
				}
				result+="'"+list2.get(i).getStockname()+"'";
			}
			model.addAttribute("stockname",result);
		}
		
		// 종목 상세 페이지(재무제표 및 차트)
		@Override
		public void chart(HttpServletRequest req, Model model) throws IOException {
			String stockcode = req.getParameter("stockcode");
			
			// 기업 재무 제표 크롤링
			String url ="https://comp.fnguide.com/SVO2/ASP/SVD_Main.asp?pGB=1&gicode=A"+stockcode+"&cID=&MenuYn=Y&ReportGB=&NewMenuID=101&stkGb=701";
			System.out.println("주소 : "+url);
			Document doc = Jsoup.connect(url).get();
			
			Elements element = doc.select("#highlight_B_A table");
			
			System.out.println("html : "+element.html());
			model.addAttribute("data",element.html());
			
			// 재무정보
			List<StockRecodeVO> list=new ArrayList<StockRecodeVO>();
			list=dao.financialInfo(stockcode);
			model.addAttribute("list",list);
			
			// 기업정보
			StockstockVO vo=dao.StockInfo(stockcode);
			model.addAttribute("vo",vo);
			
			List<Map<String,Object>> list1=new ArrayList<Map<String,Object>>();
			list1=dao.chart(stockcode);
			
			String result2="";
			for(int i = 0; i < list1.size(); i++){
		        //arraylist 사이즈 만큼 for문을 실행
		        for( Entry<String, Object> e : list1.get(i).entrySet() ){ 
		            // list 각각 hashmap받아서 출력
		            if(result2!="") {
			            result2 += ",";
			        }
		            
		            // 차트에 이용할 수 있도록 값 쪼개서 포장
		            if(e.getKey().equals("R_DATE")) {
		            	result2+="{'year':"+e.getValue();
		            } else if(e.getKey().equals("R_CLOSE")){
		            	result2+="'expenses':"+e.getValue();
		            } else if(e.getKey().equals("R_VOLUME")) {
		            	result2+="'income':"+e.getValue()+"}";
		            } 
		        }
		    }
			System.out.println(result2);
			model.addAttribute("result2", result2);
		}
}
