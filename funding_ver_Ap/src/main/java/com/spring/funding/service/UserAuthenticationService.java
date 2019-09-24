package com.spring.funding.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.spring.funding.vo.UserVO;


// UserDetailsService : 스프링 프레임웍에 내장된 인터페이스
// UserDetailsService : users 테이블의 정보를 가지고 인증처리를 위해서 사용자 상세정보를 제공하는 인터페이스
public class UserAuthenticationService implements UserDetailsService{
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder; 
	
	public UserAuthenticationService() {}
	
	public UserAuthenticationService(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
		
	}
	
	@Override
	public UserDetails loadUserByUsername(String uesrname) throws UsernameNotFoundException {
		
	 	Map<String, Object> user = sqlSession.selectOne("com.spring.funding.persistence.FundingDAO.selectUser",uesrname);
	 	System.out.println("로그인 체크 ===> " + user);
		
	 	if(user == null) throw new UsernameNotFoundException(uesrname);
	 	List<GrantedAuthority> authority = new ArrayList<GrantedAuthority>();
	 	authority.add(new SimpleGrantedAuthority(user.get("AUTHORITY").toString()));
	 	
		return new UserVO(user.get("USERNAME").toString(),
				user.get("PASSWORD").toString(),
				(Integer)Integer.valueOf(user.get("ENABLED").toString()) == 1,
				true, true, true, authority);
	}

}
