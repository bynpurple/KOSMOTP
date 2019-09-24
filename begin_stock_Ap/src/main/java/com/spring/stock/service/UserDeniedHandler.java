package com.spring.stock.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

public class UserDeniedHandler implements AccessDeniedHandler{
	
	// 접근권한이 없는 경우 : 관리자페이지에 일반사용자가 접근하거나 허가받지 않은 사용자가 접근하는 경우 에러메시지 출력
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
			AccessDeniedException accessDeniedException) throws IOException, ServletException {
		
		request.setAttribute("errMsg", "관리자만 접근할 수 있는 페이지 입니다.");	
		request.getRequestDispatcher("/WEB-INF/views/user/denied.jsp").forward(request, response);
	}
}
