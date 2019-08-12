package com.spring.stock.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.io.IOException;
import java.util.Map.Entry;

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
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.stock.persistence.StockDAO;
import com.spring.stock.vo.SearchVO;
import com.spring.stock.vo.StockRecodeVO;
import com.spring.stock.vo.StockVO;
import com.spring.stock.vo.Stock_StockVO;
import com.spring.stock.vo.StockstockVO;
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
        
        
        // 4단계. 다형성 적용 , 싱글톤 방식으로  dao 객체를 생성
        //DAO dao = DAOImpl.getInstance();
 
        // 5-1단계. 글갯수 구하기 (검색값 가지고 간다.)
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("input", input);
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
	
		@Override
		public void chart(HttpServletRequest req, Model model) {
			String stockcode = req.getParameter("stockcode");
			
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


		// 종목 리스트
		@Override
		public void stockList(HttpServletRequest req, Model model) {
			List<StockstockVO> list=new ArrayList<StockstockVO>();
			list=dao.stockList();
			model.addAttribute("list",list);
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
			themeMap = dao.getThemeMap(themeList);
			
			
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
		
}
