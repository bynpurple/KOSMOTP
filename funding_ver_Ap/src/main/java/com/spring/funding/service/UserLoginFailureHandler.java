package com.spring.funding.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

public class UserLoginFailureHandler implements AuthenticationFailureHandler{
	
	// 로그인이 실패할 경우 자동으로 실행되는 코드
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		
		request.setAttribute("errMsg", "아이디 또는 비밀번호가 일치하지 않습니다.");
		request.getRequestDispatcher("/WEB-INF/views/user/login.jsp").forward(request, response);
	}

}
