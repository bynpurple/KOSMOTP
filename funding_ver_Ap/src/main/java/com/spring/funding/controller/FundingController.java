package com.spring.funding.controller;

import java.nio.file.AccessDeniedException;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

import com.spring.funding.controller.FundingController;
import com.spring.funding.persistence.FundingDAO;
import com.spring.funding.service.FundingService;

@Controller
public class FundingController {
	private static final Logger logger = LoggerFactory.getLogger(FundingController.class);
	
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	private FundingDAO dao;
	
	@Autowired
	private FundingService service;
	
	@RequestMapping("/user/main")
	public String main(HttpServletRequest req,Model model) {
		logger.info("funding 첫 메인 화면");
		service.fundingList(req, model);
		return "user/main";
	}
	
	// 펀딩하기 > 오픈 예정
	@RequestMapping("/user/bescheduled")
	public String bescheduled(HttpServletRequest req, Model model) {
		logger.info("bescheduled");
		//service.fundCount(req, model);
		// ============== 아진 추가 2019.09.17 ================
		service.fundingList(req, model);
		return "user/tobeopenlist";
	}
   // 회원가입 처리
   @RequestMapping("user/insertUser")
   public String insertUser(@RequestParam(value="username", required = false) String username,
         @RequestParam(value = "password", required = false) String password,
         @RequestParam String name,
         @RequestParam(value="authority", required = false) String authority,
         @RequestParam String hp) {
      Map<String, String> map = new HashMap<String, String>();
      map.put("username", username);
      System.out.println("암호화 전 비밀번호 : " + password);
      String encPassword = passwordEncoder.encode(password);
      System.out.println("암호화 후 비밀번호 : " + encPassword);
      map.put("password", encPassword);
      map.put("name", name);
      map.put("authority", authority);
      map.put("hp", hp);
      int cnt = dao.insertUser(map);
      dao.insertBoard_member(map);

      // ============== 계좌 생성 - 아진 추가 2019.09.17 ================
	  if (cnt > 0) {
		 Map<String, Object> accountMap = new HashMap<String, Object>();

		 Random random = new Random();
		 String number = "";

		 // 난수 생성 4자리
		 for (int i = 0; i < 4; i++) {
		   	number += Integer.toString(random.nextInt(10));
		 }

		 System.out.println(number);
		 String account = "110-111-" + number;
		 System.out.println("계좌확인" + account);

		 accountMap.put("account", account);
		 accountMap.put("username", username);
		 accountMap.put("password", 1234);
		 accountMap.put("money", 10000000);

		 int accountCnt = dao.createAccount(accountMap);
		 System.out.println("1 이면 계좌 생성완료!" + accountCnt);
	 }
      return "user/login";
   }
	// 펀딩하기 > 리스트
	@RequestMapping("/user/fundinglist")
	public String fundinglist(HttpServletRequest req, Model model) {
		logger.info("fundinglist");
		//service.fundCount(req, model);
	    // ============== 아진 추가 2019.09.17 ================
	    service.fundingList(req,model);
		return "user/fundinglist";
	}
	
	// 펀딩 받기
	@RequestMapping("/user/gotfund")
	public String gotfund() {
		logger.info("gotfund 펀딩신청");
		return "user/gotfund";
	}
	
	// 정보 라운지 > 크라우드 펀딩
	@RequestMapping("/user/crowdfunding")
	public String crownfunding() {
		logger.info("crowdfunding");
		return "user/crowdfunding";
	}
	
	// 더보기 > 소개 > 회사 소개
	@RequestMapping("/user/about-us")
	public String aboutus() {
		logger.info("about us");
		return "user/about-us";
	}
	
	// 더보기 > 공지 > FAQ
	@RequestMapping("/user/faq")
	public String faq() {
		logger.info("faq");
		return "user/faq";
	}
	
	// 더보기 > 공지 > 공지사항
	@RequestMapping("/user/notice")
	public String notice(HttpServletRequest req, Model model) {
		logger.info("notice");
		service.allNoticeList(req, model);
		service.noticeList(req, model);
		service.eventList(req, model);
		return "board/notice";
	}
	
	// 로그인
	@RequestMapping("/user/login")
	public String login() {
		logger.info("login");
		return "user/login";
	}
	
	// 권한이 없는 사용자에게 안내 페이지 출력 - 403에러
	@RequestMapping("/user/denied")
	public String denied(HttpServletRequest req, Model model,Authentication auto) {
		logger.info("경로 : denied");
		AccessDeniedException ade = (AccessDeniedException)req.getAttribute(WebAttributes.ACCESS_DENIED_403);
		
		model.addAttribute("errMsg", ade);
		return "user/denied";
	}
	
	// 로그인 하기
	@RequestMapping("/user/loginPro")
	public String loginPro(HttpServletRequest req, Model model) {
		logger.info("경로 : loginPro");
		service.loginPro(req, model);
		return "user/loginPro";
	}
	
	// 테스트
	@RequestMapping("/test")
	public String test() {
		logger.info("test");
		return "user/test";
	}
	
	// 펀드 에디터 첫 페이지
	@RequestMapping("/user/editor")
	public String editor(HttpServletRequest req, Model model) {
		logger.info("editor");
		return "admin/editor";
	}
	/* 이경재 9/5 추가 해야할 것  시작 */
	// 펀딩하기 > 리스트 > 상세 페이지
	@RequestMapping("/user/fundingdetail")
	public String fundingdetail(HttpServletRequest req, Model model) {
		logger.info("fundingdetail");
		service.fundingDetail(req, model);
		service.fundCommnetView(req, model);
		
		return "user/fundingdetail";
	}
	// 에디터 1
	@RequestMapping("/user/editor1")
	public String editor1(HttpServletRequest req, Model model) {
		logger.info("editor1");
		service.editor(req, model);
		
		return "admin/editor1";
	}

	// 에디터 2
	@RequestMapping("/user/editor2")
	public String editor2(HttpServletRequest req, Model model) {
		logger.info("editor2");
		service.editor1(req, model);
		
		return "admin/editor2";
	}
	
	// 펀딩 작성 완료 페이지
	@RequestMapping("/user/editorCompleted")
	public String editorCompleted(HttpServletRequest req, Model model) {
		logger.info("editorCompleted");
		service.editorCompleted(req, model);
		
		return "admin/editorCompleted";
	}
	
	// 수정 용 펀드 에디터 첫 페이지
	@RequestMapping("/user/modifyEditor")
	public String modifyEditor(HttpServletRequest req, Model model) {
		logger.info("modifyEditor");
		service.fundingDetail(req, model);
		
		return "admin/modifyEditor";
	}
	// 수정 용 펀드 에디터 페이지2
	@RequestMapping("/user/modifyEditor1")
	public String modifyEditor1(HttpServletRequest req, Model model) {
		logger.info("modifyEditor1");
		service.fundingDetail(req, model);
		service.Modifyeditor(req, model);
		
		return "admin/modifyEditor1";
	}
	// 수정 용 펀드 에디터 페이지3
	@RequestMapping("/user/modifyEditor2")
	public String modifyEditor2(HttpServletRequest req, Model model) {
		logger.info("modifyEditor2");
		service.fundingDetail(req, model);
		service.editor1(req, model);
		
		return "admin/modifyEditor2";
	}
	
	// 편드 상세 페이지 comment
	@RequestMapping("/user/fundCommnet")
	public String fundCommnet(HttpServletRequest req, Model model) {
		logger.info("fundCommnet");
		service.fundCommnet(req, model);
		
		return "funding/fundCommnet";
	}
	
	// 펀드 코멘트 대화 창 출력
	@RequestMapping("/user/Recomment")
	public String Recomment(HttpServletRequest req, Model model) {
		logger.info("Recomment");
		service.Recomment(req, model);
		
		return "funding/Recomment";
	}
	
	// 리플 코멘트 대화 답글
	@RequestMapping("/user/replyeComment")
	public String replyeComment(HttpServletRequest req, Model model) {
		logger.info("replyeComment");
		service.Recomment(req, model);
		service.RecommentTalk(req, model);
		return "funding/replyeComment";
	}
	
	// 펀드 코멘트 삭제
	@RequestMapping("/user/deleteComment")
	public String deleteComment(HttpServletRequest req, Model model) {
		logger.info("deleteComment");
		service.fundCommnetDel(req, model);
		service.fundCommnetView(req, model);
		return "funding/deleteComment";
	}
	
	// 리플 코멘트 삭제
	@RequestMapping("/user/deleteReple")
	public String deleteReple(HttpServletRequest req, Model model) {
		logger.info("deleteReple");
		service.fundrepleDel(req, model);
		service.Recomment(req, model);
		
		return "funding/deleteReple";
	}
	/* 이경재 9/5 추가 해야할 것  끝 */
	
	//김일광
	// ID 중복확인
	@RequestMapping("/user/confirmId")
	public String confirmId(HttpServletRequest req, Model model) {
		logger.info("경로 : confirmId");
		service.confirmId(req, model);
		return "user/confirmId";
	}
	
	// 로그아웃 처리
	@RequestMapping("/user/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "user/logout";
		}
	
	// 연락처 중복확인
	@RequestMapping("/user/confirmHp")
	public String confirmHp(HttpServletRequest req, Model model) throws Exception {
		logger.info("경로 : confirmHp");
		service.confirmHp(req, model);
		return "user/confirmHp";
	}
	
	// 핸드폰 번호 인증
	@RequestMapping("/user/auth")
	public String auth(HttpServletRequest req, Model model) {
		service.checkAuth(req, model);
		return "user/auth";
	}
	
	// 회원정보 찾기
	@RequestMapping("/user/findInfo")
	public String findInfo(HttpServletRequest req, Model model) {
		return "user/findInfo";
	}
	
	// 계정 정보 찾기 - 정보(이름, hp) 입력
	@RequestMapping("/user/findId")
	public String findId(HttpServletRequest req, Model model) {
		return "user/findId";
	}
	
	// 계정 정보 찾기 - 정보 확인 후 인증번호 인증 페이지
	@RequestMapping("/user/findIdCon")
	public String findIdCon(HttpServletRequest req, Model model) throws Exception {
		service.idHpCheck(req, model);
		return "user/findIdCon";
	}
	
	// 계정 정보 찾기 - 인증 완료 시 아이디 출력 페이지
	@RequestMapping("/user/findIdChk")
	public String findIdChk(HttpServletRequest req, Model model) {
		service.showId(req, model);
		return "user/findIdChk";
	}
	
	// 계정 찾기 핸드폰 번호 인증
	@RequestMapping("/user/auth2")
	public String auth2(HttpServletRequest req, Model model) {
		service.checkAuth(req, model);
		return "user/auth2";
	}
	
	// 비밀번호 찾기1 - 정보(아이디, 이름, hp) 입력 페이지
	@RequestMapping("/user/findPwd")
	public String findPwd(HttpServletRequest req, Model model) {
		return "user/findPwd";
	}
	
	// 비밀번호 찾기2 - 정보 확인 후 인증번호 인증 페이지
	@RequestMapping("/user/findPwdCon")
	public String findPwdCon(HttpServletRequest req, Model model) throws Exception {
		service.idNameHpCheck(req, model);
		return "user/findPwdCon";
	}
	
	// 비밀번호 찾기3 - 인증번호 인증 완료 후 변경할 패스워드 입력 페이지
	@RequestMapping("/user/findPwdChk")
	public String findPwdChk(HttpServletRequest req, Model model) {
		service.insertPwd(req, model);
		return "user/findPwdChk";
	}
	
	// 비밀번호 찾기4 - 패스워드 변경 완료 페이지
	@RequestMapping("/user/modifyPwd")
	public String modifyPwd(HttpServletRequest req, Model model) {
		service.modifyPwd(req, model);
		return "user/modifyPwd";
	}
	
	// 패스워드 찾기 핸드폰 번호 인증
	@RequestMapping("/user/auth3")
	public String auth3(HttpServletRequest req, Model model) {
		service.checkAuth(req, model);
		return "user/auth3";
	}
	
	// 관리자 게시글 작성폼
	@RequestMapping("/user/writeNotice")
	public String writeNotice(HttpServletRequest req, Model model) {
		service.writeNotice(req, model);
		return "board/writeNotice";
	}
	
	// 관리자 공지사항 작성
	@RequestMapping("/user/writeNoricePro")
	public String writeNoticePro(HttpServletRequest req, Model model) {
		service.writeNoticePro(req, model);
		return "board/writeNoticePro";
	}
	
	// 관리자 이벤트 작성
	@RequestMapping("/user/wirteEventPro")
	public String writeEventPro(HttpServletRequest req, Model model) {
		service.writeEventPro(req, model);
		return "board/writeEventPro";
	}
	
	// 공지사항 상세보기
	@RequestMapping("/user/noticeContentForm")
	public String noticeContentForm(HttpServletRequest req, Model model) {
		service.noticeForm(req, model);
		return "board/noticeContentForm";
	}
	
	// 생성 이미지 URL용
	@RequestMapping("/user/images")
	public String images(HttpServletRequest req, Model model) {
		return "board/images";
	}
	
	// 공지사항 / 이벤트 삭제
	@RequestMapping("/user/deleteNotice")
	public String deleteNotice(HttpServletRequest req, Model model) {
		service.deleteNotice(req, model);
		return "board/deleteNotice";
	}
	
	// 공지사항 수정
	@RequestMapping("/user/modifyNotice")
	public String modifyNotice(HttpServletRequest req, Model model) {
		service.noticeForm(req, model);
		return "board/modifyNotice";
	}
	
	// 공지사항 수정 완료
	@RequestMapping("/user/modifyNoticePro")
	public String modifyNoticePro(HttpServletRequest req, Model model) {
		service.modifyNoticePro(req, model);
		return "board/modifyNoticePro";
	}
	
	// 관리자 페이지
	@RequestMapping("/user/hostPage")
	public String hostPage(HttpServletRequest req, Model model) {
		service.allNoticeList(req, model);
		service.memberBoard(req, model);
		service.memberList(req, model);
		service.findingCount(req, model);
		service.requestFundingList(req, model);
		return "admin/hostPage";
	}
	
	// 1대1문의 상세페이지
	@RequestMapping("/user/userInquiry")
	public String userInquiry(HttpServletRequest req, Model model) {
		logger.info("경로 : userInquiry");
		service.quiryList(req, model);
		return "user/userInquiry";
	}
		
	// 1대1문의 상세페이지
	@RequestMapping("/user/usercontentForm")
	public String usercontentForm(HttpServletRequest req, Model model) {
		logger.info("경로 : usercontentForm");
		service.contentForm(req, model);
		return "user/usercontentForm";
	}
		
	// user1대1문의 글쓰기폼
	@RequestMapping("/user/userWriterForm")
	public String userWriterForm(HttpServletRequest req, Model model) {
		logger.info("경로 : userWriterForm");
		service.userWriterForm(req, model);
		return "user/userWriterForm";
	}
		
	// user1대1문의 글쓰기 성공실패
	@RequestMapping("/user/writePro")
	public String writePro(HttpServletRequest req, Model model) {
		logger.info("경로 : writePro");
		service.writePro(req, model);
		return "user/writePro";
	}
		
	// 게시글 수정 상세페이지
	@RequestMapping("/user/usermodifyForm")
	public String usermodifyForm(HttpServletRequest req, Model model) {
		logger.info("경로 : usermodifyForm");
		service.usermodifyView(req, model);
		return "user/usermodifyForm";
	}
		
	// 게시글 수정 처리페이지
	@RequestMapping("/user/usermodifyPro")
	public String usermodifyPro(HttpServletRequest req, Model model) {
		logger.info("경로 : usermodifyPro");
		service.modifyPro(req, model);
		return "user/usermodifyPro";
	}
	
	// 1대1문의 글삭제
	@RequestMapping("/user/userdeletePro")
	public String userdeletePro(HttpServletRequest req, Model model) {
		logger.info("경로 : userdeletePro");
		service.userdeletePro(req, model);
		return "user/userdeletePro";
	}
	
	// 1 대 1 문의 댓글 달기
	@RequestMapping("/user/commentPro")
	public String commentPro(HttpServletRequest req, Model model) {
		service.board_comment(req, model);
		return "admin/commentPro";
	}
	
	@RequestMapping("/user/fundLogin")
	public String testPage(HttpServletRequest req, Model model) {
		service.confirmSession(req, model);
		return "user/fundLogin";
	}
	
	// 로딩 페이지
	@RequestMapping("/user/loading")
	public String loading(HttpServletRequest req, Model model) {
		service.confirmSession(req, model);
		return "user/loading";	
	}
	
	@RequestMapping("/user/loading2")
	public String loading2(HttpServletRequest req, Model model) {
		service.confirmSession(req, model);
		return "user/loading2";
	}
	
	// stock에서 로그아웃 처리
	@RequestMapping("/user/fund_logout")
	public String stockLogout(HttpSession session) {
		session.invalidate();
		return "user/fund_logout";
	}
	//김일광 끝
	
	//스마트컨트랙트 테스트 컨트롤러
	@RequestMapping("/user/createContract")
	public String createContract(HttpServletRequest req, Model model) {
		service.createContract(req, model);
		return "user/main";
	}
	
	@RequestMapping("/user/getContract")
	public String getContract(HttpServletRequest req, Model model) {
		service.getContract(req, model);
		return "user/main";
	}
	
	@RequestMapping("/user/callContract")
	public String callContract(HttpServletRequest req, Model model) throws Exception {
		service.callContract(req, model);
		service.fundingList(req,model);
		return "user/main";
	}
	
	@RequestMapping("/user/getInvestors")
	public String getInvestors(HttpServletRequest req, Model model) throws Exception {
		service.getInvestors(req, model);
		return "user/main";
	}
	
	@RequestMapping("/user/consentForm")
	public String consentForm(HttpServletRequest req, Model model) throws Exception {
		service.fundingDetail(req, model);
		return "funding/consentForm";
	}
	
	@RequestMapping("/user/contractForm")
	public String contractForm(HttpServletRequest req, Model model) throws Exception {
		service.fundingDetail(req, model);
		service.accountInfo(req, model);
		return "funding/contractForm";
	}
	
	@RequestMapping("/user/mypage")
	public String mypage(HttpServletRequest req, Model model) throws Exception {
		service.getMyAccount(req, model);
		service.getMyOwnTransaction(req, model);
		return "user/mypage";
	}
	
	@RequestMapping("/user/loadingContract")
	public String loadingContract(HttpServletRequest req, Model model) throws Exception {
		service.fundingDetail(req, model);
		return "funding/loadingContract";
	}
	
	@RequestMapping("/user/applicationFund")
	public String applicationFund(HttpServletRequest req, Model model) {
		service.applicationFund(req, model);
		return "user/applicationFund";
	}
	
	@RequestMapping("/user/confirmFundRequest")
	public String confirmFundRequest(HttpServletRequest req, Model model) {
		service.confirmRequestFund(req, model);
		return "admin/confirmFundRequest";
	}
	
	@RequestMapping("/user/completeConfirm")
	public String completeConfirm(HttpServletRequest req, Model model) {
		service.completeConfirm(req, model);
		return "admin/completeConfirm";
	}
	
   @RequestMapping("/user/error404")
   public String error404() {
	   return "user/error404";
   }
   
   @RequestMapping("/user/error500")
   public String error500() {
	   return "user/error500";
   }
}
