package com.spring.stock.service;

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

import com.spring.stock.vo.UserVO;

// UserDetailsService : 스프링 프레임웍에 내장된 인터페이스
// UserDetailsService : users 테이블의 정보를 가지고 인증처리를 위해서 사용자 상세정보를 제공하는 인터페이스
public class UserAuthenticationService implements UserDetailsService{
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder; 
	
	// 기본생성자
	public UserAuthenticationService() {}
	
	//매개변수 생성자
	public UserAuthenticationService(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
		
	}
	/* 핵심코드
	 * 
	 * 로그인 인증을 처리한 ㄴ코드
	 * 매개변수가 userid뿐이지만 패스워드까지 전달된다. (매개변수를 username => userid로 수정)
	 * 파라미터로 입력된 아이디값에 해당하는 테이블의 레코드를 읽어온다.
	 * 정보가 없으면 예외를 발생시키고, 있으면 해당 정보가 map(vo)로 리턴됨
	 */
	
	@Override
	public UserDetails loadUserByUsername(String uesrname) throws UsernameNotFoundException {
		
		// id와 패스워드가 불일치시 null이 넘어오고, 일치시 계정이 넘어온다.
		// 비밀번호 체크로직은 스프링 시큐리티안에 숨어있다.
	 	Map<String, Object> user = sqlSession.selectOne("com.spring.stock.persistence.StockDAO.selectUser",uesrname);
	 	System.out.println("로그인 체크 ===> " + user);
		
	 	// 인증실패시 인위적으로 예외를 발생
	 	if(user == null) throw new UsernameNotFoundException(uesrname);
	 	// ArrayList 먼저 import, GrantedAuthority import
	 	List<GrantedAuthority> authority = new ArrayList<GrantedAuthority>();
	 	// 데이터추가 컬럼명은 대문자여서 대문자로 준다
	 	authority.add(new SimpleGrantedAuthority(user.get("AUTHORITY").toString()));
	 	
	 	// 오라클에서는 필드명을 반드시 대문자로 취급
	 	// 오라클에서는 BigInteger 관련 오류가 발생할 수 있으므로 아래와 같이 처리
	 	
	 	// 사용자가 입력한 값과 테이블의 USERNAME(=id), PASSWORD(아래)를 비교해서 
	 	// 비밀번호가 불일치시 LoginFailure, 일치시 LoginSuccess
	 	//스프링 시큐리티에서 체크하는 아래 필드로 select시에 별칭을 줌, 테이블의 암호화된 비밀번호와  사용자가 입력한 비밀번호를 내부로직으로 비교처리-->
		return new UserVO(user.get("USERNAME").toString(),
				user.get("PASSWORD").toString(),
				(Integer)Integer.valueOf(user.get("ENABLED").toString()) == 1,
				true, true, true, authority);
	}

}
