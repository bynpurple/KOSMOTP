package com.spring.funding.service;

import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.ui.Model;
import org.web3j.crypto.CipherException;
import org.web3j.crypto.Credentials;
import org.web3j.crypto.WalletUtils;
import org.web3j.protocol.Web3j;
import org.web3j.protocol.core.RemoteCall;
import org.web3j.protocol.core.methods.response.TransactionReceipt;
import org.web3j.protocol.http.HttpService;
import org.web3j.tuples.generated.Tuple3;
import org.web3j.tx.Contract;
import org.web3j.utils.Numeric;

import com.spring.funding.controller.FundingController;
import com.spring.funding.persistence.FundingDAO;
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
import com.spring.funding.vo.AccountVO;
import com.spring.funding.vo.BoardVO;
import com.squareup.okhttp.MediaType;
import com.squareup.okhttp.OkHttpClient;
import com.squareup.okhttp.Request;
import com.squareup.okhttp.RequestBody;
import com.squareup.okhttp.Response;

@Service
public class FundingServiceImpl  implements FundingService{

	@Autowired
	FundingDAO dao;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	Map<String, Object> map = new HashMap<>();
	
	//스마트 컨트랙트 추가 구문
	private static String PRIVATE_KEY = "fae0d89c9581787937e48ebd3ff0a4ca04bf0c13d56cba567828cc0f0653f1fe";
	
	private final static BigInteger GAS_LIMIT = BigInteger.valueOf(6721975L);
	private final static BigInteger GAS_PRICE = BigInteger.valueOf(20000000000L);
	private final static BigDecimal value = BigDecimal.ONE;
	//
	
	/* 이경재 9/5 추가 해야할 것  시작 */
	
	//펀드 작성하기1
	@Override
	public void editor(HttpServletRequest req, Model model) {
		Map<String,Object> map = new HashMap<String,Object>();
		
		String fund_id = "";
		Random random = new Random();
		
		for(int i = 0; i < 7; i++) {
			fund_id += Integer.toString(random.nextInt(10));
		}
		
		String contractAddress = "";
		Web3j web3j = Web3j.build(new HttpService("HTTPS://ropsten.infura.io/v3/dbf0b2dbcbcf48d1a333d6b5626dc6c0"));
		Credentials credentials = Credentials.create(PRIVATE_KEY);
		
		
		
		String corpIntro = req.getParameter("editor1");
		String subject = req.getParameter("main_subject");
		String thumbnail = req.getParameter("thumbnail");
		String imageAndVideo = req.getParameter("imageAndVideo");
		String content_div = req.getParameter("content_div");
		
		String fundingDate = req.getParameter("fundingDate");
		int goalPrice = Integer.parseInt(req.getParameter("goalPrice"));
		int faceAmount = Integer.parseInt(req.getParameter("faceAmount")); 
		int issuingPrice = Integer.parseInt(req.getParameter("issuingPrice"));
		int minInvPrice = Integer.parseInt(req.getParameter("minInvPrice"));
		String publishDate = req.getParameter("publishDate");
		String issueDate = req.getParameter("issueDate");
		int corpValTest = Integer.parseInt(req.getParameter("corpValTest"));
		
		System.out.println("subject : " + subject);
		String username = req.getParameter("username");
		int chk = dao.idChk(Integer.parseInt(fund_id));
		
		if(chk==0) {
			map.put("content_div", content_div);
			map.put("fund_id", fund_id);
			map.put("corpIntro", corpIntro);
			map.put("subject", subject);
			map.put("thumbnail", thumbnail);
			map.put("imageAndVideo", imageAndVideo);
			try {
				contractAddress = Investment3.deploy(web3j, credentials, GAS_PRICE, GAS_LIMIT).send().getContractAddress();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			if(!contractAddress.equals("")) {
				int result = dao.createContract(fund_id, contractAddress, username);
				
				model.addAttribute("result", result);
			}
			int edit1 = dao.fundEdit1(map);
			
			Map<String,Object> stock = new HashMap<String,Object>();
			
			stock.put("fund_id", fund_id);
			stock.put("fundingDate", fundingDate);
			stock.put("goalPrice", goalPrice);
			stock.put("faceAmount", faceAmount);
			stock.put("issuingPrice", issuingPrice);
			stock.put("minInvPrice", minInvPrice);
			stock.put("publishDate", publishDate);
			stock.put("issueDate", issueDate);
			stock.put("corpValTest", corpValTest);
			model.addAttribute("");
			
			int fundEditStock = dao.fundEditStock(stock);
			
			
			
			model.addAttribute("edit1",edit1);
			model.addAttribute("fund_id", fund_id);
		}else {
			int edit1 = 0;
			model.addAttribute("edit1",edit1);
		}
	}
	
	@Transactional(rollbackFor=Exception.class)
	//펀드 작성하기2
	@Override
	public void editor1(HttpServletRequest req, Model model) {
		int fund_id = Integer.parseInt(req.getParameter("fund_id"));
		
		Map<String,Object> map = new HashMap<String,Object>();
		String busiStr = req.getParameter("editor1");
		String data = req.getParameter("editor2");
		try {
		map.put("fund_id", fund_id);
		map.put("busiStr", busiStr);
		map.put("data",data);
		
		int edit2 = dao.fundEdit2(map);
		model.addAttribute("edit2",edit2);
		model.addAttribute("fund_id", fund_id);
		}catch(Exception e) {
			System.out.println("exception 발생"); //록백 처리
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
	}
	
	@Transactional(rollbackFor=Exception.class)
	//펀드 작성하기 완료
	@Override
	public void editorCompleted(HttpServletRequest req, Model model) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		int fund_id = Integer.parseInt(req.getParameter("fund_id"));
		
		String corpIntro = req.getParameter("editor1");
		String invPoint = req.getParameter("editor2");
		
		
		map.put("fund_id", fund_id);
		map.put("corpIntro", corpIntro);
		map.put("invPoint", invPoint);
		
		System.out.println("핵심 포인트 : " + corpIntro);
		
		int editCompleted = dao.fundEditCompleted(map);
		model.addAttribute("editCompleted",editCompleted);
	}
	//펀드 상세 정보
	@Override
	public void fundingDetail(HttpServletRequest req, Model model) {
		int fund_id = Integer.parseInt(req.getParameter("fund_id"));
		FundStockInfVO Stockvo = dao.stockInf(fund_id);
		FundInfVO Fundvo = dao.fundInf(fund_id);
		ContractVO cvo = dao.getContract(req.getParameter("fund_id"));
		List<FundingTransactionVO> ftvo = dao.getFundTransaction(fund_id); 
		
		Web3j web3j = Web3j.build(new HttpService("HTTPS://ropsten.infura.io/v3/dbf0b2dbcbcf48d1a333d6b5626dc6c0"));
		
		Credentials credentials;
		
		credentials = Credentials.create(PRIVATE_KEY);
		try {
			Investment3 investment = Investment3.load(cvo.getFund_contract_address(), web3j, credentials, GAS_PRICE, GAS_LIMIT);
			
			int total_volume = 0;
			for(int index = 0; index < ftvo.size(); index++) {
				 Tuple3<byte[], BigInteger, BigInteger> investorInfo = investment.getInvestorInfo(BigInteger.valueOf(index)).send();
				 total_volume += investorInfo.getValue3().intValue();
			}
			int totalInvestMoney = total_volume * Stockvo.getfund_min_invest();
			model.addAttribute("totalInvestMoney", totalInvestMoney);
		} catch (Exception e) {
			// TODO: handle exception
		}
		model.addAttribute("Stockvo",Stockvo);
		model.addAttribute("Fundvo",Fundvo);
	}
	//수정 펀드 상세 페이지 1
	@Override
	public void Modifyeditor(HttpServletRequest req, Model model) {
		Map<String,Object> map = new HashMap<String,Object>();
		
		int fund_id = 2403639;
		String corpIntro = req.getParameter("editor1");
		
		String subject = req.getParameter("main_subject");
		String thumbnail = req.getParameter("thumbnail");
		String imageAndVideo = req.getParameter("imageAndVideo");
		String content_div = req.getParameter("content_div");
		
		String fundingDate = req.getParameter("fundingDate");
		int goalPrice = Integer.parseInt(req.getParameter("goalPrice"));
		int faceAmount = Integer.parseInt(req.getParameter("faceAmount")); 
		int issuingPrice = Integer.parseInt(req.getParameter("issuingPrice"));
		int minInvPrice = Integer.parseInt(req.getParameter("minInvPrice"));
		String publishDate = req.getParameter("publishDate");
		String issueDate = req.getParameter("issueDate");
		int corpValTest = Integer.parseInt(req.getParameter("corpValTest"));	
		
		System.out.println("subject : " + subject);
		
		int chk = dao.idChk(fund_id);
		
		if(chk!=0) {
			map.put("content_div", content_div);
			map.put("fund_id", fund_id);
			map.put("corpIntro", corpIntro);
			map.put("subject", subject);
			map.put("thumbnail", thumbnail);
			map.put("imageAndVideo", imageAndVideo);
			
			int edit1 = dao.Modifyfund1(map);
			
			Map<String,Object> stock = new HashMap<String,Object>();
			
			stock.put("fund_id", fund_id);
			stock.put("fundingDate", fundingDate);
			stock.put("goalPrice", goalPrice);
			stock.put("faceAmount", faceAmount);
			stock.put("issuingPrice", issuingPrice);
			stock.put("minInvPrice", minInvPrice);
			stock.put("publishDate", publishDate);
			stock.put("issueDate", issueDate);
			stock.put("corpValTest", corpValTest);
			model.addAttribute("");
			
			int fundEditStock = dao.ModifyfundStock(stock);
			
			model.addAttribute("edit1",edit1);
		}else {
			model.addAttribute("edit1",1);
		}
	}
	
	//펀드 코맨트
	@Override
	public void fundCommnet(HttpServletRequest req, Model model) {
		Map<String,Object> map = new HashMap<String,Object>();
		
		int fund_id = 2403639;
		String commentId = req.getParameter("commentId");
		String commentPwd = req.getParameter("commentPwd");
		String comment = req.getParameter("comment");
		map.put("fund_id", fund_id);
		map.put("commentId", commentId);
		map.put("commentPwd", commentPwd);
		map.put("comment", comment);
		
		int fundCnt = dao.fundCommnet(map);
		
		model.addAttribute("fundCnt",fundCnt);
		if(fundCnt ==1) {
			List<FAQCommentVO> list = dao.fundCommnetView(fund_id);
			
			model.addAttribute("list",list);
			}
	}
	//펀드 코맨트 보여주기
	public void fundCommnetView(HttpServletRequest req, Model model) {
		int fund_id = 2403639;
		List<FAQCommentVO> list = dao.fundCommnetView(fund_id);
		
		model.addAttribute("list",list);
	}
	//코맨트 답글용
	@Override
	public void Recomment(HttpServletRequest req, Model model) {
		
		String qna_id = req.getParameter("qna_id");
		String qna_comment = req.getParameter("qna_comment");
		String qna_date = req.getParameter("qna_date");
		
		System.out.println("qna_id : " + qna_id +"qna_comment : " + qna_comment);
		
		Map<String,Object> map1 = new HashMap<String,Object>();
		
		map1.put("qna_id", qna_id);
		map1.put("qna_comment", qna_comment);
		map1.put("qna_date",qna_date);
		
		List<commentReplyVO> list = dao.CommnetRepleView(map1);
		
		model.addAttribute("qna_id",qna_id);
		model.addAttribute("qna_comment",qna_comment);
		model.addAttribute("qna_date",qna_date);
		model.addAttribute("list",list);
	}
	
	//코맨트 답글 입력
	@Override
	public void RecommentTalk(HttpServletRequest req, Model model) {
		
		String qna_id = req.getParameter("qna_id");
		String qna_comment = req.getParameter("qna_comment");
		String reple_id = req.getParameter("commentId");
		String reple_pwd= req.getParameter("commentPwd");
		String reple_comment = req.getParameter("comment");
		String qna_date = req.getParameter("qna_date");
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("qna_id", qna_id);
		map.put("qna_comment", qna_comment);
		map.put("reple_id", reple_id);
		map.put("reple_pwd", reple_pwd);
		map.put("reple_comment", reple_comment);
		map.put("qna_date", qna_date);
		
		int ctCnt = dao.CommentTalk(map);
		
		model.addAttribute("ctCnt",ctCnt);
		if(ctCnt==1) {
			Map<String,Object> map1 = new HashMap<String,Object>();
			
			map1.put("qna_id", qna_id);
			map1.put("qna_comment", qna_comment);
			map1.put("qna_date",qna_date);
			List<commentReplyVO> list = dao.CommnetRepleView(map1);
			
			model.addAttribute("list",list);
		}
	}
	
	//코멘트 삭제
	@Override
	public void fundCommnetDel(HttpServletRequest req, Model model) {
		String DelcommentId = req.getParameter("DelcommentId");
		String DelcommentPwd = req.getParameter("DelcommentPwd");
		String qna_date = req.getParameter("qna_date");
		
		System.out.println(DelcommentId + DelcommentPwd);
		
		if(DelcommentPwd != null) {
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("DelcommentId", DelcommentId);
		map.put("DelcommentPwd", DelcommentPwd);
		map.put("qna_date", qna_date);
		
		int delCnt = dao.fundCommnetDel(map);
			model.addAttribute("delCnt",delCnt);
		}
	}
	
	//리플 삭제
	@Override
	public void fundrepleDel(HttpServletRequest req, Model model) {
		String DelcommentId = req.getParameter("DelcommentId");
		String DelcommentPwd = req.getParameter("DelcommentPwd");
		String reple_date = req.getParameter("reple_date");
		
		System.out.println("DelcommentId : " + DelcommentId + "DelcommentPwd : " + DelcommentPwd);
		
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("DelcommentId", DelcommentId);
		map.put("DelcommentPwd", DelcommentPwd);
		map.put("reple_date", reple_date);
		
		int delCnt = dao.fundRepleDel(map);
			model.addAttribute("delCnt",delCnt);
			
			System.out.println("delCnt" + delCnt);	
	}
	/* 이경재 9/5 추가 해야할 것  종료 */
	
	//김일광
	// 로그인하기
	@Override
	public void loginPro(HttpServletRequest req, Model model) {
		map.put("username", req.getParameter("username"));
		map.put("password", req.getParameter("password"));
		int cnt = dao.loginPro(map);
		System.out.println("로그인 결과 : " + cnt);
		model.addAttribute("cnt", cnt);
	}
	
	// 아이디 중복확인
	@Override
	public void confirmId(HttpServletRequest req, Model model) {
		String username = req.getParameter("username");
		int cnt = dao.idCheck(username);
		model.addAttribute("selectCnt", cnt);
		model.addAttribute("username", username);
	}
	
	// 연락처 중복확인 및 인증
	@Override
	public void confirmHp(HttpServletRequest req, Model model) throws Exception {
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
			String content = "[EZ-FUND]회원가입 인증 번호는 " + numStr + "입니다. 3분안에 입력하시길 바랍니다.";
			
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
			String content = "[EZ-FUND]패스워드 찾기 인증 번호는 " + numStr + "입니다. 3분안에 입력하시길 바랍니다.";
			
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
		FundingVO vo = new FundingVO();
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
	
	@Override
	public void idHpCheck(HttpServletRequest req, Model model) throws Exception {
		String hp = req.getParameter("hp");
		String name = req.getParameter("name");
		System.out.println("hp1 : " + hp);
		System.out.println("name : " + name);
		map.put("name", name);
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
			String content = "[EZ-FUND]계정 찾기 인증 번호는 " + numStr + "입니다. 3분안에 입력하시길 바랍니다.";
			
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
	public void showId(HttpServletRequest req, Model model) {
		String hp = req.getParameter("hp");
		System.out.println("hp2 : " + hp);
		FundingVO vo = dao.findId(hp);
		model.addAttribute("dto", vo);
	}
	
	@Override
	public void writeNotice(HttpServletRequest req, Model model) {
		int notice_id = 0;
		
		if(req.getParameter("notice_id") != null) {
			notice_id = Integer.parseInt(req.getParameter("notice_id"));}
		model.addAttribute("notice_id", notice_id);		
	}

	@Override
	public void writeNoticePro(HttpServletRequest req, Model model) {
		NoticeVO vo = new NoticeVO();
		
		vo.setNotice_id(Integer.parseInt(req.getParameter("notice_id")));
		vo.setNotice_subject(req.getParameter("notice_subject"));
		vo.setNotice_kind(req.getParameter("notice_kind"));
		vo.setNotice_date(new Timestamp(System.currentTimeMillis()));
		vo.setNotice_content(req.getParameter("notice_content"));
		
		int insertCnt = dao.insertNotice(vo);
		model.addAttribute("insertCnt", insertCnt);
	}
	
	@Override
	public void writeEventPro(HttpServletRequest req, Model model) {
		NoticeVO vo = new NoticeVO();
		
		vo.setNotice_id(Integer.parseInt(req.getParameter("notice_id")));
		vo.setNotice_subject(req.getParameter("event_subject"));
		vo.setNotice_kind(req.getParameter("notice_kind"));
		vo.setNotice_date(new Timestamp(System.currentTimeMillis()));
		vo.setNotice_content(req.getParameter("event_content"));
		
		int insertCnt = dao.insertEvent(vo);
		model.addAttribute("insertCnt", insertCnt);
	}
	
	@Override
	public void allNoticeList(HttpServletRequest req, Model model) {
		int pageSize = 100; 	// 한 페이지에 보이게 할 글 갯수
		int pageBlock = 3; 		// 한 블럭당 페이지 갯수
		int cnt = 0; 			// 글의 갯수
		int start = 0; 			// 현재 페이지의 시작 글번호
		int end = 0; 			// 현재 페이지의 마지막 글번호
		int number = 0; 		// 출력용 글번호
		String pageNum = "";	// 페이지 번호
		int currentPage = 0;	// 현재 페이지
		int pageCount = 0;		// 페이지 갯수
		int startPage = 0;		// 시작 페이지
		int endPage = 0;		// 마지막 페이지
		
		cnt = dao.allNoticeCount();
		System.out.println("cnt : " + cnt);

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
			List<NoticeVO> dto = dao.allNoticeList(map);
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
	public void noticeList(HttpServletRequest req, Model model) {
		int pageSize = 100; 	// 한 페이지에 보이게 할 글 갯수
		int pageBlock = 3; 		// 한 블럭당 페이지 갯수
		int cnt = 0; 			// 글의 갯수
		int start = 0; 			// 현재 페이지의 시작 글번호
		int end = 0; 			// 현재 페이지의 마지막 글번호
		int number = 0; 		// 출력용 글번호
		String pageNum = "";	// 페이지 번호
		int currentPage = 0;	// 현재 페이지
		int pageCount = 0;		// 페이지 갯수
		int startPage = 0;		// 시작 페이지
		int endPage = 0;		// 마지막 페이지
		
		cnt = dao.allNoticeCount();
		System.out.println("cnt : " + cnt);

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
			List<NoticeVO> dtos = dao.noticeList(map);
			model.addAttribute("dtos", dtos);	// 큰바구니 : 게시글목록 cf) 작은바구니 : 게시글 1건
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
	public void eventList(HttpServletRequest req, Model model) {
		int pageSize = 100; 	// 한 페이지에 보이게 할 글 갯수
		int pageBlock = 3; 		// 한 블럭당 페이지 갯수
		int cnt = 0; 			// 글의 갯수
		int start = 0; 			// 현재 페이지의 시작 글번호
		int end = 0; 			// 현재 페이지의 마지막 글번호
		int number = 0; 		// 출력용 글번호
		String pageNum = "";	// 페이지 번호
		int currentPage = 0;	// 현재 페이지
		int pageCount = 0;		// 페이지 갯수
		int startPage = 0;		// 시작 페이지
		int endPage = 0;		// 마지막 페이지
		
		cnt = dao.allNoticeCount();
		System.out.println("cnt : " + cnt);

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
			List<NoticeVO> dtot = dao.eventList(map);
			model.addAttribute("dtot", dtot);	// 큰바구니 : 게시글목록 cf) 작은바구니 : 게시글 1건
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
	public void noticeForm(HttpServletRequest req, Model model) {
		int notice_id = Integer.parseInt(req.getParameter("notice_id"));
		
		NoticeVO vo = dao.noticeInfo(notice_id);
		
		model.addAttribute("dto", vo);
	}
	
	@Override
	public void deleteNotice(HttpServletRequest req, Model model) {
		int notice_id = Integer.parseInt(req.getParameter("notice_id"));
		
		int cnt = dao.deleteNotice(notice_id);
		
		model.addAttribute("cnt", cnt);
	}
	
	@Override
	public void modifyNoticePro(HttpServletRequest req, Model model) {
		map.put("notice_id", Integer.parseInt(req.getParameter("notice_id")));
		map.put("notice_subject", req.getParameter("notice_subject"));
		map.put("notice_content", req.getParameter("notice_content"));
		
		int cnt = dao.modifyNotice(map);
		
		model.addAttribute("cnt", cnt);
	}
	
	
	@Override
	public void memberBoard(HttpServletRequest req, Model model) {
		int pageSize = 100;
		int pageBlock = 3;
		int memcnt = 0;
		int start = 0;
		int end = 0;
		int number = 0;
		String pageNum = "";
		int currentPage = 0;
		int pageCount = 0;
		int startPage = 0;
		int endPage = 0;
		
		memcnt = dao.memberCount();
		System.out.println("memcnt : " + memcnt);

		pageNum = req.getParameter("pageNum");

		if(pageNum == null) {
			pageNum = "1";
		}
		currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage : " + currentPage);
		pageCount = (memcnt / pageSize) + (memcnt % pageSize > 0 ? 1 : 0);
		start = (currentPage - 1) * pageSize + 1;
		end = start + pageSize - 1;
		System.out.println("start : " + start + " " + "end : " + end);
		if(end > memcnt) end = memcnt;
		number = memcnt - (currentPage - 1) * pageSize;
		System.out.println("number : " + number + " " + "pageSize : " + pageSize);
		if(memcnt > 0) {
			map.put("start", start);
			map.put("end", end);
			List<BoardVO> dtob = dao.boardCount(map);
			model.addAttribute("dtob", dtob);
		}
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		System.out.println("srartPage : " + startPage);
		endPage = startPage + pageBlock - 1;
		if(endPage > pageCount) endPage = pageCount;
		int board_cnt = dao.board_cnt();
		int board_rp_cnt = dao.board_rp_cnt();
		System.out.println("endPage : " + endPage);
		model.addAttribute("memcnt", memcnt);
		model.addAttribute("board_cnt", board_cnt);
		model.addAttribute("board_rp_cnt", board_rp_cnt);
		model.addAttribute("number", number);
		model.addAttribute("pageNum", pageNum);
		if(memcnt > 0) {
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("pageBlock", pageBlock);
			model.addAttribute("pageCount", pageCount);
			model.addAttribute("currentPage", currentPage);
		}
	}
	
	@Override
	public void findingCount(HttpServletRequest req, Model model) {
		int fundingCnt = dao.fundingHost();
		model.addAttribute("fundingCnt", fundingCnt);
	}
	
	@Override
	public void quiryList(HttpServletRequest req, Model model) {
		String writer = req.getParameter("writer");
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

		cnt = dao.getArticleCnt();
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
			map.put("writer", writer);
			List<FundInquiryVO> dtos = dao.getArticleList(map);
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
		
		dao.addReadCnt(num);
		FundInquiryVO vo = dao.getArticle(num);
		map.put("num", num);
		List<FundInquiryVO> dtos = dao.boardCommentList(map);
		
		model.addAttribute("dto",vo);
		model.addAttribute("dtos", dtos);
		model.addAttribute("num",num);
	}


	@Override
	public void userWriterForm(HttpServletRequest req, Model model) {
		int num = 0;
		int ref = 1;
		int ref_step = 0; // 글순서(행)
		int ref_level = 0;// 글레벨(들여쓰기)
		
		if(req.getParameter("num")!=null) { // 즉 값이 있는경우
			num = Integer.parseInt(req.getParameter("num"));
			ref = Integer.parseInt(req.getParameter("ref"));
			ref_step = Integer.parseInt(req.getParameter("ref_step"));
			ref_level = Integer.parseInt(req.getParameter("ref_level"));
			System.out.println("ref_step" + ref_step);
			System.out.println("ref_level" + ref_level);
		}
		
		model.addAttribute("num", num);
		model.addAttribute("ref", ref);
		model.addAttribute("ref_step", ref_step);
		model.addAttribute("ref_level", ref_level);
	
	}
	
	@Override
	public void writePro(HttpServletRequest req, Model model) {
		FundInquiryVO vo = new FundInquiryVO();
		String writer = req.getParameter("writer");
		String username = req.getParameter("username");
		System.out.println("username : " + username);
		
		vo.setNum(Integer.parseInt(req.getParameter("num")));
		
		vo.setWriter(writer);
		vo.setSubject(req.getParameter("notice_subject"));
		vo.setContent(req.getParameter("notice_content"));
		
		vo.setReg_date(new Timestamp(System.currentTimeMillis()));
		int insertCnt = dao.insertBoard(vo);
		if(insertCnt >= 1) {
			dao.updateBoardCount(username);
		}
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
		FundInquiryVO vo =null;
		
		// 6단계. request나 session에 처리 결과를 저장(jsp에 전달하기 위함)
		model.addAttribute("dto", vo);
		model.addAttribute("num", num);
	}
	
	// 글수정 완료
	@Override
	public void modifyPro(HttpServletRequest req, Model model) {
		// 3단계. 화면으로부터 입력받은 값을 받아온다.
		int num = Integer.parseInt(req.getParameter("num"));
		// 바구니 생성
		FundInquiryVO vo = new FundInquiryVO();
		
		vo.setNum(num);
		vo.setSubject(req.getParameter("notice_subject"));
		vo.setContent(req.getParameter("notice_content"));
		// 4단계. 다형성 적용, 싱글톤 방식으로 dao 객체를 생성
		//BoardDAO dao = BoardDAOImpl.getInstance();
		
		// 5단계. 글수정 처리
		int updateCnt = dao.updateBoard(vo);
		// 6단계. request나 session에 처리 결과를 저장(jsp에 전달하기 위함)
		model.addAttribute("updateCnt", updateCnt);
		model.addAttribute("num", num);
		
	}
	
	// 글 삭제
	@Override
	public void userdeletePro(HttpServletRequest req, Model model) {
		int num = Integer.parseInt(req.getParameter("num"));
		String username = req.getParameter("writer");
		System.out.println("username");
		Map<String, Object> map =  new HashMap<String, Object>();
		map.put("num", num);
		int deleteCnt = 0;
		System.out.println("username : " + username);
		int inquiry = dao.inquiryComment(num);
		if(inquiry > 0) {
			dao.minusBoardComment(username);
		}
		deleteCnt = dao.deleteBoard(num);
		dao.minusBoardCount(username);
		
		model.addAttribute("deleteCnt", deleteCnt);
	}
	
	@Override
	public void board_comment(HttpServletRequest req, Model model) {
		FundInquiryVO vo = new FundInquiryVO();
		String writer = req.getParameter("username");
		
		vo.setNum(Integer.parseInt(req.getParameter("num")));
		vo.setWriter(writer);
		vo.setContent(req.getParameter("editor1"));
		
		int insertCnt = dao.insertBoardComment(vo);
		dao.updateBoardComment(req.getParameter("username"));
		dao.updateReply_cnt(Integer.parseInt(req.getParameter("num")));
		
		model.addAttribute("insertCnt", insertCnt);
	}
	
	@Override
	public void confirmSession(HttpServletRequest req, Model model) {
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		
		System.out.println("Fund username : " + username);
		System.out.println("Fund password : " + password);

		model.addAttribute("username", username);
		model.addAttribute("password", password);
	}

	//김일광종료
	
	//스마트컨트랙트
	//컨트랙트 생성
	@Override
	public void createContract(HttpServletRequest req, Model model) {
		
		Web3j web3j = Web3j.build(new HttpService("HTTPS://ropsten.infura.io/v3/dbf0b2dbcbcf48d1a333d6b5626dc6c0"));
		
		//Web3jConfig web3jConfig = new Web3jConfig();
		//Web3j web3j = Web3j.build(web3jConfig.buildService("HTTPS://ropsten.infura.io/v3/dbf0b2dbcbcf48d1a333d6b5626dc6c0"));
		Credentials credentials = Credentials.create(PRIVATE_KEY);
		
		String contractAddress = "";
		
		//update ver2
		try {
			contractAddress = Investment3.deploy(web3j, credentials, GAS_PRICE, GAS_LIMIT).send().getContractAddress();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(contractAddress);
		
		String fundcode = "";
		
		Random random = new Random();
		
		for(int i = 0; i < 7; i++) {
			fundcode += Integer.toString(random.nextInt(10));
		}
		
		
		
		String username = "host";
		fundcode = req.getParameter("fund_id");
		System.out.println(fundcode);
		/*if(!contractAddress.equals("")) {
			int result = dao.createContract(fundcode, contractAddress, username);
			
			model.addAttribute("result", result);
		}*/
	}

	@Override
	public void getContract(HttpServletRequest req, Model model) {
		String fundcode = req.getParameter("fundcode");
		
		//if(fundcode == null) fundcode = "7400661";
		if(fundcode == null) fundcode = "5916347";
		
		ContractVO cvo = dao.getContract(fundcode);
		
		System.out.println(cvo.getFund_id());
		System.out.println(cvo.getFund_contract_address());
		System.out.println(cvo.getFund_contract_totalindex());
		Web3j web3j = Web3j.build(new HttpService("HTTPS://ropsten.infura.io/v3/dbf0b2dbcbcf48d1a333d6b5626dc6c0"));
		//Web3j web3j = Web3j.build(new HttpService("HTTPS://ropsten.infura.io/v3/dbf0b2dbcbcf48d1a333d6b5626dc6c0"));
		Credentials credentials = Credentials.create(PRIVATE_KEY);
		
		//update ver2
		//Investment investment = Investment.load(cvo.getFund_contract_address(), web3j, credentials, GAS_PRICE, GAS_LIMIT);
		Investment3 investment = Investment3.load(cvo.getFund_contract_address(), web3j, credentials, GAS_PRICE, GAS_LIMIT);
		System.out.println(investment.getContractAddress());
	}
	
	@Transactional(rollbackFor=Exception.class)
	@Override
	public void callContract(HttpServletRequest req, Model model) throws Exception {
		try {
			String fundcode = req.getParameter("fundcode");
			String username = req.getParameter("username");
			String investvolume = req.getParameter("investvolume");
			//if(fundcode == null) fundcode = "7400661";
			//if(fundcode == null) fundcode = "5916347";
			//if(username == null) username = "testkg";
			//if(investvolume == null) investvolume = "5";
			
			String callContractAddress = null;
			
			ContractVO cvo = dao.getContract(fundcode);
			
			Map<String, Object> map = new HashMap<>();
			Map<String, Object> map2 = new HashMap<>();
			
			map.put("fund_id", fundcode);
			map.put("username", username);
			map.put("fund_contract_index", cvo.getFund_contract_totalindex());
			
			FundStockInfVO Stockvo = dao.stockInf(Integer.valueOf(fundcode));
			
			
			map2.put("username", username);
			map2.put("totalPrice", Stockvo.getfund_min_invest()*Integer.valueOf(investvolume));
			
			//Web3j web3j = Web3j.build(new HttpService("HTTPS://ropsten.infura.io/v3/dbf0b2dbcbcf48d1a333d6b5626dc6c0"));
			Web3j web3j = Web3j.build(new HttpService("HTTPS://ropsten.infura.io/v3/dbf0b2dbcbcf48d1a333d6b5626dc6c0"));
			
			Credentials credentials;
			
			credentials = Credentials.create(PRIVATE_KEY);
			
			Investment3 investment = Investment3.load(cvo.getFund_contract_address(), web3j, credentials, GAS_PRICE, GAS_LIMIT);
			
			System.out.println(investment.getContractAddress());
			byte[] investorname = stringToBytes32(username);
			int index = cvo.getFund_contract_totalindex();
			int investnumber = Integer.parseInt(cvo.getFund_id());
			int volume = Integer.parseInt(investvolume);
			
			investment.buyInvest(BigInteger.valueOf(index), investorname, BigInteger.valueOf(investnumber), BigInteger.valueOf(volume), BigInteger.valueOf(1)).send();
			
			dao.createTransaction(map);
			dao.plusContractIndex(fundcode);
			int result = dao.updateAccount(map2);
			dao.updateHostAccount(map2);
			System.out.println(result);
			model.addAttribute("result", result);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	//StringToBytes32
    public static byte[] stringToBytes32(String string) {
        byte[] byteValue = string.getBytes();
        byte[] byteValueLen32 = new byte[32];
        System.arraycopy(byteValue, 0, byteValueLen32, 0, byteValue.length);
        return byteValueLen32;
    }
    
    //Bytes32toString
    public static String hexToASCII(String hexValue){
        StringBuilder output = new StringBuilder("");
        for (int i = 0; i < hexValue.length(); i += 2)
        {
            String str = hexValue.substring(i, i + 2);
            output.append((char) Integer.parseInt(str, 16));
        }
        return output.toString();
    }
    
    
    @Override
    public void getInvestors(HttpServletRequest req, Model model) throws Exception {
    	String fundcode = req.getParameter("fundcode");
    	
    	Web3j web3j = Web3j.build(new HttpService("HTTPS://ropsten.infura.io/v3/dbf0b2dbcbcf48d1a333d6b5626dc6c0"));
		
		Credentials credentials;
		
		credentials = Credentials.create(PRIVATE_KEY);
		ContractVO cvo = dao.getContract(fundcode);
		Investment3 investment = Investment3.load(cvo.getFund_contract_address(), web3j, credentials, GAS_PRICE, GAS_LIMIT);
		
		System.out.println(cvo.getFund_id());
		System.out.println(cvo.getFund_contract_address());
		System.out.println(cvo.getFund_contract_totalindex());
		int index = cvo.getFund_contract_totalindex();
		
		for(int i = 0; i < index; i++) {
			Tuple3<byte[], BigInteger, BigInteger> investorInfo = investment.getInvestorInfo(BigInteger.valueOf(i)).send();
	    	
	    	System.out.println(hexToASCII(Numeric.toHexStringNoPrefix(investorInfo.getValue1())));
			System.out.println(investorInfo.getValue2().intValue());
			System.out.println(investorInfo.getValue3().intValue());
		}
    }
    
    @Override
	public void accountInfo(HttpServletRequest req, Model model) {
		String username = req.getParameter("username");
		AccountVO vo = dao.accountInfo(username);
		model.addAttribute("vo",vo);
	}

  //펀드 갯수 확인
	@Override
	public void fundCount(HttpServletRequest req, Model model) {
		//스타트업
		int startup = dao.startupCount();
		//문화컨텐츠
		int culture = dao.cultureCount();
		
		model.addAttribute("startup",startup);
		model.addAttribute("culture",culture);
	}
	
	
	 // ==============펀드 리스트 갖고오기(paging 처리 없음) -  아진 추가 2019.09.17 ================
	 @Override
	 public void fundingList(HttpServletRequest req, Model model) {
	    List<funding_stock_info_allVO> fundingList = dao.allfundList();
	    List<funding_stock_info_allVO> fundingCList = new ArrayList<>();
	    List<funding_stock_info_allVO> fundingSList = new ArrayList<>();
	    List<funding_stock_info_allVO> fundingTotalList = new ArrayList<>();
        List<String> s = new ArrayList<String>();
        List<String> c = new ArrayList<String>();
        List<String> opens = new ArrayList<String>();
        List<String> openc = new ArrayList<String>();
        Date date = new Date();
        
        Web3j web3j = Web3j.build(new HttpService("HTTPS://ropsten.infura.io/v3/dbf0b2dbcbcf48d1a333d6b5626dc6c0"));
		
		Credentials credentials;
		
		credentials = Credentials.create(PRIVATE_KEY);
	      
        for(int i=0; i<fundingList.size(); i++) {
           String two = fundingList.get(i).getFund_content_div();
           Timestamp startDate = fundingList.get(i).getfund_schedule_date();
           ContractVO cvo = dao.getContract(Integer.toString(fundingList.get(i).getFund_id()));
           try {
                 long today = date.getTime();
                 long start = startDate.getTime();
               
               if(today > start) {  // 이미오픈함 
            	   if(two.equals("s")) {
            		   s.add(two);
            		   
            		   Investment3 investment = Investment3.load(cvo.getFund_contract_address(), web3j, credentials, GAS_PRICE, GAS_LIMIT);
            		   int total_volume = 0;
            		   System.out.println("fund_id : " + cvo.getFund_id());
            		   System.out.println("totalindex : " + cvo.getFund_contract_totalindex());
            		   for(int index = 0; index < cvo.getFund_contract_totalindex(); index++) {
            			   Tuple3<byte[], BigInteger, BigInteger> investorInfo = investment.getInvestorInfo(BigInteger.valueOf(index)).send();
            			   total_volume += investorInfo.getValue3().intValue();
            		   }
            		   
            		   System.out.println(fundingList.get(i).getfund_min_invest());
            		   fundingList.get(i).setfund_eval_value(total_volume * fundingList.get(i).getfund_min_invest());
            		   System.out.println(fundingList.get(i).getFund_id() + "'s totalvolume : " + fundingList.get(i).getfund_eval_value());
            		   
            		   fundingSList.add(fundingList.get(i));
            		   fundingTotalList.add(fundingList.get(i));
            	   }else if(two.equals("c")) {
            		   c.add(two);
            		   
            		   Investment3 investment = Investment3.load(cvo.getFund_contract_address(), web3j, credentials, GAS_PRICE, GAS_LIMIT);
            		   int total_volume = 0;
            		   System.out.println("fund_id : " + cvo.getFund_id());
            		   System.out.println("totalindex : " + cvo.getFund_contract_totalindex());
            		   for(int index = 0; index < cvo.getFund_contract_totalindex(); index++) {
            			   Tuple3<byte[], BigInteger, BigInteger> investorInfo = investment.getInvestorInfo(BigInteger.valueOf(index)).send();
            			   total_volume += investorInfo.getValue3().intValue();
            		   }
            		   
            		   System.out.println(fundingList.get(i).getfund_min_invest());
            		   fundingList.get(i).setfund_eval_value(total_volume * fundingList.get(i).getfund_min_invest());
            		   System.out.println(fundingList.get(i).getFund_id() + "'s totalvolume : " + fundingList.get(i).getfund_eval_value());
            		   
            		   fundingCList.add(fundingList.get(i));
            		   fundingTotalList.add(fundingList.get(i));
            	   }
               }else{  // 오픈전
            	   if(two.equals("s")) {
            		   opens.add(two);
            	   }else if(two.equals("c")) {
            		   openc.add(two);
            	   }
               }
           }catch(Exception e){
        	   e.printStackTrace();
           }
           
        }
	      
        model.addAttribute("startupCnt", s.size()); //오픈 스타트업
        model.addAttribute("cultureCnt", c.size()); //오픈 문화
        model.addAttribute("openstartupCnt", opens.size()); // 미오픈 스타트업
        model.addAttribute("opencultureCnt", openc.size()); // 미오픈 문화
        model.addAttribute("fundingList", fundingList);
        model.addAttribute("fundingSList", fundingSList);
        model.addAttribute("fundingCList", fundingCList);
        model.addAttribute("fundingTotalList", fundingTotalList);
     }
	 
	 @Override
	public void memberList(HttpServletRequest req, Model model) {
		int pageSize = 100;
		int pageBlock = 3;
		int memcnt = 0;
		int start = 0;
		int end = 0;
		int number = 0;
		String pageNum = "";
		int currentPage = 0;
		int pageCount = 0;
		int startPage = 0;
		int endPage = 0;
		
		memcnt = dao.memberCount();
		System.out.println("memcnt : " + memcnt);

		pageNum = req.getParameter("pageNum");

		if(pageNum == null) {
			pageNum = "1";
		}
		currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage : " + currentPage);
		pageCount = (memcnt / pageSize) + (memcnt % pageSize > 0 ? 1 : 0);
		start = (currentPage - 1) * pageSize + 1;
		end = start + pageSize - 1;
		System.out.println("start : " + start + " " + "end : " + end);
		if(end > memcnt) end = memcnt;
		number = memcnt - (currentPage - 1) * pageSize;
		System.out.println("number : " + number + " " + "pageSize : " + pageSize);
		if(memcnt > 0) {
			map.put("start", start);
			map.put("end", end);
			List<FundingVO> dtom = dao.memberList(map);
			model.addAttribute("dtom", dtom);
		}
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		System.out.println("srartPage : " + startPage);
		endPage = startPage + pageBlock - 1;
		if(endPage > pageCount) endPage = pageCount;
		System.out.println("endPage : " + endPage);
		model.addAttribute("memcnt", memcnt);
		model.addAttribute("number", number);
		model.addAttribute("pageNum", pageNum);
		if(memcnt > 0) {
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("pageBlock", pageBlock);
			model.addAttribute("pageCount", pageCount);
			model.addAttribute("currentPage", currentPage);
		}
	}

	@Override
	public void getMyAccount(HttpServletRequest req, Model model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication(); 
		User user = (User) authentication.getPrincipal(); 
		String username = user.getUsername();
		
		AccountVO vo = dao.accountInfo(username);
		model.addAttribute("vo",vo);
	}

	@Override
	public void getMyOwnTransaction(HttpServletRequest req, Model model) throws Exception {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication(); 
		User user = (User) authentication.getPrincipal(); 
		String username = user.getUsername();
		
		List<FundingTransactionVO> ftlist = dao.getMyOwnTransaction(username);
		
		Web3j web3j = Web3j.build(new HttpService("HTTPS://ropsten.infura.io/v3/dbf0b2dbcbcf48d1a333d6b5626dc6c0"));
		
		Credentials credentials;
		
		credentials = Credentials.create(PRIVATE_KEY);
		
		System.out.println(ftlist.size());
		
		for(int i = 0; i < ftlist.size(); i++) {
			Investment3 investment = Investment3.load(ftlist.get(i).getFund_contract_address(), web3j, credentials, GAS_PRICE, GAS_LIMIT);
			int index = ftlist.get(i).getFund_contract_index();
			System.out.println(ftlist.get(i).getFund_contract_address());
			
			Tuple3<byte[], BigInteger, BigInteger> investorInfo = investment.getInvestorInfo(BigInteger.valueOf(index)).send();
			
			System.out.println(investorInfo.getValue3().intValue());
			
			ftlist.get(i).setInvestvolume(investorInfo.getValue3().intValue());
		}
		
		model.addAttribute("ftlist", ftlist);
		
	}
	
	@Override
	public void applicationFund(HttpServletRequest req, Model model) {
		Fund_reserveVO vo = new Fund_reserveVO();
		 
		vo.setCompany_name(req.getParameter("company"));
		vo.setUsername(req.getParameter("name"));
		vo.setClient_email(req.getParameter("email"));
		vo.setClient_ph(req.getParameter("phone"));
		vo.setCompany_site(req.getParameter("sns"));
		vo.setTarget_invest(Integer.parseInt(req.getParameter("price")));
		int fund_path = Integer.parseInt(req.getParameter("fund_path"));
		vo.setHtk_number(fund_path);
		if(fund_path == 4) {
			String fund_path_etc = req.getParameter("fund_path_etc");
			vo.setHtk_content(fund_path_etc);
		} else {
			String fund_path_etc = "";
			vo.setHtk_content(fund_path_etc);
		}
		vo.setClient_message(req.getParameter("message"));
		
		int insertCnt = dao.applicationFund(vo);
		model.addAttribute("insertCnt", insertCnt);
	}
	
	@Override
	public void requestFundingList(HttpServletRequest req, Model model) {
		int pageSize = 100;
		int pageBlock = 3;
		int fundCount = 0;
		int start = 0;
		int end = 0;
		int number = 0;
		String pageNum = "";
		int currentPage = 0;
		int pageCount = 0;
		int startPage = 0;
		int endPage = 0;
		
		fundCount = dao.requestFundCount();
		System.out.println("fundCount : " + fundCount);

		pageNum = req.getParameter("pageNum");

		if(pageNum == null) {
			pageNum = "1";
		}
		currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage : " + currentPage);
		pageCount = (fundCount / pageSize) + (fundCount % pageSize > 0 ? 1 : 0);
		start = (currentPage - 1) * pageSize + 1;
		end = start + pageSize - 1;
		System.out.println("start : " + start + " " + "end : " + end);
		if(end > fundCount) end = fundCount;
		number = fundCount - (currentPage - 1) * pageSize;
		System.out.println("number : " + number + " " + "pageSize : " + pageSize);
		if(fundCount > 0) {
			map.put("start", start);
			map.put("end", end);
			List<Fund_reserveVO> dtof = dao.requestFundList(map);
			model.addAttribute("dtof", dtof);
		}
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		System.out.println("srartPage : " + startPage);
		endPage = startPage + pageBlock - 1;
		if(endPage > pageCount) endPage = pageCount;
		System.out.println("endPage : " + endPage);
		model.addAttribute("fundCount", fundCount);
		model.addAttribute("number", number);
		model.addAttribute("pageNum", pageNum);
		if(fundCount > 0) {
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("pageBlock", pageBlock);
			model.addAttribute("pageCount", pageCount);
			model.addAttribute("currentPage", currentPage);
		}
	}

	@Override
	public void confirmRequestFund(HttpServletRequest req, Model model) {
		int reserve_id = Integer.parseInt(req.getParameter("reserve_id"));
		Fund_reserveVO vo = dao.confirmFund(reserve_id);
		model.addAttribute("dto", vo);
	}
	
	@Override
	public void completeConfirm(HttpServletRequest req, Model model) {
		int reserve_id = Integer.parseInt(req.getParameter("reserve_id"));
		dao.completeConfirm(reserve_id);
	}

	
}